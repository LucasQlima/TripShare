var express = require("express");
var router = express.Router();

var usuarioController = require("../controllers/usuarioController");

router.post("/cadastrar", function (req, res) {
    usuarioController.cadastrar(req, res);
});

router.post("/autenticar", function (req, res) {
    usuarioController.autenticar(req, res);
});

router.get("/buscarPaises", function (req, res) {
    usuarioController.buscarPaises(req, res);
});

router.post("/buscarPaisDoUsuario", function (req, res) {
    usuarioController.buscarPaisDoUsuario(req, res);
});

router.post("/buscarPaisesPublicados", function (req, res) {
    usuarioController.buscarPaisesPublicados(req, res);
});

module.exports = router;
