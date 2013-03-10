# @codekit-append "models/Slip.coffee"
# @codekit-append "collections/Slips.coffee"
# @codekit-append "views/AddSlip.coffee"
# @codekit-append "views/SlipsList.coffee"
# @codekit-append "views/TrackTime.coffee"
# @codekit-append "views/Timer.coffee"
# @codekit-append "routers/MainRouter.coffee"

namespace 'timer.views'
namespace 'timer.models'
namespace 'timer.collections'
namespace 'timer.router'

# Initialize app when DOM is ready
$ -> 
	timer.router = new timer.router.MainRouter()
	Backbone.history.start(pushState:false)