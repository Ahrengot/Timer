timer.router.MainRouter = Backbone.Router.extend
	routes: 
		'track/:term': 'startTimer'
		'reset/:term': 'resetTimer'
		'': 'stopTimer'
		'': 'stopTimer'
	initialize: ->
		timer.templates = new TemplateController()
		timer.templates.addTemplate 'track-time'
		timer.templates.addTemplate 'add-slip'
		timer.templates.addTemplate 'slips-list'

		timer.slips = new timer.collection.Slips()
		timer.view = new timer.view.Timer()

		timer.slips.fetch();
	startTimer: (desc) ->
		model = timer.slips.where('description': unescape(desc))[0]
		return this.navigate('/', true) unless model  # <-- Reset URL if no match was found

		log "Starting timer for #{desc} – Model: ", model, ". Collection: ", timer.slips
		#timer.view.trackTime()
	stopTimer: (desc) ->
		log "Stopping timer for #{desc}"
		timer.view.reset()
	resetTimer: (desc) ->
		log "Resetting timer for #{desc}"