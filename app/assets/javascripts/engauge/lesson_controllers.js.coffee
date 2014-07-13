EngaugeControllers = angular.module("EngaugeControllers", [])

# LessonsCtrl for lessons index to show all lessons and create a new lesson

EngaugeControllers.controller("LessonsCtrl", ["$scope", "$http", "LessonsFactory", "$routeParams", ($scope, $http, LessonsFactory, $routeParams)->
	LessonsFactory.query (data)->
		$scope.lessons = data

	$scope.checkID = ()->
		!!$routeParams.id

	$scope.addLesson = ->
		LessonsFactory.save($scope.newLesson)
		console.log($scope.newLesson)
		$scope.newLesson = {}
		LessonsFactory.query (data)->
			$scope.lessons = data
		hide_form = !hide_form

	$scope.deleteLesson = ->
		console.log(@lesson)
		LessonsFactory.delete(@lesson)
		LessonsFactory.query (data)->
			$scope.lessons = data

])

# LessonDetailCtrl for viewing current lesson details (live view)

EngaugeControllers.controller("LessonDetailCtrl", ["$scope", "$http", "$routeParams", "LessonsFactory", "ScoresFactory", ($scope, $http, $routeParams, LessonsFactory, ScoresFactory)->
	console.log($scope.gage)

	if $routeParams.id
		LessonsFactory.get {id: $routeParams.id}, (data)->
			$scope.lesson = data

		array = []

		calculateAverage = (scores, gage) ->
			console.log(gage)
			console.log(scores)
			$scope.mean = 0
			if scores.length != 0
				sum = scores.reduce((x,y) -> 
				  x + parseInt(y.score)
				,0)
				console.log(sum)
				$scope.mean = sum / (scores.length)
				console.log("the mean is:" + $scope.mean)
				gage.value = $scope.mean.toFixed(3)
				gage.refresh(gage.value = $scope.mean.toFixed(3))
				console.log(gage.value)
			else
				$scope.mean = "No Scores Available"


		ScoresFactory.query { lesson_id: $routeParams.id},(data)->
			console.log(data)
			$scope.gage = new JustGage(
				id: "gauge"
				value: 2.5
				min: 0
				max: 5
				title: "Current Average"
			)
			console.log($scope.gage)
			calculateAverage(data, $scope.gage)

		# console.log("Showing scores of lesson id:" + $routeParams.id)


		ScoresFactory.longPoll 4000, () ->
			console.log "Long polling scores"
			ScoresFactory.query { lesson_id: $routeParams.id}, (data)->
				$scope.scores = data
				calculateAverage(data, $scope.gage)
				console.log("Showing scores of lesson id:" + $routeParams.id)
				console.log(data.length)
				if data.length == 0
					noScores = true

])



