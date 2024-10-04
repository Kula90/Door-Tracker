const { environment } = require('@rails/webpacker');
const MiniCssExtractPlugin = require('mini-css-extract-plugin');

// Add a rule to process CSS files
environment.loaders.append('css', {
  test: /\.css$/i,
  use: [
    MiniCssExtractPlugin.loader,
    'css-loader'
  ]
});

// Add MiniCssExtractPlugin to plugins
environment.plugins.append(
  'MiniCssExtractPlugin',
  new MiniCssExtractPlugin({
    filename: '[name]-[contenthash].css',
    chunkFilename: '[id]-[contenthash].css'
  })
);

module.exports = environment;
