var database = require("../database/config");

// Funções

function recuperarUser(username, idUsuario) {
    console.log("ACESSEI O USUARIO MODEL \n \n\t\t >> Se aqui der erro de 'Error: connect ECONNREFUSED',\n \t\t >> verifique suas credenciais de acesso ao banco\n \t\t >> e se o servidor de seu BD está rodando corretamente. \n\n function recuperarUser():", username, idUsuario);

    var instrucaoSql = `
            SELECT * FROM TBL_USUARIO WHERE email = '${email}' AND senha = '${senha}';`;
    
        return database.executar(instrucaoSql);
}

module.exports = {

};