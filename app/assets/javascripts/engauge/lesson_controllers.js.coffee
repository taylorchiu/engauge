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

	calculateAverage = (scores, gage) -> 
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


	$scope.scores = ScoresFactory.query({ lesson_id: $routeParams.id})
	$scope.scores.$promise.then (data)->
			$scope.gage = new JustGage(
				  id: "gauge"
				  value: 3
				  min: 0
				  max: 5
				  title: "Current Average"
				)
			calculateAverage(data, $scope.gage)

	console.log("Showing scores of lesson id:" + $routeParams.id)
	console.log($scope.scores)

	# Get the context of the canvas element we want to select
	ctx = document.getElementById("myChart").getContext("2d")
	myNewChart = new Chart(ctx).PolarArea(data)
	data =
		  labels: [
		    "January"
		    "February"
		    "March"
		    "April"
		    "May"
		    "June"
		    "July"
		  ]
		  datasets: [
	    {
	      fillColor: "rgba(220,220,220,0.5)"
	      strokeColor: "rgba(220,220,220,1)"
	      pointColor: "rgba(220,220,220,1)"
	      pointStrokeColor: "#fff"
	      data: [
	        65
	        59
	        90
	        81
	        56
	        55
	        40
	      ]
	    }
	    {
	      fillColor: "rgba(151,187,205,0.5)"
	      strokeColor: "rgba(151,187,205,1)"
	      pointColor: "rgba(151,187,205,1)"
	      pointStrokeColor: "#fff"
	      data: [
	        28
	        48
	        40
	        19
	        96
	        27
	        100
	      ]
	    }
  	]

	new Chart(ctx).Line(data)


	ScoresFactory.longPoll 4000, () ->
		$scope.scores = ScoresFactory.query({ lesson_id: $routeParams.id})
		$scope.scores.$promise.then (data)->
			calculateAverage(data, $scope.gage)
			console.log("Showing scores of lesson id:" + $routeParams.id)
])



