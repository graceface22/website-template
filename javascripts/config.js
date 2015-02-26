/* global requirejs */
requirejs.config({
	baseUrl: 'javascripts',
	paths: {
		bootstrap: '../libs/bootstrap/dist/js/bootstrap',
		jquery: '../libs/jquery/dist/jquery',
		html5shiv: '../libs/html5shiv/dist/html5shiv',
		requirejs: '../libs/requirejs/require',
		respond: '../libs/respond/dest/respond.src',
		retina: '../libs/retina.js/build/js/retina-1.2.0',
		domReady: '../libs/domReady/domReady'
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