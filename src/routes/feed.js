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

router.post("/curtirPubli", function (req, res) {
    feedController.curtirPubli(req, res);
});

router.post("/descurtirPubli", function (req, res) {
    feedController.descurtirPubli(req, res);
});

router.post("/verPublicurtida", function (req, res) {
    feedController.verPublicurtida(req, res);
});

module.exports = router;