timer.router.MainRouter = Backbone.Router.extend
	routes: 
		'start/:term': 'startTimer'
		'stop/:term': 'stopTimer'
		'reset/:term': 'resetTimer'
	initialize: ->
		timer.templates = new TemplateController()
		timer.slips = new timer.collection.Slips()
		timer.slips.on 'reset', @initApplication, this

		log "Initialzed new instance of timer.router.MainRouter"
	initApplication: ->
		log "Successfully fetched time slips from the server."
	startTimer: (desc) ->
		log "Starting timer for #{desc}"
	stopTimer: (desc) ->
		log "Stopping timer for #{desc}"
	resetTimer: (desc) ->
		log "Resetting timer for #{desc}"