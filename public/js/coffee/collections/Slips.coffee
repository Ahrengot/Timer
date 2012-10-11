timer.collections.Slips = Backbone.Collection.extend
	url: "#{window.BASE_URL}/slips/"
	model: timer.models.Slip,
	initialize: -> 
		@loadingDfd = new $.Deferred()
		this.on 'reset', => @loadingDfd.resolve()