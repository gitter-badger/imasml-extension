gulp = require 'gulp'
webpack = require 'gulp-webpack'
pkg = require './package.json'
through2 = require 'through2'

gulp.task 'default', ['build']

gulp.task 'build', ['webpack', 'copy', 'manifest.json', 'update.xml']

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

# update.xml のバージョンを埋める
gulp.task 'update.xml', ->
  version = pkg.version
  url = 'https://bitbucket.org/furugomu/imasml-extension/raw/HEAD/build.crx'

  gulp.src 'update.xml'
  .pipe through2.obj (file, encoding, callback) ->
    file.contents = new Buffer("""
      <?xml version='1.0' encoding='UTF-8'?>
      <gupdate xmlns='http://www.google.com/update2/response' protocol='2.0'>
        <app appid='lbkcmmeofdaijlkdhklbnoghdojpegld'>
          <updatecheck codebase='#{url}' version='#{version}' />
        </app>
      </gupdate>
    """)
    this.push(file)
    callback()
  .pipe gulp.dest('./')
