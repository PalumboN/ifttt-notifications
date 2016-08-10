require("coffee-script/register");
require("./src/server");

var rp = require('request-promise')
var myself = process.env.MYSELF
if (myself) {
  setInterval(function() {
    rp.get(myself);
  }, 300000); // every 5 minutes (300000)
}
