EngaugeApp = angular.module("EngaugeApp", [
	"ngRoute",
	"ngResource",
	"EngaugeServices",
	"EngaugeControllers",
	"ScoresControllers",
	"StudentControllers",
	"EngaugeRouter",
	])

EngaugeApp.config(["$httpProvider", ($httpProvider)->
	$httpProvider.defaults.headers.common['X-CSRF-Token'] = $('meta[name=csrf-token]').attr('content')
])