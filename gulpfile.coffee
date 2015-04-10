gulp = require 'gulp'
webpack = require 'gulp-webpack'

gulp.task 'default', ['build']

gulp.task 'build', ['webpack', 'copy']

gulp.task 'watch', ['build'], ->
  gulp.watch 'src/**/*', ['build']

gulp.task 'webpack', ->
  gulp.src('')
    .pipe webpack(require('./webpack.config.js'))
    .pipe gulp.dest('build')

gulp.task 'copy', ->
  gulp.src ['src/manifest.json', 'src/images/*'], base: 'src'
  .pipe gulp.dest('build/')
