ScoresControllers = angular.module("ScoresControllers", [])

ScoresControllers.controller("ScoresCtrl", ["$scope", "$http", "$routeParams", "LessonFactory", "ScoresFactory", ($scope, $http, $routeParams, LessonFactory, ScoresFactory)->
	# $scope.scores = ScoresFactory.query();
	$scope.lesson_id = $routeParams.lesson_id;
	console.log("Loading $scope.lesson_id = " + $scope.lesson_id)

	# load lesson to display lesson details and attach score to lesson
	## Refactor - shouldn't call a LessonFactory inside a ScoresController, but removing it causes errors
	$scope.lesson = LessonFactory.show({id: $scope.lesson_id});
	console.log("Retrieving lesson object by id...")
	console.log($scope.lesson)

	$scope.scores = ScoresFactory.query(lesson_id: $scope.lesson_id);
	console.log("Retrieving scores array...")
	console.log($scope.scores)
	
	ScoresFactory.query (data)->
		console.log("Retrieved all Scores")
		$scope.scores = data

	$scope.addScore = ->
		ScoresFactory.create({score: $scope.newScore, lesson_id: $scope.lesson_id})
		# passes in the lesson_id so that ScoresFactory knows what route to Post to
		console.log($scope.newScore)
		$scope.current_score = $scope.newScore.score;
		$scope.newScore = {};
])