timer.views.TrackTime = Backbone.View.extend
	tagName: 'section'
	className: 'track-time'
	initialize: ->
		@template = timer.templates.getTemplate 'track-time'
		@model.on 'change:running', @toggleTimer, this
		@startTrackingTime()
	toggleTimer: (model, running) ->
		@startTrackingTime() if running else @stopTrackingTime()
	startTrackingTime: ->
		log "Start tracking time for ", this.model.toJSON()
	stopTrackingTime: ->
		log "Stop tracking time."
	transitionIn: ->
		dfd = new $.Deferred()
		setTimeout dfd.resolve, 400
		this.$el.addClass('animated fadeIn')
		dfd.promise()
	transitionOut: ->
		dfd = new $.Deferred()
		setTimeout dfd.resolve, 400
		this.$el.addClass 'fadeOut'
		@model.set 'running', false
		dfd.promise()
	render: ->
		template = _.template @template
		this.$el.html(template(@model.toJSON()))
		@transitionIn()
		
		this;

