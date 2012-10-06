timer.view.TrackTime = Backbone.View.extend
	tagName: 'section'
	className: 'track-time'
	initialize: ->
		log "New Track Time view initialized"
		@template = timer.templates.getTemplate 'track-time'
		@model.on 'change:running', @toggleTimer, this
		@startTrackingTime()
	toggleTimer: (model, running) ->
		@startTrackingTime() if running else @stopTrackingTime()
	startTrackingTime
	transitionIn: ->
		dfd = new $.Deferred()
		setTimeout dfd.resolve, 1000
		this.$el.addClass('animated fadeIn')
		dfd.promise()
	transitionOut: ->
		dfd = new $.Deferred()
		setTimeout dfd.resolve, 1000
		this.$el.addClass('fadeOut')
		dfd.promise()
	render: ->
		template = _.template @template
		this.$el.html(template({}))
		@transitionIn()
		
		this;

