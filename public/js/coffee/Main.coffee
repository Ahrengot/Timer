namespace 'timer.views'
namespace 'timer.models'
namespace 'timer.collections'
namespace 'timer.router'

# Initialize app when DOM is ready
$ -> 
	timer.router = new timer.router.MainRouter()
	Backbone.history.start(pushState:false)