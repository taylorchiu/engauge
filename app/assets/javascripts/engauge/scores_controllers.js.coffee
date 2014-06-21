ScoresControllers = angular.module("ScoresControllers", [])

ScoresControllers.controller("ScoresCtrl", ["$scope", "$http", "$routeParams", "LessonFactory", "ScoresFactory", ($scope, $http, $routeParams, LessonFactory, ScoresFactory)->
	console.log("Hitting Scores Controller")
	console.log($routeParams.url)
	# load lesson to display lesson details and attach score to lesson
	$scope.lesson = LessonFactory.show({id: $routeParams.url});
	console.log($scope.lesson)
	
	# take user input for score, POST to score model
	$scope.addScore = ->
		ScoresFactory.create($scope.newScore)
		console.log($scope.newScore)
		$scope.newScore = {};
		# add logic to display the most recent score and update it when a new score is submitted

])