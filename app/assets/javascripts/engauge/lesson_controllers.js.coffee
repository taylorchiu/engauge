EngaugeControllers = angular.module("EngaugeControllers", [])

# LessonsCtrl for lessons index to show all lessons and create a new lesson

EngaugeControllers.controller("LessonsCtrl", ["$scope", "$http", "LessonsFactory", ($scope, $http, LessonsFactory)->
	$scope.lessons = LessonsFactory.query();

	LessonsFactory.longPoll 6000, ()->
		this.query (data)->
			console.log("RETRIEVED ALL LESSONS!")
			$scope.lessons = data


	$scope.addLesson = ->
		LessonsFactory.save($scope.newLesson)
		console.log($scope.newLesson)
		$scope.newLesson = {}
		$scope.lessons = LessonsFactory.query();
		hide_form = !hide_form

	$scope.deleteLesson = ->
		console.log(@lesson)
		LessonsFactory.delete(@lesson)
		$scope.lessons = LessonsFactory.query();


])

# LessonDetailCtrl for viewing current lesson details (live view)

EngaugeControllers.controller("LessonDetailCtrl", ["$scope", "$http", "$routeParams", "LessonsFactory", "ScoresFactory", ($scope, $http, $routeParams, LessonsFactory, ScoresFactory)->
	$scope.lesson = LessonsFactory.get({id: $routeParams.id});

	
	array = []

	calculateAverage = (array, gage) -> 
		mean = 0
		$scope.mean = 0
		console.log(gage)
		if array.length != 0
			sum = array.reduce (x,y) -> x + y
			$scope.mean = sum / (array.length)
			mean = sum / (array.length)
			console.log("the mean is:" + mean)
			gage.value = mean.toFixed(3)
			gage.refresh(gage.value = mean.toFixed(3))
			console.log(gage.value)
		else
			mean = "No Scores Available"
		return mean


	$scope.scores = ScoresFactory.query({ lesson_id: $routeParams.id})
	$scope.scores.$promise.then (data)->
			console.log data[0].score
			for i of data
				if data[i].score != undefined
					array.push(data[i].score)
			console.log array

			$scope.gage = new JustGage(
				  id: "gauge"
				  value: 3
				  min: 0
				  max: 5
				  title: "Current Average"
				  refreshAnimationTime: 1000
				  refreshAnimationType: "bounce"
				)
			calculateAverage(array, $scope.gage)

	console.log("Showing scores of lesson id:" + $routeParams.id)
	console.log($scope.scores)


	ScoresFactory.longPoll 4000, () ->
		$scope.scores = ScoresFactory.query({ lesson_id: $routeParams.id})
		$scope.scores.$promise.then (data)->
			console.log data[0].score
			for i of data
				if data[i].score != undefined
					array.push(data[i].score)
			console.log array
			calculateAverage(array, $scope.gage)
		console.log("Showing scores of lesson id:" + $routeParams.id)
		console.log($scope.scores)


])



