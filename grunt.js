/*global module:false*/
/* documentation: http://boojlabs.activewebsite.com/documentation/view/72 */
module.exports = function(grunt) {

  // Project configuration.
  grunt.initConfig({
    meta: {
      version: '0.1.0',
      banner: '/*! Booj - v<%= meta.version %> - ' +
        '<%= grunt.template.today("yyyy-mm-dd") %>\n' +
        '* http://www.booj.com/\n' +
        '* Copyright (c) <%= grunt.template.today("yyyy") %> ' +
        'Booj ~ http://www.booj.com; Licensed MIT */'
    },

    lint: {
      files: ['grunt.js', 'client_side/js/*.js']
    },

    min: {
      a: {
        src: [
          'system/client_side/js/libs/twitter_bootstrap/tooltip.js',
          'system/client_side/js/libs/twitter_bootstrap/collapse.js',
          'client_side/js/actions.js'
        ],
        dest: 'client_side/js/min/actions.min.js'
      },
      b: {
        src: ['client_side/js/search_app.js'],
        dest: 'client_side/js/min/search_app.min.js'
      }
    },

    less: {
      yuicompress: {
        options: {
          yuicompress: true
        },
        /* add/remove style sheets in the files section below */
        files: {
          'client_side/css/company_styles.min.css': ['client_side/less/styles.less']
          // ,'client_side/css/agent_rebrand_styles.min.css': ['client_side/less/realtor/agent_rebrand_styles.less']
          // ,'client_side/css/office_rebrand_styles.min.css': ['client_side/less/office/office_rebrand_styles.less']
          // ,'client_side/css/ipw_styles.min.css': ['client_side/less/ipw/ipw_styles.less']
        }
      }
    },

    watch: {
      less: {
        files: 'client_side/less/**.less',
        tasks: ['less'],
        options: {
          interrupt: true
        }
      },
      scripts: {
        files: 'client_side/js/*.js',
        tasks: ['lint', 'min'],
        options: {
          interrupt: true
        }
      }
    },

    jshint: {
      options: {
        validthis: true,
        laxcomma : true,
        laxbreak : true,
        browser  : true,
        eqnull   : true,
        debug    : true,
        devel    : true,
        boss     : true,
        expr     : true,
        asi      : true
      },
      globals: {
        jQuery: true,
        google: true,
        Mustache: true,
        Raphael: true
      }
    }

  });

  // Default task.
  grunt.registerTask('default', 'lint less min');
  grunt.loadTasks('../../node_modules/grunt-contrib/node_modules/grunt-contrib-less/tasks')
};