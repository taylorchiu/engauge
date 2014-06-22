EngaugeRouter = angular.module("EngaugeRouter", ["ngRoute"])

EngaugeRouter.config(["$routeProvider", "$locationProvider", ($routeProvider, $locationProvider) ->
	$routeProvider
		.when("/", {
		templateUrl: "/engauge_templates/index",
		controller: "LessonsCtrl"
		})
		# .when("/lessons/:id", {
		# 	templateUrl: "/engauge_templates/show",
		# 	controller: "LessonDetailCtrl"
		# })
		.when("/lessons/:lesson_id/scores", {
			templateUrl: "/engauge_templates/show",
			controller: "ScoresCtrl"
		})
		.when("/students/:url", {
			templateUrl: "/engauge_templates/student",
			controller: "StudentCtrl"
		})
		.otherwise({
			redirectTo: "/"
		})
	$locationProvider.html5Mode(true)
])

