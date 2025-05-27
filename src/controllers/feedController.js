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

module.exports = {
    recuperarFeed
}