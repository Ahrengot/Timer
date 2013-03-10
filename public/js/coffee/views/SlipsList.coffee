timer.views.SlipList = Backbone.View.extend
	tagName: 'section'
	className: 'slips-list'
	events:
		'click tbody tr': 'switchTimer'
	initialize: ->
		@template = timer.templates.getTemplate 'slips-list'
		timer.slips.on('reset add', @render, this)
	switchTimer: (e) ->
		slip = e.currentTarget.childNodes[1].innerText
		timer.router.navigate "/track/#{escape(slip)}", true
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
		this.$el.html template(slips: timer.slips.toArray())
		@transitionIn()

		this
