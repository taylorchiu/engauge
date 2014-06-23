EngaugeControllers = angular.module("EngaugeControllers", [])

# LessonsCtrl for lessons index to show all lessons and create a new lesson

EngaugeControllers.controller("LessonsCtrl", ["$scope", "$http", "LessonsFactory", ($scope, $http, LessonsFactory)->
	$scope.lessons = LessonsFactory.query();


	LessonsFactory.longPoll 6000, ()->
		this.query (data)->
			console.log("RETRIEVED ALL LESSONS!")
			$scope.lessons = data

	# LessonsFactory.query (data)->
	# 	console.log("RETRIEVED ALL LESSONS!")
	# 	$scope.lessons = data

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

EngaugeControllers.controller("LessonDetailCtrl", ["$scope", "$http", "$routeParams", "LessonsFactory", "ScoresFactory", ($scope, $http, $routeParams, LessonsFactory, ScoresFactory)->
	$scope.lesson = LessonsFactory.get({id: $routeParams.id});

	$scope.scores = ScoresFactory.query({ lesson_id: $routeParams.id})
	console.log("Showing scores of lesson id:" + $routeParams.id)
	console.log($scope.scores)

	ScoresFactory.longPoll 12000, ()->
		$scope.scores = ScoresFactory.query({ lesson_id: $routeParams.id})
		console.log("Showing scores of lesson id:" + $routeParams.id)
		console.log($scope.scores)
		


])