var database = require("../database/config");

// Funções

function recuperarFeed() {
    console.log("ACESSEI O USUARIO MODEL \n \n\t\t >> Se aqui der erro de 'Error: connect ECONNREFUSED',\n \t\t >> verifique suas credenciais de acesso ao banco\n \t\t >> e se o servidor de seu BD está rodando corretamente. \n\n function recuperarFeed():");

    var instrucaoSql = `
            SELECT 
                u.username AS username,
                u.imgPerfil AS imgPefil,
                p.idPublicacao AS idPublicacao,
                p.descricao AS descricao,
                p.dtPubli AS dtPubli,
                p.curtidas AS curtidas,
                p.denuncias AS denuncias,
                i.imagem AS imagem,
                pa.bandeira AS pais
            FROM
                TBL_USUARIO u JOIN TBL_PUBLICACAO p 
                ON u.idUsuario = p.fkUsuario
                JOIN TBL_IMAGEM i 
                ON p.idPublicacao = i.fkPublicacao
                JOIN TBL_CONQUISTA c 
                ON p.idPublicacao = c.fkPublicacao
                JOIN TBL_PAIS pa 
                ON pa.idPais = c.fkPais
            ORDER BY dtPubli DESC;`;

    return database.executar(instrucaoSql);
}

module.exports = {
    recuperarFeed
};