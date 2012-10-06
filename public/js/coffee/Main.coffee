namespace 'timer.view'
namespace 'timer.model'
namespace 'timer.collection'
namespace 'timer.router'

# Initialize app when DOM is ready
$ -> 
	timer.router = new timer.router.MainRouter()
	Backbone.history.start(pushState:false)