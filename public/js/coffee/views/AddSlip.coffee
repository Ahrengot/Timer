timer.view.AddSlip = Backbone.View.extend
	tagName: 'section'
	className: 'add-slip'
	initialize: ->
		@template = timer.templates.getTemplate 'add-slip'
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

		this

