timer.views.SlipList = Backbone.View.extend
	tagName: 'section'
	className: 'slips-list'
	initialize: ->
		@template = timer.templates.getTemplate 'slips-list'
		timer.slips.on('reset', @render, this);
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
		this.$el.html(template(slips: timer.slips.first(5)))
		@transitionIn()

		this
