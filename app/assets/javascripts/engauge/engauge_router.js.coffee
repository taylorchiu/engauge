EngaugeRouter = angular.module("EngaugeRouter", ["ngRoute"])

EngaugeRouter.config(["$routeProvider", "$locationProvider", ($routeProvider, $locationProvider) ->
	$routeProvider
		.when("/", {
			templateUrl: "/static_pages/home_template"
		})
		.when("/lessons", {
		# this tells Angular what template to render at the root path
		templateUrl: "/engauge_templates/index",
		controller: "LessonsCtrl"
		})
		.when("/lessons/:id", {
			templateUrl: "/engauge_templates/index",
			controller: "LessonsCtrl"
		})
		.when("/students/:url", {
			templateUrl: "/engauge_templates/student",
			controller: "ScoresCtrl"
		})
		.when("/users/sign_up", {
			templateUrl: "/users_templates/sign_up_form"
		})
		.when("/users/sign_in", {
			templateUrl: "/sessions_templates/sign_in_form"
		})
		
	$locationProvider.html5Mode(true)
])

