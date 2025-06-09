var feedModel = require("../models/feedModel");

function recuperarFeed(req, res) {
    feedModel.recuperarFeed()
        .then(
            function (resultado) {
                console.log(`\nResultados encontrados: ${resultado.length}`);
                console.log(`Resultados: ${JSON.stringify(resultado)}`); // transforma JSON em String

                if (resultado.length >= 1) {
                    const feedFormatado = resultado.map(item => ({
                        idUsuario: item.idUsuario,
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
                        fkPublicacao: item.fkPublicacao,
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

function comentarPubli(req, res) {
    var comentario = req.body.comentarioServer;
    var fkPublicacao = req.body.idpublicacaoServer;
    var fkUsuario = req.body.idusuarioServer;

    feedModel.comentarPubli(comentario, fkPublicacao, fkUsuario)
        .then(
            function (resultado) {
                console.log(`\nResultados encontrados: ${resultado.length}`);
                console.log(`Resultados: ${JSON.stringify(resultado)}`); // transforma JSON em String
                res.json(resultado);
            }
        ).catch(
            function (erro) {
                console.log(erro);
                console.log("\nHouve um erro ao realizar o insert de um comentario! Erro: ", erro);
                res.status(500).json(erro.sqlMessage);
            }
        );
}

function curtirPubli(req, res) {
    var fkPublicacao = req.body.idpublicacaoServer;
    var fkUsuario = req.body.idusuarioServer;

    feedModel.curtirPubli(fkPublicacao, fkUsuario)
        .then(
            function (resultado) {
                console.log(`\nResultados encontrados: ${resultado.length}`);
                console.log(`Resultados: ${JSON.stringify(resultado)}`); // transforma JSON em String
                res.json(resultado);
            }
        ).catch(
            function (erro) {
                console.log(erro);
                console.log("\nHouve um erro ao realizar o insert de um comentario! Erro: ", erro);
                res.status(500).json(erro.sqlMessage);
            }
        );
}

function descurtirPubli(req, res) {
    var fkPublicacao = req.body.idpublicacaoServer;
    var fkUsuario = req.body.idusuarioServer;

    feedModel.descurtirPubli(fkPublicacao, fkUsuario)
        .then(
            function (resultado) {
                console.log(`\nResultados encontrados: ${resultado.length}`);
                console.log(`Resultados: ${JSON.stringify(resultado)}`); // transforma JSON em String
                res.json(resultado);
            }
        ).catch(
            function (erro) {
                console.log(erro);
                console.log("\nHouve um erro ao realizar o delete de uma curtida! Erro: ", erro);
                res.status(500).json(erro.sqlMessage);
            }
        );
}

function verPubliCurtida(req, res) {
    var idUsername = req.body.idusuarioServer;

    feedModel.verPubliCurtida(idUsername)
        .then(
            function (resultado) {
                console.log(`\nResultados encontrados: ${resultado.length}`);
                console.log(`Resultados: ${JSON.stringify(resultado)}`); // transforma JSON em String
                if (resultado.length >= 1) {
                    const publisCurtidas = resultado.map(item => ({
                        publiCurtida: item.publiCurtida
                    }));
                    res.json(publisCurtidas);
                } else if (resultado.length == 0) {
                    res.status(404).send("curtidas não encontradas");
                }
            }
        ).catch(
            function (erro) {
                console.log(erro);
                console.log("\nHouve um erro ao realizar a coleta das publis curtidas! Erro: ", erro);
                res.status(500).json(erro.sqlMessage);
            }
        );
}

function curtirComent(req, res) {
    var fkPublicacao = req.body.idpublicacaoServer;
    var fkUsuario = req.body.idusuarioServer;
    var fkComentario = req.body.idcomentarioServer;

    feedModel.curtirComent(fkComentario, fkPublicacao, fkUsuario )
        .then(
            function (resultado) {
                console.log(`\nResultados encontrados: ${resultado.length}`);
                console.log(`Resultados: ${JSON.stringify(resultado)}`); // transforma JSON em String
                res.json(resultado);
            }
        ).catch(
            function (erro) {
                console.log(erro);
                console.log("\nHouve um erro ao realizar o insert de um comentario! Erro: ", erro);
                res.status(500).json(erro.sqlMessage);
            }
        );
}

function descurtirComent(req, res) {
    var fkPublicacao = req.body.idpublicacaoServer;
    var fkUsuario = req.body.idusuarioServer;
    var fkComentario = req.body.idcomentarioServer;

    feedModel.descurtirComent(fkComentario, fkPublicacao, fkUsuario)
        .then(
            function (resultado) {
                console.log(`\nResultados encontrados: ${resultado.length}`);
                console.log(`Resultados: ${JSON.stringify(resultado)}`); // transforma JSON em String
                res.json(resultado);
            }
        ).catch(
            function (erro) {
                console.log(erro);
                console.log("\nHouve um erro ao realizar o delete de uma curtida! Erro: ", erro);
                res.status(500).json(erro.sqlMessage);
            }
        );
}

function verComentCurtida(req, res) {
    var idUsername = req.body.idusuarioServer;
    var fkPublicacao = req.body.idpublicacaoServer;

    feedModel.verComentCurtida(idUsername, fkPublicacao)
        .then(
            function (resultado) {
                console.log(`\nResultados encontrados: ${resultado.length}`);
                console.log(`Resultados: ${JSON.stringify(resultado)}`); // transforma JSON em String
                if (resultado.length >= 1) {
                    const comentariosCurtidos = resultado.map(item => ({
                        comentarioCurtido: item.comentarioCurtido
                    }));
                    res.json(comentariosCurtidos);
                } else if (resultado.length == 0) {
                    res.status(404).send("curtidas não encontradas");
                }
            }
        ).catch(
            function (erro) {
                console.log(erro);
                console.log("\nHouve um erro ao realizar a coleta dos coments curtidos! Erro: ", erro);
                res.status(500).json(erro.sqlMessage);
            }
        );
}

module.exports = {
    recuperarFeed,
    contarComentarios,
    mostrarComentarios,
    comentarPubli,
    denunciarPublicacao,
    curtirPubli,
    descurtirPubli,
    verPubliCurtida,
    curtirComent,
    descurtirComent,
    verComentCurtida
}