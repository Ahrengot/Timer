timer.collection.Slips = Backbone.Collection.extend
	url: "#{window.BASE_URL}/slips/"
	model: timer.model.Slip
	parse: (result) -> result