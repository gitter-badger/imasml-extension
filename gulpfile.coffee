gulp = require 'gulp'
gutil = require 'gulp-util'
coffee = require 'gulp-coffee'
concat = require 'gulp-concat'

gulp.task 'default', ['build']

gulp.task 'build', [
  'build-content-scripts',
  'build-background-scripts',
  'build-manifest',
  'build-other-files',
]

gulp.task 'build-content-scripts', ->
  gulp.src 'src/content-scripts/*.coffee'
  .pipe coffee()
  .pipe concat('content-script.js')
  .pipe gulp.dest('build/')

gulp.task 'build-background-scripts', ->
  gulp.src 'src/background/*.coffee'
  .pipe coffee()
  .pipe concat('background.js')
  .pipe gulp.dest('build/')

gulp.task 'build-manifest', ->
  # TODO: 何か読み書きしやすいものから JSON に変換したい
  gulp.src 'src/manifest.json'
  .pipe gulp.dest('build/')

gulp.task 'build-other-files', ->
  gulp.src 'src/*.html'
  .pipe gulp.dest('build/')

  gulp.src 'src/*.coffee'
  .pipe coffee()
  .pipe gulp.dest('build/')

  gulp.src 'src/images/*'
  .pipe gulp.dest('build/images/')
