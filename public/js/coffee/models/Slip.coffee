timer.model.Slip = Backbone.Model.extend
	defaults:
		'running': no
		'description': ''
		'duration': 0
	urlRoot: 'slips/'