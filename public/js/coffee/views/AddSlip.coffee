timer.views.AddSlip = Backbone.View.extend
	tagName: 'section'
	className: 'add-slip'
	events:
		'click button': 'addNewSlip'
	initialize: ->
		@template = timer.templates.getTemplate 'add-slip'
	transitionIn: ->
		dfd = new $.Deferred()
		setTimeout dfd.resolve, 400
		this.$el.addClass('animated fadeIn')
		dfd.promise()
	addNewSlip: ->
		description = prompt 'Enter slip name'
		return if description is null # <-- User clicked cancel button
		if description is '' then return alert 'You need to enter a slip name' # <-- Prevent empty slip names
		if timer.slips.where('description': description) > 0 then return alert 'A slip with that name already exists' # <-- Prevent duplicate slips

		timer.slips.add { description, 'running': no }
			
		timer.router.navigate "/track/#{escape(description)}", true
	render: ->
		template = _.template @template
		log "rendering"
		this.$el.html template( slips: timer.slips.toArray() )
		@transitionIn()

		return @
	transitionOut: ->
		dfd = new $.Deferred()
		setTimeout dfd.resolve, 400
		this.$el.addClass('fadeOut')
		dfd.promise()

