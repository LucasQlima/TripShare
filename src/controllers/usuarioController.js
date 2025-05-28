var usuarioModel = require("../models/usuarioModel");

function autenticar(req, res) {
    var email = req.body.emailServer;
    var senha = req.body.senhaServer;

    if (email == undefined) {
        res.status(400).send("Seu email está undefined!");
    } else if (senha == undefined) {
        res.status(400).send("Sua senha está indefinida!");
    } else {

        usuarioModel.autenticar(email, senha)
            .then(
                function (resultado) {
                    console.log(`\nResultados encontrados: ${resultado.length}`);
                    console.log(`Resultados: ${JSON.stringify(resultado)}`); // transforma JSON em String

                    if (resultado.length == 1) {
                        console.log(resultado);
                        res.json({
                            idUsuario: resultado[0].idUsuario,
                            username: resultado[0].username,
                            email: resultado[0].email,
                            senha: resultado[0].senha,
                            imgPerfil: resultado[0].imgPerfil,
                        });
                    } else if (resultado.length == 0) {
                        res.status(403).send("Email e/ou senha inválido(s)");
                    } else {
                        res.status(403).send("Mais de um usuário com o mesmo login e senha!");
                    }
                }
            ).catch(
                function (erro) {
                    console.log(erro);
                    console.log("\nHouve um erro ao realizar o login! Erro: ", erro);
                    res.status(500).json(erro.sqlMessage);
                }
            );
    }

}

function cadastrar(req, res) {
    // Crie uma variável que vá recuperar os valores do arquivo cadastro.html
    var username = req.body.usernameServer;
    var email = req.body.emailServer;
    var fkPais = req.body.paisServer
    var senha = req.body.senhaServer;

    // Faça as validações dos valores
    if (username == undefined) {
        res.status(400).send("Seu username está undefined!");
    } else if (email == undefined) {
        res.status(400).send("Seu email está undefined!");
    } else if (fkPais == undefined) {
        res.status(400).send("Seu pais de origem está undefined!");
    } else if (senha == undefined) {
        res.status(400).send("Sua senha está undefined!");
    } else {

        usuarioModel.cadastrar(username, email, fkPais, senha)
            .then(
                function (resultado) {
                    res.json(resultado);
                }
            ).catch(
                function (erro) {
                    console.log(erro);
                    console.log(
                        "\nHouve um erro ao realizar o cadastro! Erro: ",
                        erro.sqlMessage
                    );
                    res.status(500).json(erro.sqlMessage);
                }
            );
    }
}

function buscarPaises(req, res) {
     usuarioModel.buscarPaises()
            .then(
                function (resultado) {
                    console.log(`\nResultados encontrados: ${resultado.length}`);
                    console.log(`Resultados: ${JSON.stringify(resultado)}`); // transforma JSON em String
    
                    if (resultado.length >= 1) {
                        const listaPaises = resultado.map(item => ({
                            identificador: item.identificador,
                            pais: item.pais,
                            bandeira: item.bandeira
                        }));
                        res.json(listaPaises);
                    } else if (resultado.length == 0) {
                        res.status(403).send("Pais não encontrado");
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
    autenticar,
    cadastrar,
    buscarPaises
}