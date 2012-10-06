timer.collection.Slips = Backbone.Collection.extend
	model: timer.model.Slip
	parse: (result) -> result