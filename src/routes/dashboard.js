var express = require("express");
var router = express.Router();

var dashboardController = require("../controllers/dashboardController");

router.get("/kpiTotalVotos", function (req, res) {
    dashboardController.kpiTotalVotos(req, res);
});

router.get("/kpiMaisPubli", function (req, res) {
    dashboardController.kpiMaisPubli(req, res);
});

router.post("/kpiVoto", function (req, res) {
    dashboardController.kpiVoto(req, res);
});

router.post("/votarFkVoto", function (req, res) {
    dashboardController.votarFkVoto(req, res);
});

router.post("/votar", function (req, res) {
    dashboardController.votar(req, res);
});

router.get("/dadosDash", function (req, res) {
    dashboardController.dadosDash(req, res);
});

module.exports = router;