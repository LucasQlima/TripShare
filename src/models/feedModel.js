var database = require("../database/config");

// Funções

function recuperarFeed() {
    console.log("ACESSEI O USUARIO MODEL \n \n\t\t >> Se aqui der erro de 'Error: connect ECONNREFUSED',\n \t\t >> verifique suas credenciais de acesso ao banco\n \t\t >> e se o servidor de seu BD está rodando corretamente. \n\n function recuperarFeed():");

    var instrucaoSql = `
            SELECT 
                u.idUsuario AS idUsuario,
                u.username AS username,
                u.imgPerfil AS imgPerfil,
                p.idPublicacao AS idPublicacao,
                p.descricao AS descricao,
                DATE_FORMAT(p.dtPubli, '%d/%m/%y %H:%i') AS dtPubli,
                COUNT(ap.idAtividadePubli) AS curtidas,
                p.denuncias AS denuncias,
                i.imagem AS imagem,
                pa.bandeira AS pais
            FROM 
                TBL_PUBLICACAO p
                JOIN TBL_USUARIO u ON p.fkUsuario = u.idUsuario
                LEFT JOIN TBL_ATIVIDADE_PUBLI ap ON ap.fkPublicacao = p.idPublicacao
                LEFT JOIN TBL_IMAGEM i ON i.fkPublicacao = p.idPublicacao
                LEFT JOIN TBL_CONQUISTA c ON c.fkPublicacao = p.idPublicacao
                LEFT JOIN TBL_PAIS pa ON c.fkPais = pa.idPais
            GROUP BY 
                p.idPublicacao,
                u.username,
                u.imgPerfil,
                p.descricao,
                p.dtPubli,
                p.denuncias,
                i.imagem,
                pa.bandeira
            ORDER BY 
                p.dtPubli DESC;

            `;

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
    u.username AS username,
    u.imgPerfil AS imgPerfil,
    c.idComentario AS idComentario,
    c.descricao AS descricao,
    DATE_FORMAT(c.dtPubli, '%d/%m/%y %H:%i') AS dtPubli,
    COUNT(ac.idAtividadeComent) AS curtidas
FROM 
    TBL_COMENTARIO c
    JOIN TBL_USUARIO u ON u.idUsuario = c.fkUsuario
    JOIN TBL_PUBLICACAO p ON p.idPublicacao = c.fkPublicacao
    LEFT JOIN TBL_ATIVIDADE_COMENT ac 
        ON ac.fkComentario = c.idComentario 
        AND ac.fkPublicacao = c.fkPublicacao
WHERE
    c.fkPublicacao = ${fkPublicacao}
GROUP BY
    c.idComentario,
    u.username,
    u.imgPerfil,
    c.descricao,
    c.dtPubli
ORDER BY 
    idComentario DESC;
`

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

function comentarPubli(comentario, fkPublicacao, fkUsuario) {
    console.log("ACESSEI O USUARIO MODEL \n \n\t\t >> Se aqui der erro de 'Error: connect ECONNREFUSED',\n \t\t >> verifique suas credenciais de acesso ao banco\n \t\t >> e se o servidor de seu BD está rodando corretamente. \n\n function comentarPubli():");

    var instrucaoSql = `
                INSERT INTO TBL_COMENTARIO (descricao, fkPublicacao, fkUsuario) VALUES
                    ('${comentario}', ${fkPublicacao}, ${fkUsuario});
                `;

    return database.executar(instrucaoSql);
}

function curtirPubli(fkPublicacao, fkUsuario) {
    console.log("ACESSEI O USUARIO MODEL \n \n\t\t >> Se aqui der erro de 'Error: connect ECONNREFUSED',\n \t\t >> verifique suas credenciais de acesso ao banco\n \t\t >> e se o servidor de seu BD está rodando corretamente. \n\n function curtirPubli():");

    var instrucaoSql = `
                INSERT INTO TBL_ATIVIDADE_PUBLI (fkUsuario, fkPublicacao) VALUES
                    (${fkUsuario}, ${fkPublicacao});
                `;

    return database.executar(instrucaoSql);
}

function descurtirPubli(fkPublicacao, fkUsuario) {
    console.log("ACESSEI O USUARIO MODEL \n \n\t\t >> Se aqui der erro de 'Error: connect ECONNREFUSED',\n \t\t >> verifique suas credenciais de acesso ao banco\n \t\t >> e se o servidor de seu BD está rodando corretamente. \n\n function descurtirPubli():");

    var instrucaoSql = `
                DELETE FROM TBL_ATIVIDADE_PUBLI WHERE fkPublicacao = ${fkPublicacao} AND fkUsuario = ${fkUsuario};
                `;

    return database.executar(instrucaoSql);
}

function verPublicurtida( idUsername) {
    console.log("ACESSEI O USUARIO MODEL \n \n\t\t >> Se aqui der erro de 'Error: connect ECONNREFUSED',\n \t\t >> verifique suas credenciais de acesso ao banco\n \t\t >> e se o servidor de seu BD está rodando corretamente. \n\n function verPublicurtida():");

    var instrucaoSql = `
                SELECT 
                    fkPublicacao as publiCurtida
                FROM
                	TBL_ATIVIDADE_PUBLI
                WHERE
                	fkUsuario = ${idUsername};
                `;

    return database.executar(instrucaoSql);
}

// function curtirComent(comentario, fkPublicacao, fkUsuario) {
//     console.log("ACESSEI O USUARIO MODEL \n \n\t\t >> Se aqui der erro de 'Error: connect ECONNREFUSED',\n \t\t >> verifique suas credenciais de acesso ao banco\n \t\t >> e se o servidor de seu BD está rodando corretamente. \n\n function comentarPubli():");

//     var instrucaoSql = `
//                 INSERT INTO TBL_COMENTARIO (descricao, fkPublicacao, fkUsuario) VALUES
//                     ('${comentario}', ${fkPublicacao}, ${fkUsuario});
//                 `;

//     return database.executar(instrucaoSql);
// }

// function descurtirComent(comentario, fkPublicacao, fkUsuario) {
//     console.log("ACESSEI O USUARIO MODEL \n \n\t\t >> Se aqui der erro de 'Error: connect ECONNREFUSED',\n \t\t >> verifique suas credenciais de acesso ao banco\n \t\t >> e se o servidor de seu BD está rodando corretamente. \n\n function comentarPubli():");

//     var instrucaoSql = `
//                 INSERT INTO TBL_COMENTARIO (descricao, fkPublicacao, fkUsuario) VALUES
//                     ('${comentario}', ${fkPublicacao}, ${fkUsuario});
//                 `;

//     return database.executar(instrucaoSql);
// }

module.exports = {
    recuperarFeed,
    contarComentarios,
    mostrarComentarios,
    denunciarPublicacao,
    comentarPubli,
    curtirPubli,
    descurtirPubli,
    verPublicurtida,
};