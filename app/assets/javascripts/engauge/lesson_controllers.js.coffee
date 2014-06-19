EngaugeControllers = angular.module("EngaugeControllers", [])

# Need a LessonDetailCtrl

EngaugeControllers.controller("LessonsCtrl", ["$scope", "$http", "LessonsFactory", "LessonFactory", ($scope, $http, LessonsFactory, LessonFactory)->
	$scope.lessons = LessonsFactory.query();

	LessonsFactory.query (data)->
		console.log("RETRIEVED ALL LESSONS!")
		$scope.lessons = data

	$scope.addLesson = ->
		console.log($scope.newLesson)
		LessonsFactory.create($scope.newLesson)
		$scope.newLesson = {}
		$scope.lessons = LessonsFactory.query();

	$scope.deleteLesson = ->
		console.log(@lesson)
		LessonFactory.delete(@lesson)
		$scope.lessons = LessonsFactory.query();

])