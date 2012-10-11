timer.views.Timer = Backbone.View.extend
	tagName: 'article'
	className: 'timer'
	initialize: ->
		@addSlipView = new timer.views.AddSlip()
		@slipList = new timer.views.SlipList()
		@render()
	trackTime: (model) ->
		if @addSlipView then @addSlipView.transitionOut().done => @trackTimeView = new timer.views.TrackTime({model: model})
		else @trackTimeView = new timer.views.TrackTime({model: model})
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