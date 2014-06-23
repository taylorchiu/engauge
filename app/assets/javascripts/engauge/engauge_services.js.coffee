EngaugeServices = angular.module("EngaugeServices", [])

# the $resource object comes equipped with all CRUD methods, so we don't need to list them here
EngaugeServices.factory("LessonsFactory", ["$resource", ($resource)->
	resource = $resource("/lessons/:id.json", {id: '@id' }, {
		update: { method: 'PUT', params: {id: '@id' } },
	})

	resource.pollID = null

	resource.longPoll = (interval, callback)->
		if resource.pollID != null
			clearInterval(resource.pollID)
		 
		resource.pollID = setInterval ()->
			callback.call(resource)

		, interval
	
	resource.stopPoll = ()->
			clearInterval(resource.pollID)

	resource
])

EngaugeServices.factory("ScoresFactory", ["$resource", ($resource)->
	resource = $resource("/lessons/:lesson_id/scores.json", {lesson_id: '@lesson_id'}, {
		query: { method: 'GET', isArray: true, params: {lesson_id: '@lesson_id'} },
		create: { method: 'POST' }
		})
	
	# longPoll function takes an interval and a method to continually call
	resource.longPoll = (interval, callback)->
		# protect against calling the same poll twice
		if resource.pollID != null
			clearInterval(resource.pollID)
		# setInterval takes a callback function 
		# the setInterval function returns a pollID, which we can use to track each poll
		resource.pollID = setInterval ()->
			callback.call(resource)

		, interval
	
	resource.stopPoll = ()->
			clearInterval(resource.pollID)

	resource
])