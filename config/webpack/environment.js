const { environment } = require("@rails/webpacker");
const MiniCssExtractPlugin = require("mini-css-extract-plugin");

environment.plugins.prepend(
  "MiniCssExtract",
  new MiniCssExtractPlugin({ filename: "stylesheets/[name]-[contenthash].css" })
);

module.exports = environment;

module.exports = environment;
