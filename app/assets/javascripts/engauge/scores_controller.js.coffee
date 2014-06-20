EngaugeControllers.controller("ScoresCtrl", ["$scope", "$http", ($scope, $http)->
	$scope.lesson_id = $routeParams.id


	$http.get("/students/#{$scope.lesson_id}.json")
		.success((data)-> $scope.lesson = data)
])