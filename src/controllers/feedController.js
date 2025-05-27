var feedModel = require("../models/feedModel");

function recuperarFeed(res) {
    feedModel.recuperarFeed()
        .then(
            function (resultado) {
                console.log(`\nResultados encontrados: ${resultado.length}`);
                console.log(`Resultados: ${JSON.stringify(resultado)}`); // transforma JSON em String

                if (resultado.length >= 1) {
                    // for (var i = 0; i < resultado.length; i++){
                        res.json({
                            username: resultado[0].username,
                            imgPerfil: resultado[0].imgPerfil,
                            idPublicacao: resultado[0].idPublicacao,
                            descricao: resultado[0].descricao,
                            dtPubli: resultado[0].dtPubli,
                            curtidas: resultado[0].curtidas,
                            denuncias: resultado[0].denuncias,
                            imagem: resultado[0].imagem,
                            pais: resultado[0].pais,
                        });
                    //}
                    console.log(resultado);
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