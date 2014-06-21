ScoresControllers = angular.module("ScoresControllers", [])

ScoresControllers.controller("ScoresCtrl", ["$scope", "$http", "$routeParams", "LessonFactory", "ScoresFactory", ($scope, $http, $routeParams, LessonFactory, ScoresFactory)->
	$scope.scores = ScoresFactory.query();
	console.log("Hitting Scores Controller")

	# load lesson to display lesson details and attach score to lesson
	$scope.lesson = LessonFactory.show({id: $routeParams.url});
	ScoresFactory.query (data)->
		console.log("Retrieved all Scores")
		$scope.scores = data

	# scope.v.Dt = Date.parse(scope.v.Dt);
	console.log($scope.lesson.created_at)
	# $scope.lesson.created_at = Date.parse($scope.lesson.created_at);

	
	# take user input for score, POST to score model
	$scope.addScore = ->
		ScoresFactory.create({score: $scope.newScore, lesson_id: $scope.lesson.id})
		# passes in the lesson_id so that ScoresFactory knows what route to Post to
		console.log($scope.newScore)
		$scope.current_score = $scope.newScore.score;
		$scope.newScore = {};
])