EngaugeControllers = angular.module("EngaugeControllers", [])

# LessonsCtrl for lessons index to show all lessons and create a new lesson

EngaugeControllers.controller("LessonsCtrl", ["$scope", "$http", "LessonsFactory", "LessonFactory", ($scope, $http, LessonsFactory, LessonFactory)->
	$scope.lessons = LessonsFactory.query();

	LessonsFactory.query (data)->
		console.log("RETRIEVED ALL LESSONS!")
		$scope.lessons = data

	$scope.addLesson = ->
		LessonsFactory.create($scope.newLesson)
		console.log($scope.newLesson)
		$scope.newLesson = {}
		$scope.lessons = LessonsFactory.query();

	$scope.deleteLesson = ->
		console.log(@lesson)
		LessonFactory.delete(@lesson)
		$scope.lessons = LessonsFactory.query();

])

# LessonDetailCtrl for viewing current lesson details (live view)

EngaugeControllers.controller("LessonDetailCtrl", ["$scope", "$http", "$routeParams", "LessonFactory", ($scope, $http, $routeParams, LessonFactory)->
	$scope.lesson = LessonFactory.show({id: $routeParams.id});
	console.log("hitting the LessonDetailCtrl")
	console.log($routeParams.id)

])