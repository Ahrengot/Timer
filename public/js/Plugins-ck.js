// Enable logging without breaking dumb browsers. Use log('whatever'), not console.log('whatever').
function namespace(e){var t=e.split("."),n=window,r="";for(var i=0,s=t.length;i<s;i++){r=t[i];n[r]=n[r]||{};n=n[r]}return n}window.log=function(){log.history=log.history||[];log.history.push(arguments);if(this.console){arguments.callee=arguments.callee.caller;var e=[].slice.call(arguments);typeof console.log=="object"?log.apply.call(console.log,console,e):console.log.apply(console,e)}};(function(e){function t(){}for(var n="assert,count,debug,dir,dirxml,error,exception,group,groupCollapsed,groupEnd,info,log,timeStamp,profile,profileEnd,time,timeEnd,trace,warn".split(","),r;r=n.pop();)e[r]=e[r]||t})(function(){try{console.log();return window.console}catch(e){return window.console={}}}());var TemplateController=function(){this.templates={};this.addTemplate=function(e){this.templates[e]=$("#template-"+e).html()};this.getTemplate=function(e){return this.templates[e]}};