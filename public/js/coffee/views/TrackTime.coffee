timer.views.TrackTime = Backbone.View.extend
	tagName: 'section'
	className: 'track-time'
	events: 
		'click button.resume, button.stop': 'toggleTimeTracking'
		'click button.reset': 'resetTimer'
	initialize: ->
		@template = timer.templates.getTemplate 'track-time'
		@model.on 'change:running', @toggleTimer, this
		@model.on 'change:duration', @updateTime, this
	toggleTimeTracking: ->
		@model.set 'running', !@model.get('running')
	toggleTimer: (model, running) ->
		if running then @startTrackingTime() else @stopTrackingTime()
	startTrackingTime: ->
		@timer = setInterval => 
				oldTime = parseInt(@model.get('duration'), 10)
				@model.set('duration', oldTime + 1)
			, 1000

		@stopBtn.text('Stop').removeClass('resume').addClass('stop red')
	updateTime: (model, totalSec) ->
		hour	= Math.floor(totalSec / 3600)
		min		= Math.floor((totalSec / 60) % 60)
		sec		= totalSec % 60

		hour = "0" + hour if hour < 10
		min = "0" + min if min < 10
		sec = "0" + sec if sec < 10

		@time.text "#{hour}:#{min}:#{sec}"
		@model.save() if totalSec % 5 is 0 # <-- Save model every 5 seconds.
	stopTrackingTime: ->
		clearInterval @timer
		@stopBtn.text('Resume').removeClass('red stop').addClass('resume')
		@model.save()
	resetTimer: ->
		@stopTrackingTime()
		@model.set 'duration', 0
		@startTrackingTime() if @model.get('running')
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
		
		@time = this.$el.find 'time'
		@stopBtn = this.$el.find 'button.toggle-timer'

		@transitionIn()
		this;


