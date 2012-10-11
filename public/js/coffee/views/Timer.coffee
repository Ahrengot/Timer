timer.view.Timer = Backbone.View.extend
	tagName: 'article'
	className: 'timer'
	initialize: ->
		@addSlipView = new timer.view.AddSlip()
		@slipList = new timer.view.SlipList()
		@render()
	trackTime: (model) ->
		if @addSlipView
			@addSlipView.transitionOut().done =>
				@trackTimeView = new timer.view.TrackTime({model: model})
		else 
			@trackTimeView = new timer.view.TrackTime({model: model})
	reset: ->
		if @trackTimeView
			@trackTimeView.transitionOut().done =>
				@trackTimeView.destroy();
				@addSlipView.transitionIn();
		else 
			@addSlipView.transitionIn();
	render: ->
		this.$el.append @addSlipView.render().el
		this.$el.append @slipList.render().el

		$('#container').html this.$el
		return this;