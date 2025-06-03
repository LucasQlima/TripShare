var feedModel = require("../models/feedModel");

function recuperarFeed(req, res) {
    feedModel.recuperarFeed()
        .then(
            function (resultado) {
                console.log(`\nResultados encontrados: ${resultado.length}`);
                console.log(`Resultados: ${JSON.stringify(resultado)}`); // transforma JSON em String

                if (resultado.length >= 1) {
                    const feedFormatado = resultado.map(item => ({
                        username: item.username,
                        imgPerfil: item.imgPerfil,
                        idPublicacao: item.idPublicacao,
                        descricao: item.descricao,
                        dtPubli: item.dtPubli,
                        curtidas: item.curtidas,
                        denuncias: item.denuncias,
                        imagem: item.imagem,
                        pais: item.pais
                    }));
                    res.json(feedFormatado);
                } else if (resultado.length == 0) {
                    res.status(403).send("Publicação não encontrada");
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

function contarComentarios(req, res) {
    var fkPublicacao = req.body.fkpublicacaoServer;

    feedModel.contarComentarios(fkPublicacao)
        .then(
            function (resultado) {
                console.log(`\nResultados encontrados: ${resultado.length}`);
                console.log(`Resultados: ${JSON.stringify(resultado)}`); // transforma JSON em String

                if (resultado.length == 1) {
                    console.log(resultado);
                    res.json({
                        contagem: resultado[0].contagem,
                    });
                } else {
                    res.status(404).send("Publicação não encontrada");
                }
            }
        ).catch(
            function (erro) {
                console.log(erro);
                console.log("\nHouve um erro ao realizar a captura da quantidade de comentários! Erro: ", erro);
                res.status(500).json(erro.sqlMessage);
            }
        );
}

function mostrarComentarios(req, res) {
    var fkPublicacao = req.body.fkpublicacaoServer;

    feedModel.mostrarComentarios(fkPublicacao)
        .then(
            function (resultado) {
                console.log(`\nResultados encontrados: ${resultado.length}`);
                console.log(`Resultados: ${JSON.stringify(resultado)}`); // transforma JSON em String

                if (resultado.length >= 1) {
                    const comentariosFormatado = resultado.map(item => ({
                        username: item.username,
                        imgPerfil: item.imgPerfil,
                        idComentario: item.idComentario,
                        descricao: item.descricao,
                        dtPubli: item.dtPubli,
                        curtidas: item.curtidas
                    }));
                    res.json(comentariosFormatado);
                } else if (resultado.length == 0) {
                    res.status(404).send("Comentario não encontrada");
                }
            }
        ).catch(
            function (erro) {
                console.log(erro);
                console.log("\nHouve um erro ao realizar a captura dos comentarios! Erro: ", erro);
                res.status(500).json(erro.sqlMessage);
            }
        );
}

function denunciarPublicacao(req, res) {
    var idPublicacao = req.body.idpublicacaoServer;

    feedModel.denunciarPublicacao(idPublicacao)
        .then(
            function (resultado) {
                console.log(`\nResultados encontrados: ${resultado.length}`);
                console.log(`Resultados: ${JSON.stringify(resultado)}`); // transforma JSON em String
                res.json(resultado);
            }
        ).catch(
            function (erro) {
                console.log(erro);
                console.log("\nHouve um erro ao realizar o update de denuncias! Erro: ", erro);
                res.status(500).json(erro.sqlMessage);
            }
        );
}

module.exports = {
    recuperarFeed,
    contarComentarios,
    mostrarComentarios,
    denunciarPublicacao
}