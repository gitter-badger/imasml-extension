var webpack = require('webpack');
var path = require('path');

var env = process.env.NODE_ENV || process.env.RACK_ENV || 'development';
var config = module.exports = {
  entry: {
    'content-script': './src/content-scripts/content',
    background: './src/background/background',
    test: './test/test'
  },
  output: {
    path: path.resolve(__dirname, 'build'),
    filename: '[name].js',
  },
  module: {
    loaders: [
      { test: /\.(jsx|es6)$/, exclude: /node_modules/, loader: 'babel' },
      { test: /\.coffee$/, exclude: /node_modules/, loader: 'coffee' },
      { test: /\.html$/, loader: 'html-loader' },
    ]
  },
  resolve: {
    extensions: ['', '.js', '.es6', '.coffee'],
  },
  devtool: env === 'development' ? 'inline-source-map' : null,
  plugins: [],
};

if (env === 'production') {
  config.plugins.push(
    new webpack.optimize.UglifyJsPlugin({}));
}
