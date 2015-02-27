/* global requirejs */
requirejs.config({
	baseUrl: 'javascripts',
	paths: {
		bootstrap: '../libs/bootstrap/dist/js/bootstrap',
		domReady: '../libs/domReady/domReady',
		html5shiv: '../libs/html5shiv/dist/html5shiv',
		jquery: '../libs/jquery/dist/jquery',
		requirejs: '../libs/requirejs/require',
		respond: '../libs/respond/dest/respond.src',
		retina: '../libs/retina.js/build/js/retina-1.2.0'
	},
	shim: {
		bootstrap: {
			deps: [
				'jquery'
			]
		}
	},
	packages: [

	]
});