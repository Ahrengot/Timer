timer.views.Timer = Backbone.View.extend
	tagName: 'article'
	className: 'timer'
	initialize: ->
		@addSlipView = new timer.views.AddSlip()
		@slipList = new timer.views.SlipList()
		@render()
	trackTime: (model) ->
		if @addSlipView? then @addSlipView.transitionOut().done =>
			@addSlipView.remove()
			@addSlipView = null
			@addTrackTimeView model
		
		if @trackTimeView? then @trackTimeView.transitionOut().done =>
			@trackTimeView.remove()
			@addTrackTimeView model
	addTrackTimeView: (model) ->
		@trackTimeView = new timer.views.TrackTime model: model
		@$el.prepend @trackTimeView.render().el
		model.set 'running', on
		@trackTimeView.time.fitText(0.39)
	reset: ->
		if @trackTimeView
			@trackTimeView.transitionOut().done =>
				@trackTimeView.remove()
				@addSlipView.transitionIn()
		else 
			@addSlipView.transitionIn()
	render: ->
		this.$el.append @addSlipView.render().el
		this.$el.append @slipList.render().el
		$('#container').html this.$el
		return this;