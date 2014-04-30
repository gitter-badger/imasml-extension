gulp = require 'gulp'
gutil = require 'gulp-util'
coffee = require 'gulp-coffee'
concat = require 'gulp-concat'
Promise = require 'promise'

gulp.task 'default', ['build']

gulp.task 'build', [
  'build-content-scripts',
  'build-background-scripts',
  'build-manifest',
  'build-other-files',
]

gulp.task 'watch', ['build'], ->
  gulp.watch 'src/**/*', ['build']

# CoffeeScript をコンパイルして結合する
compileScripts = (src, filename) ->
  gulp.src src
  .pipe coffee()
  .pipe concat(filename)
  .pipe gulp.dest('build/')

gulp.task 'build-content-scripts', ->
  compileScripts('src/content-scripts/*.coffee', 'content-script.js')

gulp.task 'build-background-scripts', ->
  compileScripts('src/background/*.coffee', 'background.js')

gulp.task 'build-manifest', ->
  # TODO: 何か読み書きしやすいものから JSON に変換したい
  gulp.src 'src/manifest.json'
  .pipe gulp.dest('build/')

gulp.task 'build-other-files', ->
  Promise.all [
    gulp.src 'src/*.html'
    .pipe gulp.dest('build/')
  ,
    gulp.src 'src/*.coffee'
    .pipe coffee()
    .pipe gulp.dest('build/')
  ,
    gulp.src 'src/images/*'
    .pipe gulp.dest('build/images/')
  ]
