var express = require("express");
var router = express.Router();

var feedController = require("../controllers/feedController");

router.get("/recuperarFeed", function (res) {
    feedController.recuperarFeed(res);
})


module.exports = router;