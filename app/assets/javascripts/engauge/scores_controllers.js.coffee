ScoresControllers = angular.module("ScoresControllers", [])

ScoresControllers.controller("ScoresCtrl", ["$scope", "$http", "$routeParams", "LessonsFactory", "ScoresFactory", ($scope, $http, $routeParams, LessonsFactory, ScoresFactory)->
	console.log("Hitting Scores Controller")
	console.log($routeParams.url)
	# load lesson to display lesson details and attach score to lesson
	$scope.lesson = LessonsFactory.get({id: $routeParams.url});
	console.log($scope.lesson)
	
	# take user input for score, POST to score model
	$scope.addScore = ->
		ScoresFactory.create({score: $scope.newScore, lesson_id: $scope.lesson.id})
		# pass in the lesson_id so that ScoresFactory knows what route to Post to
		console.log($scope.newScore)
		$scope.lastScore = $scope.newScore.score
		$scope.newScore = {};
		# add logic to display the most recent score and update it when a new score is submitted
	
])