var database = require("../database/config")

//login
function autenticar(email, senha) {
    console.log("ACESSEI O USUARIO MODEL \n \n\t\t >> Se aqui der erro de 'Error: connect ECONNREFUSED',\n \t\t >> verifique suas credenciais de acesso ao banco\n \t\t >> e se o servidor de seu BD está rodando corretamente. \n\n function entrar(): ", email, senha)

    var instrucaoSql = `SELECT idUsuario, username, email, imgPerfil, senha FROM TBL_USUARIO WHERE email = '${email}' AND senha = '${senha}';`;

    return database.executar(instrucaoSql);
}

//cadastro
function cadastrar(username, email, fkPais, senha) {
    console.log("ACESSEI O USUARIO MODEL \n \n\t\t >> Se aqui der erro de 'Error: connect ECONNREFUSED',\n \t\t >> verifique suas credenciais de acesso ao banco\n \t\t >> e se o servidor de seu BD está rodando corretamente. \n\n function cadastrar():", username, email, fkPais, senha);

    var instrucaoSql = `INSERT INTO TBL_USUARIO (username, email, senha, fkPais) VALUES ('${username}', '${email}', '${senha}', '${fkPais}');`;

    return database.executar(instrucaoSql);
}

//Buscar Paises
function buscarPaises() {
    console.log("ACESSEI O USUARIO MODEL \n \n\t\t >> Se aqui der erro de 'Error: connect ECONNREFUSED',\n \t\t >> verifique suas credenciais de acesso ao banco\n \t\t >> e se o servidor de seu BD está rodando corretamente. \n\n function buscarPaises():");

    var instrucaoSql = `SELECT 
                            idPais as identificador, 
                            nome as pais,
                            bandeira
                        FROM
	                        TBL_PAIS;`;

    return database.executar(instrucaoSql);
}

function buscarPaisDoUsuario(idUsername) {
    console.log("ACESSEI O USUARIO MODEL \n \n\t\t >> Se aqui der erro de 'Error: connect ECONNREFUSED',\n \t\t >> verifique suas credenciais de acesso ao banco\n \t\t >> e se o servidor de seu BD está rodando corretamente. \n\n function cadastrar():");
    
    const instrucao = `
        SELECT 
            u.fkPais as fkPais,
            p.nome AS nomePais,
            p.bandeira as bandeira
        FROM 
            TBL_USUARIO u
        JOIN 
            TBL_PAIS p ON u.fkPais = p.idPais
        WHERE 
            u.idUsuario = ${idUsername};
    `;
    return database.executar(instrucao);
}

function buscarPaisesPublicados(idUsername) {
    console.log("ACESSEI O USUARIO MODEL \n \n\t\t >> Se aqui der erro de 'Error: connect ECONNREFUSED',\n \t\t >> verifique suas credenciais de acesso ao banco\n \t\t >> e se o servidor de seu BD está rodando corretamente. \n\n function cadastrar():");

    const instrucao = `
        SELECT DISTINCT 
            p.nome as pais, 
            p.bandeira as bandeira
        FROM 
            TBL_CONQUISTA c
        JOIN 
            TBL_PUBLICACAO pub ON c.fkPublicacao = pub.idPublicacao
        JOIN 
            TBL_PAIS p ON c.fkPais = p.idPais
        WHERE 
            pub.fkUsuario = ${idUsername};
    `;
    
    return database.executar(instrucao);
}

module.exports = {
    autenticar,
    cadastrar,
    buscarPaises,
    buscarPaisDoUsuario,
    buscarPaisesPublicados,
};