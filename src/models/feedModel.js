var database = require("../database/config");

// Funções

function recuperarFeed() {
    console.log("ACESSEI O USUARIO MODEL \n \n\t\t >> Se aqui der erro de 'Error: connect ECONNREFUSED',\n \t\t >> verifique suas credenciais de acesso ao banco\n \t\t >> e se o servidor de seu BD está rodando corretamente. \n\n function recuperarFeed():");

    var instrucaoSql = `
            SELECT 
                u.username AS username,
                u.imgPerfil AS imgPerfil,
                p.idPublicacao AS idPublicacao,
                p.descricao AS descricao,
                DATE_FORMAT(p.dtPubli, '%d/%m/%y %H : %i' ) AS dtPubli,
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

function contarComentarios(fkPublicacao) {
    console.log("ACESSEI O USUARIO MODEL \n \n\t\t >> Se aqui der erro de 'Error: connect ECONNREFUSED',\n \t\t >> verifique suas credenciais de acesso ao banco\n \t\t >> e se o servidor de seu BD está rodando corretamente. \n\n function contarComentarios():");

    var instrucaoSql = `
                SELECT 
	                COUNT(idComentario) as contagem
                FROM 
	                TBL_COMENTARIO
                WHERE
	                fkPublicacao = ${fkPublicacao}
                LIMIT 1;`;

    return database.executar(instrucaoSql);
}

function mostrarComentarios(fkPublicacao) {
    console.log("ACESSEI O USUARIO MODEL \n \n\t\t >> Se aqui der erro de 'Error: connect ECONNREFUSED',\n \t\t >> verifique suas credenciais de acesso ao banco\n \t\t >> e se o servidor de seu BD está rodando corretamente. \n\n function mostrarComentarios():");
    
    var instrucaoSql = `
                SELECT
	                u.username as username,
                    u.imgPerfil as imgPerfil,
	                c.idComentario as idComentario,
                    c.descricao as descricao,
                    DATE_FORMAT(c.dtPubli, '%d/%m/%y %H:%i' ) AS dtPubli,
                    c.curtidas as curtidas
                FROM 
	                TBL_USUARIO u JOIN TBL_COMENTARIO c
		                on u.idUsuario = c.fkUsuario
	                JOIN TBL_PUBLICACAO p
		                on p.idPublicacao = c.fkPublicacao
                WHERE
                    fkPublicacao = ${fkPublicacao}
                ORDER BY 
                    idComentario DESC;`

    return database.executar(instrucaoSql);
}

function denunciarPublicacao(idPublicacao) {
    console.log("ACESSEI O USUARIO MODEL \n \n\t\t >> Se aqui der erro de 'Error: connect ECONNREFUSED',\n \t\t >> verifique suas credenciais de acesso ao banco\n \t\t >> e se o servidor de seu BD está rodando corretamente. \n\n function contarComentarios():");

    var instrucaoSql = `
                UPDATE TBL_PUBLICACAO, (select r.denuncias FROM TBL_PUBLICACAO as r WHERE idPublicacao = ${idPublicacao}) as b 
                SET TBL_PUBLICACAO.denuncias = b.denuncias + 1
                WHERE TBL_PUBLICACAO.idPublicacao = ${idPublicacao};`;

    return database.executar(instrucaoSql);
}

module.exports = {
    recuperarFeed,
    contarComentarios,
    mostrarComentarios,
    denunciarPublicacao
};