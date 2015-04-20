gulp = require 'gulp'
webpack = require 'gulp-webpack'
pkg = require './package.json'
through2 = require 'through2'

gulp.task 'default', ['build']

gulp.task 'build', ['webpack', 'copy', 'manifest.json']

gulp.task 'watch', ['build'], ->
  gulp.watch 'src/**/*', ['build']

# Webpack で JS を作る
gulp.task 'webpack', ->
  gulp.src ''
    .pipe webpack(require('./webpack.config.js'))
    .pipe gulp.dest('build')

# そのままコピー
gulp.task 'copy', ->
  gulp.src ['src/images/*'], base: 'src'
  .pipe gulp.dest('build/')

# package.json からバージョン等を引き写して manifest.json を作る
gulp.task 'manifest.json', ->
  gulp.src 'src/manifest.json'
  .pipe through2.obj (file, encoding, callback) ->
    manifest = require(file.path)
    manifest.name = pkg.name
    manifest.version = pkg.version
    manifest.description = pkg.description

    file.contents = new Buffer(JSON.stringify(manifest, null, 2), encoding)
    this.push(file)
    callback()
  .pipe gulp.dest('build/')
