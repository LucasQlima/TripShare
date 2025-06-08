var express = require("express");
var router = express.Router();

var feedController = require("../controllers/feedController");

router.get("/recuperarFeed", function (req, res) {
    feedController.recuperarFeed(req, res);
});

router.post("/contarComentarios", function (req, res) {
    feedController.contarComentarios(req, res);
});

router.post("/mostrarComentarios", function (req, res) {
    feedController.mostrarComentarios(req, res);
});

router.post("/denunciarPublicacao", function (req, res) {
    feedController.denunciarPublicacao(req, res);
});

router.post("/comentarPubli", function (req, res) {
    feedController.comentarPubli(req, res);
});

module.exports = router;