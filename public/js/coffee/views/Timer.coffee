timer.views.Timer = Backbone.View.extend
	tagName: 'article'
	className: 'timer'
	initialize: ->
		@addSlipView = new timer.views.AddSlip()
		@slipList = new timer.views.SlipList()
		@render()
	trackTime: (model) ->
		if @addSlipView
			@addSlipView.transitionOut().done => 
				@trackTimeView = new timer.views.TrackTime model: model
				this.$el.prepend @trackTimeView.render().el
				model.set 'running', true
				@trackTimeView.time.fitText(0.39)
		else 
			@trackTimeView = new timer.views.TrackTime({model: model})
	reset: ->
		if @trackTimeView
			@trackTimeView.transitionOut().done =>
				@trackTimeView.remove();
				@addSlipView.transitionIn();
		else 
			@addSlipView.transitionIn();
	render: ->
		this.$el.append @addSlipView.render().el
		this.$el.append @slipList.render().el
		$('#container').html this.$el
		return this;