/*global module:false*/
module.exports = function (grunt) {

	// Project configuration
	grunt.initConfig({

		uglify: {
			main: {
				src: [
					'system/client_side/js/libs/twitter_bootstrap/transition.js',
					'system/client_side/js/libs/twitter_bootstrap/tooltip.js',
					'system/client_side/js/libs/twitter_bootstrap/collapse.js',
					'system/client_side/js/libs/twitter_bootstrap/dropdown.js',
					'client_side/js/actions.js'
				],
				dest: 'client_side/js/min/actions.min.js'
			},
			advancedSearch: {
				src: ['client_side/js/search_app.js'],
				dest: 'client_side/js/min/search_app.min.js'
			}
		},

		less: {
			company: {
				options: {
					cleancss: true
				},
				files: {
					'client_side/css/company_styles.min.css': ['client_side/less/company/company_styles.less']
				}
			},
			/*
			ipw: {
				options: {
					cleancss: true
				},
				files: {
					'client_side/css/ipw_styles.min.css': ['client_side/less/ipw/ipw_styles.less']
				}
			},
			*/
			/*
			agentRebrand: {
				options: {
					cleancss: true
				},
				files: {
					'client_side/css/agent_rebrand_styles.min.css': ['client_side/less/realtor/agent_rebrand_styles.less']
				}
			},
			*/
			/*
			officeRebrand: {
				options: {
					cleancss: true
				},
				files: {
					'client_side/css/office_rebrand_styles.min.css': ['client_side/less/office/office_rebrand_styles.less']
				}
			},
			*/
			mapsearch: {
				options: {
					cleancss: true
				},
				files: {
					'client_side/css/map-search-2.min.css': ['client_side/less/map_search_2/map_search_2.less']
				}
			}
		},

		watch: {
			less: {
				files: ['client_side/less/*.less', 'client_side/less/*/*.less'],
				tasks: ['less'],
				options: {
					interrupt: true
				}
			},
			scripts: {
				files: ['client_side/js/*.js', 'client_side/js/**/*.js', '!client_side/js/min/*.min.js'],
				tasks: ['jshint', 'uglify'],
				options: {
					interrupt: true
				}
			},
			advancedSearch: {
				files: ['client_side/js/search_app.js'],
				tasks: ['jshint', 'uglify:advancedSearch'],
				options: {
					interrupt: true
				}
			}
		},

		jshint: {
			options: {
				validthis: true,
				laxcomma: true,
				laxbreak: true,
				browser: true,
				eqnull: true,
				debug: true,
				devel: true,
				boss: true,
				expr: true,
				asi: true,
				smarttabs: true,
				globals: {
					jQuery: true,
					google: true,
					Mustache: true,
					Raphael: true,
					require: true,
					define: true,
					Handlebars: true
				},
				ignores: ['client_side/js/**/*.min.js']
			},
			files: {
				src: ['Gruntfile.js', 'client_side/js/*.js']
			}
		}
	});

	// Register tasks
	grunt.registerTask('default', ['less']);
	grunt.registerTask('js', ['jshint', 'uglify']);
	grunt.registerTask('all', ['less', 'jshint', 'uglify']);
	grunt.registerTask('companyLess', ['less:company']);
	grunt.registerTask('ipwLess', ['less:ipw']);
	grunt.registerTask('agentRebrandLess', ['less:agentRebrand']);
	grunt.registerTask('officeRebrandLess', ['less:officeRebrand']);
	grunt.registerTask('mapsearchLess', ['less:mapsearch']);
	grunt.registerTask('advancedSearchJS', ['uglify:advancedSearch']);


	// Load Tasks
	grunt.loadTasks('../../node_modules/grunt-contrib-less/tasks');
	grunt.loadTasks('../../node_modules/grunt-contrib-jshint/tasks');
	grunt.loadTasks('../../node_modules/grunt-contrib-uglify/tasks');
	grunt.loadTasks('../../node_modules/grunt-contrib-watch/tasks');
};