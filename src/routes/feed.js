var express = require("express");
var router = express.Router();

var feedController = require("../controllers/feedController");

router.get("/recuperarFeed", function (req, res) {
    feedController.recuperarFeed(req, res);
})


module.exports = router;