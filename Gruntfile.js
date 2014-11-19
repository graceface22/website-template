module.exports = function (grunt) {

    // Project configuration.
    grunt.initConfig({

        pkg: grunt.file.readJSON('package.json'),

        watch: {
            style: {
                files: ['stylesheets/**/*.less'],
                tasks: ['less_compile', 'autoprefixer']
            }
        },

        less_compile: {
            development: {
                files: {
                    "stylesheets/main.min.css": "stylesheets/main.less"
                },
                options: {
                    compress: true
                }
            }
        },

        autoprefixer: {
            options: {
                browsers: ['last 2 versions', 'ie 8', 'ie 9']
            },
            no_dest: {
                src: "stylesheets/main.min.css" // will be overwritten
            }
        }

    });

    grunt.loadNpmTasks('grunt-contrib-less');
    grunt.loadNpmTasks('grunt-contrib-watch');
    grunt.loadNpmTasks('grunt-autoprefixer');

    // Overwriting less task to execute autoprefixer
    grunt.task.renameTask('less', 'less_compile');
    grunt.registerTask('less', ['less_compile', 'autoprefixer']);

    // Default task(s).
    grunt.registerTask('default', ['watch']);

};
