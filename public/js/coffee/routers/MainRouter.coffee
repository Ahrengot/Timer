timer.router.MainRouter = Backbone.Router.extend
	routes: 
		'start/:term': 'startTimer'
		'stop/:term': 'stopTimer'
		'reset/:term': 'resetTimer'
	initialize: ->
		timer.templates = new TemplateController()
		timer.templates.addTemplate 'track-time'
		timer.templates.addTemplate 'add-slip'
		timer.templates.addTemplate 'slips-list'

		timer.slips = new timer.collection.Slips()
		timer.view = new timer.view.Timer()

		timer.slips.fetch();
	startTimer: (desc) ->
		log "Starting timer for #{desc}"
	stopTimer: (desc) ->
		log "Stopping timer for #{desc}"
	resetTimer: (desc) ->
		log "Resetting timer for #{desc}"