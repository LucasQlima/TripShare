CREATE DATABASE tripshare;
USE tripshare;

CREATE TABLE TBL_PAIS (
	idPais INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    bandeira VARCHAR(400) NOT NULL,
    votos INT 
);

CREATE TABLE TBL_USUARIO (
	idUsuario INT PRIMARY KEY AUTO_INCREMENT,
    username VARCHAR(30) NOT NULL,
    email VARCHAR(200) NOT NULL,
    senha VARCHAR(20) NOT NULL,
    imgPerfil LONGBLOB,
    fkPais INT,
    CONSTRAINT fkUsuarioPais FOREIGN KEY (fkPais)
		REFERENCES TBL_PAIS(idPais)
);

CREATE TABLE TBL_PUBLICACAO (
	idPublicacao INT AUTO_INCREMENT,
    descricao VARCHAR(400) NOT NULL,
    dtPubli DATETIME NOT NULL,
    curtidas INT,
    denuncias INT,
    fkUsuario INT,
    CONSTRAINT pksPublicacao PRIMARY KEY (idPublicacao, fkUsuario),
    CONSTRAINT fkPublicacaoUsuario FOREIGN KEY (fkUsuario)
		REFERENCES TBL_USUARIO(idUsuario)
);

CREATE TABLE TBL_IMAGEM(
	idImagem INT AUTO_INCREMENT,
    imagem LONGBLOB,
    fkPublicacao INT,
    CONSTRAINT pksImagem PRIMARY KEY (idImagem, fkPublicacao),
    CONSTRAINT fkImagemPublicacao FOREIGN KEY (fkPublicacao)
		REFERENCES TBL_PUBLICACAO(idPublicacao)
);

CREATE TABLE TBL_COMENTARIO (
	idComentario INT AUTO_INCREMENT,
    descricao VARCHAR(400) NOT NULL,
    dtPubli DATETIME NOT NULL,
    curtidas INT,
    denuncias INT,
    fkComentario INT,
    fkPublicacao INT,
    fkUsuario INT,
    CONSTRAINT pksComentario PRIMARY KEY (idComentario, fkPublicacao, fkUsuario),
	CONSTRAINT fkComentarioComentario FOREIGN KEY (fkComentario)
		REFERENCES TBL_COMENTARIO(idComentario),
	CONSTRAINT fkComentarioPublicacao FOREIGN KEY (fkPublicacao)
		REFERENCES TBL_PUBLICACAO(idPublicacao),
	CONSTRAINT fkComentarioUsuario FOREIGN KEY (fkUsuario)
		REFERENCES TBL_USUARIO(idUsuario)
);

CREATE TABLE TBL_CONQUISTA (
	idConquista INT AUTO_INCREMENT,
    fkPublicacao INT,
    fkPais INT,
    CONSTRAINT pksConquista PRIMARY KEY (idConquista, fkPublicacao, fkPais),
    CONSTRAINT fkConquistaPublicacao FOREIGN KEY (fkPublicacao)
		REFERENCES TBL_PUBLICACAO(idPublicacao),
	CONSTRAINT fkConquistaPais FOREIGN KEY (fkPais)
		REFERENCES TBL_PAIS(idPais)
);