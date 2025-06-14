var express = require("express");
var router = express.Router();
const multer = require('multer');
const upload = multer({ dest: 'uploads/' });

var feedController = require("../controllers/feedController");

router.post("/verPubliCurtida", function (req, res) {
    feedController.verPubliCurtida(req, res);
});

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


router.post("/curtirComent", function (req, res) {
    feedController.curtirComent(req, res);
});

router.post("/descurtirComent", function (req, res) {
    feedController.descurtirComent(req, res);
});

router.post("/verComentCurtida", function (req, res) {
    feedController.verComentCurtida(req, res);
});

router.post("/addPublicacao", function (req, res) {
    feedController.addPublicacao(req, res);
});

router.post("/addConquista", function (req, res) {
    feedController.addConquista(req, res);
});

router.post("/ultimaPubli", function (req, res) {
    feedController.ultimaPubli(req, res);
});

module.exports = router;