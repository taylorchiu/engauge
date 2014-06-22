StudentControllers = angular.module("StudentControllers", [])

StudentControllers.controller("StudentCtrl", ["$scope", "$http", "$routeParams", "LessonFactory", "ScoresFactory", ($scope, $http, $routeParams, LessonFactory, ScoresFactory)->
	$scope.url = $routeParams.url;
	console.log("Finding lesson by url: " + $scope.url)

	$scope.lesson = LessonFactory.show({id: $scope.url});
	console.log("Retrieving Lesson Details by url...")
	console.log($scope.lesson)

])