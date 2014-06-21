ScoresControllers = angular.module("ScoresControllers", [])

ScoresControllers.controller("ScoresCtrl", ["$scope", "$http", "$routeParams", "LessonFactory", "ScoresFactory", ($scope, $http, $routeParams, LessonFactory, ScoresFactory)->
	console.log("Hitting Scores Controller")
	# load lesson to display lesson details and attach score to lesson
	$scope.lesson = LessonFactory.show({id: $routeParams.url});
	# scope.v.Dt = Date.parse(scope.v.Dt);
	console.log($scope.lesson.created_at)
	# $scope.lesson.created_at = Date.parse($scope.lesson.created_at);

	
	# take user input for score, POST to score model
	$scope.addScore = ->
		ScoresFactory.create({score: $scope.newScore, lesson_id: $scope.lesson.id})
		# pass in the lesson_id so that ScoresFactory knows what route to Post to
		console.log($scope.newScore)
		$scope.newScore = {};
		# add logic to display the most recent score and update it when a new score is submitted

])