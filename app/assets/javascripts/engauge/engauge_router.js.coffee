EngaugeRouter = angular.module("EngaugeRouter", ["ngRoute"])

EngaugeRouter.config(["$routeProvider", "$locationProvider", ($routeProvider, $locationProvider) ->
	$routeProvider
		.when("/", {
		# this tells Angular what template to render at the root path
		templateUrl: "/engauge_templates/index",
		controller: "LessonsCtrl"
	})
		.when("/lessons/:id", {
			templateUrl: "/engauge_templates/show",
			controller: "LessonDetailCtrl"
		})
		.otherwise({
			redirectTo: "/"
		})
	$locationProvider.html5Mode(true)
])

