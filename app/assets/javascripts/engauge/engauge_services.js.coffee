EngaugeServices = angular.module("EngaugeServices", [])

EngaugeServices.factory("LessonsFactory", ["$resource", ($resource)->
	$resource("/lessons.json", {}, {
		query: { method: 'GET', isArray: true },
		create: { method: 'POST' }
	})
])

EngaugeServices.factory("LessonFactory", ["$resource", ($resource)->
	$resource("/lessons/:id.json", {id: "@id"}, {
		show: { method: 'GET', params: {id: '@id' } },
		update: { method: 'PUT', params: {ide: '@id' } },
		destroy: { method: 'DELETE', params: {id: '@id'} }
	})
])