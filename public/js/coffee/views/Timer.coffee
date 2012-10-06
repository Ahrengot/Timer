timer.view.Timer = Backbone.View.extend
	tagName: 'article'
	className: 'timer'
	initialize: ->
		@addSlipView = new timer.view.AddSlip()
		@slipList = new timer.view.SlipList()
		@render()
	trackTime: ->
		@addSlipView.transitionOut().done =>
			model = timer.slips.where('running': true)[0]
			@trackTimeView = new timer.view.TrackTime({model: model})
	reset: ->
		@trackTimeView.transitionOut().done =>
			@trackTimeView.destroy();
			@addSlipView.transitionIn();
	render: ->
		this.$el.append @addSlipView.render().el
		this.$el.append @slipList.render().el

		$('#container').html this.$el
		return this;