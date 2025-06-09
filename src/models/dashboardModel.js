var database = require("../database/config");

// Funções

function kpiTotalVotos() {
    console.log("ACESSEI O USUARIO MODEL \n \n\t\t >> Se aqui der erro de 'Error: connect ECONNREFUSED',\n \t\t >> verifique suas credenciais de acesso ao banco\n \t\t >> e se o servidor de seu BD está rodando corretamente. \n\n function kpiTotalVotos():");

    var instrucaoSql = `
            SELECT
            	SUM(votos) as total
            FROM
            	TBL_PAIS;
            `;

    return database.executar(instrucaoSql);
}

function kpiMaisPubli() {
    console.log("ACESSEI O USUARIO MODEL \n \n\t\t >> Se aqui der erro de 'Error: connect ECONNREFUSED',\n \t\t >> verifique suas credenciais de acesso ao banco\n \t\t >> e se o servidor de seu BD está rodando corretamente. \n\n function kpiMaisPubli():");

    var instrucaoSql = `
            SELECT 
                p.nome as pais, 
                COUNT(*) AS total_conquistas
            FROM 
                TBL_CONQUISTA c
            JOIN 
                TBL_PAIS p ON p.idPais = c.fkPais
            GROUP BY 
                c.fkPais, p.nome
            ORDER BY 
                total_conquistas DESC
            LIMIT 1;
            `;

    return database.executar(instrucaoSql);
}

function kpiVoto(idUsername) {
    console.log("ACESSEI O USUARIO MODEL \n \n\t\t >> Se aqui der erro de 'Error: connect ECONNREFUSED',\n \t\t >> verifique suas credenciais de acesso ao banco\n \t\t >> e se o servidor de seu BD está rodando corretamente. \n\n function kpiVoto():");

    var instrucaoSql = `
            SELECT
            	IFNULL(p.nome, 'Sem voto') AS voto
            FROM 
            	TBL_USUARIO u 
            LEFT JOIN 
            	TBL_PAIS p ON p.idPais = u.fkVoto
            WHERE
            	u.idUsuario = ${idUsername};
            `;

    return database.executar(instrucaoSql);
}

function votarFkVoto(idPais, idUsername) {
    console.log("ACESSEI O USUARIO MODEL \n \n\t\t >> Se aqui der erro de 'Error: connect ECONNREFUSED',\n \t\t >> verifique suas credenciais de acesso ao banco\n \t\t >> e se o servidor de seu BD está rodando corretamente. \n\n function votarFkVoto():");

    var instrucaoSql = `
            UPDATE TBL_USUARIO
            SET fkVoto = ${idPais}
            WHERE idUsuario = ${idUsername};
            `;

    return database.executar(instrucaoSql);
}

function votar(idPais) {
    console.log("ACESSEI O USUARIO MODEL \n \n\t\t >> Se aqui der erro de 'Error: connect ECONNREFUSED',\n \t\t >> verifique suas credenciais de acesso ao banco\n \t\t >> e se o servidor de seu BD está rodando corretamente. \n\n function votar():");

    var instrucaoSql = `
            UPDATE TBL_PAIS
            SET votos = votos + 1
            WHERE idPais = ${idPais};
            `;

    return database.executar(instrucaoSql);
}

function dadosDash() {
    console.log("ACESSEI O USUARIO MODEL \n \n\t\t >> Se aqui der erro de 'Error: connect ECONNREFUSED',\n \t\t >> verifique suas credenciais de acesso ao banco\n \t\t >> e se o servidor de seu BD está rodando corretamente. \n\n function dadosDash():");

    var instrucaoSql = `
            SELECT 
            	nome, 
                votos
            FROM 
            	TBL_PAIS
            ORDER BY 
            	votos DESC
            LIMIT 5;
            `;

    return database.executar(instrucaoSql);
}

module.exports = {
    kpiTotalVotos,
    kpiMaisPubli,
    kpiVoto,
    votarFkVoto,
    votar,
    dadosDash
};
