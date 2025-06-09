var dashboardModel = require("../models/dashboardModel");

function kpiTotalVotos(req, res) {
    dashboardModel.kpiTotalVotos()
        .then(
            function (resultado) {
                console.log(`\nResultados encontrados: ${resultado.length}`);
                console.log(`Resultados: ${JSON.stringify(resultado)}`); // transforma JSON em String

                if (resultado.length = 1) {
                        resultado => ({
                        total: resultado.total,
                    });
                    res.json(resultado);
                } else if (resultado.length == 0) {
                    res.status(403).send("votos não encontrados");
                }
            }
        ).catch(
            function (erro) {
                console.log(erro);
                console.log("\nHouve um erro ao realizar a captura dos votos! Erro: ", erro);
                res.status(500).json(erro.sqlMessage);
            }
        );
}

function kpiMaisPubli(req, res) {
    dashboardModel.kpiMaisPubli()
        .then(
            function (resultado) {
                console.log(`\nResultados encontrados: ${resultado.length}`);
                console.log(`Resultados: ${JSON.stringify(resultado)}`); // transforma JSON em String

                if (resultado.length = 1) {
                        resultado => ({
                        pais: resultado.pais,
                        total_conquistas: resultado.total_conquistas,
                    });
                    res.json(resultado);
                } else if (resultado.length == 0) {
                    res.status(403).send("votos não encontrados");
                }
            }
        ).catch(
            function (erro) {
                console.log(erro);
                console.log("\nHouve um erro ao realizar a captura dos votos! Erro: ", erro);
                res.status(500).json(erro.sqlMessage);
            }
        );
}

function kpiVoto(req, res) {
    var idUsername = req.body.idusuarioServer;

    dashboardModel.kpiVoto(idUsername)
        .then(
            function (resultado) {
                console.log(`\nResultados encontrados: ${resultado.length}`);
                console.log(`Resultados: ${JSON.stringify(resultado)}`); // transforma JSON em String

                if (resultado.length = 1) {
                        resultado => ({
                        voto: resultado.voto,
                    });
                    res.json(resultado);
                } else if (resultado.length == 0) {
                    res.status(403).send("votos não encontrados");
                }
            }
        ).catch(
            function (erro) {
                console.log(erro);
                console.log("\nHouve um erro ao realizar a captura dos votos! Erro: ", erro);
                res.status(500).json(erro.sqlMessage);
            }
        );
}

function votarFkVoto(req, res) {
    var idUsername = req.body.idusuarioServer;
    var idPais = req.body.idpaisServer;

    dashboardModel.votarFkVoto(idPais, idUsername)
        .then(
            function (resultado) {
                console.log(`\nResultados encontrados: ${resultado.length}`);
                console.log(`Resultados: ${JSON.stringify(resultado)}`); // transforma JSON em String
                res.json(resultado);
            }
        ).catch(
            function (erro) {
                console.log(erro);
                console.log("\nHouve um erro ao realizar a captura dos votos! Erro: ", erro);
                res.status(500).json(erro.sqlMessage);
            }
        );
}

function votar(req, res) {
    var idPais = req.body.idpaisServer;

    dashboardModel.votar(idPais)
        .then(
            function (resultado) {
                console.log(`\nResultados encontrados: ${resultado.length}`);
                console.log(`Resultados: ${JSON.stringify(resultado)}`); // transforma JSON em String
                res.json(resultado);
            }
        ).catch(
            function (erro) {
                console.log(erro);
                console.log("\nHouve um erro ao realizar a captura dos votos! Erro: ", erro);
                res.status(500).json(erro.sqlMessage);
            }
        );
}

function dadosDash(req, res) {
     dashboardModel.dadosDash()
            .then(
                function (resultado) {
                    console.log(`\nResultados encontrados: ${resultado.length}`);
                    console.log(`Resultados: ${JSON.stringify(resultado)}`); // transforma JSON em String
    
                    if (resultado.length >= 1) {
                        const listaPaises = resultado.map(item => ({
                            nome: item.nome,
                            votos: item.votos,
                        }));
                        res.json(listaPaises);
                    } else if (resultado.length == 0) {
                        res.status(403).send("Pais não encontrado");
                    }
                }
            ).catch(
                function (erro) {
                    console.log(erro);
                    console.log("\nHouve um erro ao realizar a captura do feed! Erro: ", erro);
                    res.status(500).json(erro.sqlMessage);
                }
            );
}

module.exports = {
    kpiTotalVotos,
    kpiMaisPubli,
    kpiVoto,
    votarFkVoto,
    votar,
    dadosDash
}