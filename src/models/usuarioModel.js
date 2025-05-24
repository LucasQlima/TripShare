var database = require("../database/config")

//login
function autenticar(email, senha) {
    console.log("ACESSEI O USUARIO MODEL \n \n\t\t >> Se aqui der erro de 'Error: connect ECONNREFUSED',\n \t\t >> verifique suas credenciais de acesso ao banco\n \t\t >> e se o servidor de seu BD está rodando corretamente. \n\n function entrar(): ", email, senha)

    var instrucaoSql = `
        SELECT idUsuario, username, email, imgPerfil senha FROM TBL_USUARIO WHERE email = '${email}' AND senha = '${senha}';`;

    return database.executar(instrucaoSql);
}

//cadastro
function cadastrar(username, email, fkPais, senha) {
    console.log("ACESSEI O USUARIO MODEL \n \n\t\t >> Se aqui der erro de 'Error: connect ECONNREFUSED',\n \t\t >> verifique suas credenciais de acesso ao banco\n \t\t >> e se o servidor de seu BD está rodando corretamente. \n\n function cadastrar():", username, email, fkPais, senha);

    var instrucaoSql = `
        INSERT INTO TBL_USUARIO (username, email, senha, fkPais) VALUES ('${username}', '${email}', '${senha}', '${fkPais}');`;

    return database.executar(instrucaoSql);
}

module.exports = {
    autenticar,
    cadastrar
};