const historyApiFallback = require('connect-history-api-fallback');

module.exports = {
  port: 3000,
  server: {
    baseDir: "./",
    middleware: [ historyApiFallback() ]
  },
  files: ["./**/*.{html,htm,css,js}"]
};
