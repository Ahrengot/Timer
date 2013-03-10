timer.router.MainRouter = Backbone.Router.extend
	routes: 
		'track/:term': 'startTimer'
		'reset/:term': 'resetTimer'
		'': 'stopTimer'
	initialize: ->
		timer.templates = new TemplateController()
		timer.templates.addTemplate 'track-time'
		timer.templates.addTemplate 'add-slip'
		timer.templates.addTemplate 'slips-list'

		timer.slips = new timer.collections.Slips()
		timer.view = new timer.views.Timer()

		timer.slips.fetch();
	startTimer: (desc) ->
		timer.slips.loadingDfd.done =>
			model = timer.slips.where('description': unescape(desc))[0]
			return this.navigate('/', true) unless model  # <-- Reset URL if no match was found
			
			timer.view.trackTime model
			model.save() if model.isNew()
	stopTimer: (desc) ->
		timer.view.reset()
	resetTimer: (desc) ->
		