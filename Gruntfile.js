module.exports = function(grunt) {
  'use strict';

  var config
    , tasks
    ;

  config = {
    pkg: grunt.file.readJSON('package.json')

  , coffeelint: {
      dist: './src/*.coffee'
    }

  , coffee: {
      dist: {
        files: {
          './dist/textarea-as-ace-editor.js': './src/textarea-as-ace-editor.coffee'
        }
      }
    }

  , uglify: {
      dist: {
        files: {
          './dist/textarea-as-ace-editor.min.js': './dist/textarea-as-ace-editor.js'
        }
      , options: {
          sourceMap: false
        }
      }
    }

  , watch: {
      dist: {
        files: [
          './src/*.coffee'
        ]
      , tasks: [
          'coffeelint'
        , 'coffee'
        , 'uglify'
        ]
      , options: {
          livereload: true
        }
      }
    }

  , connect: {
      server: {
        options: {
          port: 9001
        , livereload: true
        }
      }
    }

  };

  tasks = [
    'grunt-coffeelint'
  , 'grunt-contrib-coffee'
  , 'grunt-contrib-uglify'
  , 'grunt-contrib-watch'
  , 'grunt-contrib-connect'
  ];

  grunt.initConfig(config);

  tasks.forEach(function (task) {
    grunt.loadNpmTasks(task);
  });

  grunt.registerTask('default', ['coffeelint', 'coffee', 'uglify']);
  grunt.registerTask('demo', ['connect', 'watch']);

};
