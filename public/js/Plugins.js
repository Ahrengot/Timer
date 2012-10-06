// Enable logging without breaking dumb browsers. Use log('whatever'), not console.log('whatever').
window.log=function(){log.history=log.history||[];log.history.push(arguments);if(this.console){arguments.callee=arguments.callee.caller;var a=[].slice.call(arguments);(typeof console.log==="object"?log.apply.call(console.log,console,a):console.log.apply(console,a))}};
(function(b){function c(){}for(var d="assert,count,debug,dir,dirxml,error,exception,group,groupCollapsed,groupEnd,info,log,timeStamp,profile,profileEnd,time,timeEnd,trace,warn".split(","),a;a=d.pop();){b[a]=b[a]||c}})((function(){try
{console.log();return window.console;}catch(err){return window.console={};}})());

/**
*   Basic JavaScript Part 8: Namespaces - by. Jan Van Ryswyck
*   http://elegantcode.com/2011/01/26/basic-javascript-part-8-namespaces/   
*/
function namespace(namespaceString) {
	var parts = namespaceString.split('.'),
	parent = window,
	currentPart = '';

	for (var i = 0, length = parts.length; i < length; i++) {
		currentPart = parts[i];
		parent[currentPart] = parent[currentPart] || {};
		parent = parent[currentPart];
	}

	return parent;
}

/**
 * TEMPLATE CONTROLLER
 * Eases the use of templates by storing the cached jQuery templates on a single object.
 */
 var TemplateController = function() {
	this.templates = {};

	this.addTemplate = function(id) {
		this.templates[id] = $('#template-' + id).html();
	};

	this.getTemplate = function(id) {
		return this.templates[id];
	};
 };