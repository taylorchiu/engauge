EngaugeRouter = angular.module("EngaugeRouter", ["ngRoute"])

EngaugeRouter.config(["$routeProvider", "$locationProvider", ($routeProvider, $locationProvider) ->
	$routeProvider
		.when("/", {
		# this tells Angular what template to render at the "/" url
		templateUrl: "/engauge_templates/index",
		controller: "LessonsCtrl"
	})
		# .when("/lessons/:id", {
		# 	templateUrl: "/engauge_templates/index",
		# 	controller: "LessonDetailCtrl")
		# })
		# .otherwise({
		# 	redirectTo: "/books"
		# })
	$locationProvider.html5Mode(true)
])

