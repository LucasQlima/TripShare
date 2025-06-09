CREATE DATABASE tripshare;
USE tripshare;
-- DROP DATABASE tripshare;

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
    imgPerfil VARCHAR(400) DEFAULT 'https://i.pinimg.com/474x/a8/da/22/a8da222be70a71e7858bf752065d5cc3.jpg',
    fkPais INT,
    CONSTRAINT fkUsuarioPais FOREIGN KEY (fkPais)
		REFERENCES TBL_PAIS(idPais)
);

CREATE TABLE TBL_PUBLICACAO (
	idPublicacao INT AUTO_INCREMENT PRIMARY KEY,
    descricao VARCHAR(400) NOT NULL,
    dtPubli DATETIME NOT NULL,
    denuncias INT,
    fkUsuario INT NOT NULL,
    CONSTRAINT fkPublicacaoUsuario FOREIGN KEY (fkUsuario)
		REFERENCES TBL_USUARIO(idUsuario)
);

CREATE TABLE TBL_IMAGEM (
	idImagem INT AUTO_INCREMENT PRIMARY KEY,
    imagem VARCHAR(400),
    fkPublicacao INT NOT NULL,
    CONSTRAINT fkImagemPublicacao FOREIGN KEY (fkPublicacao)
		REFERENCES TBL_PUBLICACAO(idPublicacao)
);

CREATE TABLE TBL_COMENTARIO (
	idComentario INT AUTO_INCREMENT PRIMARY KEY,
    descricao VARCHAR(400) NOT NULL,
    dtPubli DATETIME NOT NULL DEFAULT current_timestamp,
    fkPublicacao INT NOT NULL,
    fkUsuario INT NOT NULL,
	CONSTRAINT fkComentarioPublicacao FOREIGN KEY (fkPublicacao)
		REFERENCES TBL_PUBLICACAO(idPublicacao),
	CONSTRAINT fkComentarioUsuario FOREIGN KEY (fkUsuario)
		REFERENCES TBL_USUARIO(idUsuario)
);

CREATE TABLE TBL_CONQUISTA (
	idConquista INT AUTO_INCREMENT PRIMARY KEY,
    fkPublicacao INT NOT NULL,
    fkPais INT NOT NULL,
    CONSTRAINT fkConquistaPublicacao FOREIGN KEY (fkPublicacao)
		REFERENCES TBL_PUBLICACAO(idPublicacao),
	CONSTRAINT fkConquistaPais FOREIGN KEY (fkPais)
		REFERENCES TBL_PAIS(idPais)
);

CREATE TABLE TBL_ATIVIDADE_PUBLI (
	idAtividadePubli INT AUTO_INCREMENT PRIMARY KEY,
    fkUsuario INT NOT NULL,
    fkPublicacao INT NOT NULL,
    CONSTRAINT fkAtvPubliUsuario FOREIGN KEY (fkUsuario)
		REFERENCES TBL_USUARIO(idUsuario),
	CONSTRAINT fkAtvPubliPublicacao FOREIGN KEY (fkPublicacao)
		REFERENCES TBL_PUBLICACAO(idPublicacao)
);

CREATE TABLE TBL_ATIVIDADE_COMENT (
	idAtividadeComent INT AUTO_INCREMENT PRIMARY KEY,
    fkUsuario INT NOT NULL,
    fkPublicacao INT NOT NULL,
    fkComentario INT NOT NULL,
    CONSTRAINT fkAtvComentUsuario FOREIGN KEY (fkUsuario)
		REFERENCES TBL_USUARIO(idUsuario),
	CONSTRAINT fkAtvComentPublicacao FOREIGN KEY (fkPublicacao)
		REFERENCES TBL_PUBLICACAO(idPublicacao),
	CONSTRAINT fkAtvComentComentario FOREIGN KEY (fkComentario)
		REFERENCES TBL_COMENTARIO(idComentario)
);

-- INSERT GERADO ATRAVES DE API

INSERT INTO TBL_PAIS (nome, bandeira, votos) VALUES ('Eritrea','https://flagcdn.com/w320/er.png',NULL);
INSERT INTO TBL_PAIS (nome, bandeira, votos) VALUES ('Cameroon','https://flagcdn.com/w320/cm.png',NULL);
INSERT INTO TBL_PAIS (nome, bandeira, votos) VALUES ('Montenegro','https://flagcdn.com/w320/me.png',NULL);
INSERT INTO TBL_PAIS (nome, bandeira, votos) VALUES ('Fiji','https://flagcdn.com/w320/fj.png',NULL);
INSERT INTO TBL_PAIS (nome, bandeira, votos) VALUES ('Tunisia','https://flagcdn.com/w320/tn.png',NULL);
INSERT INTO TBL_PAIS (nome, bandeira, votos) VALUES ('Senegal','https://flagcdn.com/w320/sn.png',NULL);
INSERT INTO TBL_PAIS (nome, bandeira, votos) VALUES ('South Georgia','https://flagcdn.com/w320/gs.png',NULL);
INSERT INTO TBL_PAIS (nome, bandeira, votos) VALUES ('Brazil','https://flagcdn.com/w320/br.png',NULL);
INSERT INTO TBL_PAIS (nome, bandeira, votos) VALUES ('Liechtenstein','https://flagcdn.com/w320/li.png',NULL);
INSERT INTO TBL_PAIS (nome, bandeira, votos) VALUES ('Mexico','https://flagcdn.com/w320/mx.png',NULL);
INSERT INTO TBL_PAIS (nome, bandeira, votos) VALUES ('Palestine','https://flagcdn.com/w320/ps.png',NULL);
INSERT INTO TBL_PAIS (nome, bandeira, votos) VALUES ('Greenland','https://flagcdn.com/w320/gl.png',NULL);
INSERT INTO TBL_PAIS (nome, bandeira, votos) VALUES ('United States Minor Outlying Islands','https://flagcdn.com/w320/um.png',NULL);
INSERT INTO TBL_PAIS (nome, bandeira, votos) VALUES ('Equatorial Guinea','https://flagcdn.com/w320/gq.png',NULL);
INSERT INTO TBL_PAIS (nome, bandeira, votos) VALUES ('Guadeloupe','https://flagcdn.com/w320/gp.png',NULL);
INSERT INTO TBL_PAIS (nome, bandeira, votos) VALUES ('Saint Helena, Ascension and Tristan da Cunha','https://flagcdn.com/w320/sh.png',NULL);
INSERT INTO TBL_PAIS (nome, bandeira, votos) VALUES ('Turkey','https://flagcdn.com/w320/tr.png',NULL);
INSERT INTO TBL_PAIS (nome, bandeira, votos) VALUES ('Chad','https://flagcdn.com/w320/td.png',NULL);
INSERT INTO TBL_PAIS (nome, bandeira, votos) VALUES ('Honduras','https://flagcdn.com/w320/hn.png',NULL);
INSERT INTO TBL_PAIS (nome, bandeira, votos) VALUES ('Austria','https://flagcdn.com/w320/at.png',NULL);
INSERT INTO TBL_PAIS (nome, bandeira, votos) VALUES ('Romania','https://flagcdn.com/w320/ro.png',NULL);
INSERT INTO TBL_PAIS (nome, bandeira, votos) VALUES ('Gabon','https://flagcdn.com/w320/ga.png',NULL);
INSERT INTO TBL_PAIS (nome, bandeira, votos) VALUES ('Namibia','https://flagcdn.com/w320/na.png',NULL);
INSERT INTO TBL_PAIS (nome, bandeira, votos) VALUES ('Rwanda','https://flagcdn.com/w320/rw.png',NULL);
INSERT INTO TBL_PAIS (nome, bandeira, votos) VALUES ('Saint Vincent and the Grenadines','https://flagcdn.com/w320/vc.png',NULL);
INSERT INTO TBL_PAIS (nome, bandeira, votos) VALUES ('Bulgaria','https://flagcdn.com/w320/bg.png',NULL);
INSERT INTO TBL_PAIS (nome, bandeira, votos) VALUES ('Colombia','https://flagcdn.com/w320/co.png',NULL);
INSERT INTO TBL_PAIS (nome, bandeira, votos) VALUES ('Suriname','https://flagcdn.com/w320/sr.png',NULL);
INSERT INTO TBL_PAIS (nome, bandeira, votos) VALUES ('Zimbabwe','https://flagcdn.com/w320/zw.png',NULL);
INSERT INTO TBL_PAIS (nome, bandeira, votos) VALUES ('Venezuela','https://flagcdn.com/w320/ve.png',NULL);
INSERT INTO TBL_PAIS (nome, bandeira, votos) VALUES ('Eswatini','https://flagcdn.com/w320/sz.png',NULL);
INSERT INTO TBL_PAIS (nome, bandeira, votos) VALUES ('Philippines','https://flagcdn.com/w320/ph.png',NULL);
INSERT INTO TBL_PAIS (nome, bandeira, votos) VALUES ('Turkmenistan','https://flagcdn.com/w320/tm.png',NULL);
INSERT INTO TBL_PAIS (nome, bandeira, votos) VALUES ('Algeria','https://flagcdn.com/w320/dz.png',NULL);
INSERT INTO TBL_PAIS (nome, bandeira, votos) VALUES ('Niger','https://flagcdn.com/w320/ne.png',NULL);
INSERT INTO TBL_PAIS (nome, bandeira, votos) VALUES ('Jamaica','https://flagcdn.com/w320/jm.png',NULL);
INSERT INTO TBL_PAIS (nome, bandeira, votos) VALUES ('Armenia','https://flagcdn.com/w320/am.png',NULL);
INSERT INTO TBL_PAIS (nome, bandeira, votos) VALUES ('Caribbean Netherlands','https://flagcdn.com/w320/bq.png',NULL);
INSERT INTO TBL_PAIS (nome, bandeira, votos) VALUES ('Solomon Islands','https://flagcdn.com/w320/sb.png',NULL);
INSERT INTO TBL_PAIS (nome, bandeira, votos) VALUES ('Cuba','https://flagcdn.com/w320/cu.png',NULL);
INSERT INTO TBL_PAIS (nome, bandeira, votos) VALUES ('French Southern and Antarctic Lands','https://flagcdn.com/w320/tf.png',NULL);
INSERT INTO TBL_PAIS (nome, bandeira, votos) VALUES ('Åland Islands','https://flagcdn.com/w320/ax.png',NULL);
INSERT INTO TBL_PAIS (nome, bandeira, votos) VALUES ('United States Virgin Islands','https://flagcdn.com/w320/vi.png',NULL);
INSERT INTO TBL_PAIS (nome, bandeira, votos) VALUES ('Liberia','https://flagcdn.com/w320/lr.png',NULL);
INSERT INTO TBL_PAIS (nome, bandeira, votos) VALUES ('Sudan','https://flagcdn.com/w320/sd.png',NULL);
INSERT INTO TBL_PAIS (nome, bandeira, votos) VALUES ('British Virgin Islands','https://flagcdn.com/w320/vg.png',NULL);
INSERT INTO TBL_PAIS (nome, bandeira, votos) VALUES ('Tanzania','https://flagcdn.com/w320/tz.png',NULL);
INSERT INTO TBL_PAIS (nome, bandeira, votos) VALUES ('Croatia','https://flagcdn.com/w320/hr.png',NULL);
INSERT INTO TBL_PAIS (nome, bandeira, votos) VALUES ('Andorra','https://flagcdn.com/w320/ad.png',NULL);
INSERT INTO TBL_PAIS (nome, bandeira, votos) VALUES ('Belize','https://flagcdn.com/w320/bz.png',NULL);
INSERT INTO TBL_PAIS (nome, bandeira, votos) VALUES ('Barbados','https://flagcdn.com/w320/bb.png',NULL);
INSERT INTO TBL_PAIS (nome, bandeira, votos) VALUES ('Slovakia','https://flagcdn.com/w320/sk.png',NULL);
INSERT INTO TBL_PAIS (nome, bandeira, votos) VALUES ('Vatican City','https://flagcdn.com/w320/va.png',NULL);
INSERT INTO TBL_PAIS (nome, bandeira, votos) VALUES ('Lebanon','https://flagcdn.com/w320/lb.png',NULL);
INSERT INTO TBL_PAIS (nome, bandeira, votos) VALUES ('Moldova','https://flagcdn.com/w320/md.png',NULL);
INSERT INTO TBL_PAIS (nome, bandeira, votos) VALUES ('Finland','https://flagcdn.com/w320/fi.png',NULL);
INSERT INTO TBL_PAIS (nome, bandeira, votos) VALUES ('Taiwan','https://flagcdn.com/w320/tw.png',NULL);
INSERT INTO TBL_PAIS (nome, bandeira, votos) VALUES ('Micronesia','https://flagcdn.com/w320/fm.png',NULL);
INSERT INTO TBL_PAIS (nome, bandeira, votos) VALUES ('Vietnam','https://flagcdn.com/w320/vn.png',NULL);
INSERT INTO TBL_PAIS (nome, bandeira, votos) VALUES ('French Polynesia','https://flagcdn.com/w320/pf.png',NULL);
INSERT INTO TBL_PAIS (nome, bandeira, votos) VALUES ('Tokelau','https://flagcdn.com/w320/tk.png',NULL);
INSERT INTO TBL_PAIS (nome, bandeira, votos) VALUES ('Germany','https://flagcdn.com/w320/de.png',NULL);
INSERT INTO TBL_PAIS (nome, bandeira, votos) VALUES ('Uganda','https://flagcdn.com/w320/ug.png',NULL);
INSERT INTO TBL_PAIS (nome, bandeira, votos) VALUES ('Sint Maarten','https://flagcdn.com/w320/sx.png',NULL);
INSERT INTO TBL_PAIS (nome, bandeira, votos) VALUES ('Kazakhstan','https://flagcdn.com/w320/kz.png',NULL);
INSERT INTO TBL_PAIS (nome, bandeira, votos) VALUES ('Northern Mariana Islands','https://flagcdn.com/w320/mp.png',NULL);
INSERT INTO TBL_PAIS (nome, bandeira, votos) VALUES ('Dominica','https://flagcdn.com/w320/dm.png',NULL);
INSERT INTO TBL_PAIS (nome, bandeira, votos) VALUES ('South Sudan','https://flagcdn.com/w320/ss.png',NULL);
INSERT INTO TBL_PAIS (nome, bandeira, votos) VALUES ('American Samoa','https://flagcdn.com/w320/as.png',NULL);
INSERT INTO TBL_PAIS (nome, bandeira, votos) VALUES ('Pitcairn Islands','https://flagcdn.com/w320/pn.png',NULL);
INSERT INTO TBL_PAIS (nome, bandeira, votos) VALUES ('Tajikistan','https://flagcdn.com/w320/tj.png',NULL);
INSERT INTO TBL_PAIS (nome, bandeira, votos) VALUES ('Wallis and Futuna','https://flagcdn.com/w320/wf.png',NULL);
INSERT INTO TBL_PAIS (nome, bandeira, votos) VALUES ('Slovenia','https://flagcdn.com/w320/si.png',NULL);
INSERT INTO TBL_PAIS (nome, bandeira, votos) VALUES ('Cape Verde','https://flagcdn.com/w320/cv.png',NULL);
INSERT INTO TBL_PAIS (nome, bandeira, votos) VALUES ('Maldives','https://flagcdn.com/w320/mv.png',NULL);
INSERT INTO TBL_PAIS (nome, bandeira, votos) VALUES ('Yemen','https://flagcdn.com/w320/ye.png',NULL);
INSERT INTO TBL_PAIS (nome, bandeira, votos) VALUES ('North Korea','https://flagcdn.com/w320/kp.png',NULL);
INSERT INTO TBL_PAIS (nome, bandeira, votos) VALUES ('Georgia','https://flagcdn.com/w320/ge.png',NULL);
INSERT INTO TBL_PAIS (nome, bandeira, votos) VALUES ('Belgium','https://flagcdn.com/w320/be.png',NULL);
INSERT INTO TBL_PAIS (nome, bandeira, votos) VALUES ('Uzbekistan','https://flagcdn.com/w320/uz.png',NULL);
INSERT INTO TBL_PAIS (nome, bandeira, votos) VALUES ('Dominican Republic','https://flagcdn.com/w320/do.png',NULL);
INSERT INTO TBL_PAIS (nome, bandeira, votos) VALUES ('Portugal','https://flagcdn.com/w320/pt.png',NULL);
INSERT INTO TBL_PAIS (nome, bandeira, votos) VALUES ('Faroe Islands','https://flagcdn.com/w320/fo.png',NULL);
INSERT INTO TBL_PAIS (nome, bandeira, votos) VALUES ('Western Sahara','https://flagcdn.com/w320/eh.png',NULL);
INSERT INTO TBL_PAIS (nome, bandeira, votos) VALUES ('Martinique','https://flagcdn.com/w320/mq.png',NULL);
INSERT INTO TBL_PAIS (nome, bandeira, votos) VALUES ('Saint Lucia','https://flagcdn.com/w320/lc.png',NULL);
INSERT INTO TBL_PAIS (nome, bandeira, votos) VALUES ('Mozambique','https://flagcdn.com/w320/mz.png',NULL);
INSERT INTO TBL_PAIS (nome, bandeira, votos) VALUES ('Thailand','https://flagcdn.com/w320/th.png',NULL);
INSERT INTO TBL_PAIS (nome, bandeira, votos) VALUES ('Israel','https://flagcdn.com/w320/il.png',NULL);
INSERT INTO TBL_PAIS (nome, bandeira, votos) VALUES ('Falkland Islands','https://flagcdn.com/w320/fk.png',NULL);
INSERT INTO TBL_PAIS (nome, bandeira, votos) VALUES ('Benin','https://flagcdn.com/w320/bj.png',NULL);
INSERT INTO TBL_PAIS (nome, bandeira, votos) VALUES ('Indonesia','https://flagcdn.com/w320/id.png',NULL);
INSERT INTO TBL_PAIS (nome, bandeira, votos) VALUES ('Papua New Guinea','https://flagcdn.com/w320/pg.png',NULL);
INSERT INTO TBL_PAIS (nome, bandeira, votos) VALUES ('Bahrain','https://flagcdn.com/w320/bh.png',NULL);
INSERT INTO TBL_PAIS (nome, bandeira, votos) VALUES ('Macau','https://flagcdn.com/w320/mo.png',NULL);
INSERT INTO TBL_PAIS (nome, bandeira, votos) VALUES ('Greece','https://flagcdn.com/w320/gr.png',NULL);
INSERT INTO TBL_PAIS (nome, bandeira, votos) VALUES ('Syria','https://flagcdn.com/w320/sy.png',NULL);
INSERT INTO TBL_PAIS (nome, bandeira, votos) VALUES ('Central African Republic','https://flagcdn.com/w320/cf.png',NULL);
INSERT INTO TBL_PAIS (nome, bandeira, votos) VALUES ('Guam','https://flagcdn.com/w320/gu.png',NULL);
INSERT INTO TBL_PAIS (nome, bandeira, votos) VALUES ('Poland','https://flagcdn.com/w320/pl.png',NULL);
INSERT INTO TBL_PAIS (nome, bandeira, votos) VALUES ('Bouvet Island','https://flagcdn.com/w320/bv.png',NULL);
INSERT INTO TBL_PAIS (nome, bandeira, votos) VALUES ('Antarctica','https://flagcdn.com/w320/aq.png',NULL);
INSERT INTO TBL_PAIS (nome, bandeira, votos) VALUES ('United States','https://flagcdn.com/w320/us.png',NULL);
INSERT INTO TBL_PAIS (nome, bandeira, votos) VALUES ('Zambia','https://flagcdn.com/w320/zm.png',NULL);
INSERT INTO TBL_PAIS (nome, bandeira, votos) VALUES ('Kiribati','https://flagcdn.com/w320/ki.png',NULL);
INSERT INTO TBL_PAIS (nome, bandeira, votos) VALUES ('Peru','https://flagcdn.com/w320/pe.png',NULL);
INSERT INTO TBL_PAIS (nome, bandeira, votos) VALUES ('Uruguay','https://flagcdn.com/w320/uy.png',NULL);
INSERT INTO TBL_PAIS (nome, bandeira, votos) VALUES ('Anguilla','https://flagcdn.com/w320/ai.png',NULL);
INSERT INTO TBL_PAIS (nome, bandeira, votos) VALUES ('Iran','https://flagcdn.com/w320/ir.png',NULL);
INSERT INTO TBL_PAIS (nome, bandeira, votos) VALUES ('El Salvador','https://flagcdn.com/w320/sv.png',NULL);
INSERT INTO TBL_PAIS (nome, bandeira, votos) VALUES ('Hungary','https://flagcdn.com/w320/hu.png',NULL);
INSERT INTO TBL_PAIS (nome, bandeira, votos) VALUES ('Samoa','https://flagcdn.com/w320/ws.png',NULL);
INSERT INTO TBL_PAIS (nome, bandeira, votos) VALUES ('Ecuador','https://flagcdn.com/w320/ec.png',NULL);
INSERT INTO TBL_PAIS (nome, bandeira, votos) VALUES ('France','https://flagcdn.com/w320/fr.png',NULL);
INSERT INTO TBL_PAIS (nome, bandeira, votos) VALUES ('Nigeria','https://flagcdn.com/w320/ng.png',NULL);
INSERT INTO TBL_PAIS (nome, bandeira, votos) VALUES ('India','https://flagcdn.com/w320/in.png',NULL);
INSERT INTO TBL_PAIS (nome, bandeira, votos) VALUES ('Saint Martin','https://flagcdn.com/w320/mf.png',NULL);
INSERT INTO TBL_PAIS (nome, bandeira, votos) VALUES ('Burkina Faso','https://flagcdn.com/w320/bf.png',NULL);
INSERT INTO TBL_PAIS (nome, bandeira, votos) VALUES ('Iraq','https://flagcdn.com/w320/iq.png',NULL);
INSERT INTO TBL_PAIS (nome, bandeira, votos) VALUES ('Kuwait','https://flagcdn.com/w320/kw.png',NULL);
INSERT INTO TBL_PAIS (nome, bandeira, votos) VALUES ('Czechia','https://flagcdn.com/w320/cz.png',NULL);
INSERT INTO TBL_PAIS (nome, bandeira, votos) VALUES ('Montserrat','https://flagcdn.com/w320/ms.png',NULL);
INSERT INTO TBL_PAIS (nome, bandeira, votos) VALUES ('Morocco','https://flagcdn.com/w320/ma.png',NULL);
INSERT INTO TBL_PAIS (nome, bandeira, votos) VALUES ('New Caledonia','https://flagcdn.com/w320/nc.png',NULL);
INSERT INTO TBL_PAIS (nome, bandeira, votos) VALUES ('Gambia','https://flagcdn.com/w320/gm.png',NULL);
INSERT INTO TBL_PAIS (nome, bandeira, votos) VALUES ('Netherlands','https://flagcdn.com/w320/nl.png',NULL);
INSERT INTO TBL_PAIS (nome, bandeira, votos) VALUES ('Saint Pierre and Miquelon','https://flagcdn.com/w320/pm.png',NULL);
INSERT INTO TBL_PAIS (nome, bandeira, votos) VALUES ('Saint Barthélemy','https://flagcdn.com/w320/bl.png',NULL);
INSERT INTO TBL_PAIS (nome, bandeira, votos) VALUES ('Hong Kong','https://flagcdn.com/w320/hk.png',NULL);
INSERT INTO TBL_PAIS (nome, bandeira, votos) VALUES ('China','https://flagcdn.com/w320/cn.png',NULL);
INSERT INTO TBL_PAIS (nome, bandeira, votos) VALUES ('Ukraine','https://flagcdn.com/w320/ua.png',NULL);
INSERT INTO TBL_PAIS (nome, bandeira, votos) VALUES ('Botswana','https://flagcdn.com/w320/bw.png',NULL);
INSERT INTO TBL_PAIS (nome, bandeira, votos) VALUES ('Curaçao','https://flagcdn.com/w320/cw.png',NULL);
INSERT INTO TBL_PAIS (nome, bandeira, votos) VALUES ('Serbia','https://flagcdn.com/w320/rs.png',NULL);
INSERT INTO TBL_PAIS (nome, bandeira, votos) VALUES ('Sweden','https://flagcdn.com/w320/se.png',NULL);
INSERT INTO TBL_PAIS (nome, bandeira, votos) VALUES ('Sierra Leone','https://flagcdn.com/w320/sl.png',NULL);
INSERT INTO TBL_PAIS (nome, bandeira, votos) VALUES ('Spain','https://flagcdn.com/w320/es.png',NULL);
INSERT INTO TBL_PAIS (nome, bandeira, votos) VALUES ('Panama','https://flagcdn.com/w320/pa.png',NULL);
INSERT INTO TBL_PAIS (nome, bandeira, votos) VALUES ('Singapore','https://flagcdn.com/w320/sg.png',NULL);
INSERT INTO TBL_PAIS (nome, bandeira, votos) VALUES ('Laos','https://flagcdn.com/w320/la.png',NULL);
INSERT INTO TBL_PAIS (nome, bandeira, votos) VALUES ('Malawi','https://flagcdn.com/w320/mw.png',NULL);
INSERT INTO TBL_PAIS (nome, bandeira, votos) VALUES ('Burundi','https://flagcdn.com/w320/bi.png',NULL);
INSERT INTO TBL_PAIS (nome, bandeira, votos) VALUES ('Belarus','https://flagcdn.com/w320/by.png',NULL);
INSERT INTO TBL_PAIS (nome, bandeira, votos) VALUES ('Cayman Islands','https://flagcdn.com/w320/ky.png',NULL);
INSERT INTO TBL_PAIS (nome, bandeira, votos) VALUES ('Malaysia','https://flagcdn.com/w320/my.png',NULL);
INSERT INTO TBL_PAIS (nome, bandeira, votos) VALUES ('Pakistan','https://flagcdn.com/w320/pk.png',NULL);
INSERT INTO TBL_PAIS (nome, bandeira, votos) VALUES ('Argentina','https://flagcdn.com/w320/ar.png',NULL);
INSERT INTO TBL_PAIS (nome, bandeira, votos) VALUES ('Angola','https://flagcdn.com/w320/ao.png',NULL);
INSERT INTO TBL_PAIS (nome, bandeira, votos) VALUES ('Malta','https://flagcdn.com/w320/mt.png',NULL);
INSERT INTO TBL_PAIS (nome, bandeira, votos) VALUES ('Aruba','https://flagcdn.com/w320/aw.png',NULL);
INSERT INTO TBL_PAIS (nome, bandeira, votos) VALUES ('Paraguay','https://flagcdn.com/w320/py.png',NULL);
INSERT INTO TBL_PAIS (nome, bandeira, votos) VALUES ('Guinea-Bissau','https://flagcdn.com/w320/gw.png',NULL);
INSERT INTO TBL_PAIS (nome, bandeira, votos) VALUES ('Saudi Arabia','https://flagcdn.com/w320/sa.png',NULL);
INSERT INTO TBL_PAIS (nome, bandeira, votos) VALUES ('Gibraltar','https://flagcdn.com/w320/gi.png',NULL);
INSERT INTO TBL_PAIS (nome, bandeira, votos) VALUES ('Nicaragua','https://flagcdn.com/w320/ni.png',NULL);
INSERT INTO TBL_PAIS (nome, bandeira, votos) VALUES ('Ireland','https://flagcdn.com/w320/ie.png',NULL);
INSERT INTO TBL_PAIS (nome, bandeira, votos) VALUES ('Mali','https://flagcdn.com/w320/ml.png',NULL);
INSERT INTO TBL_PAIS (nome, bandeira, votos) VALUES ('Costa Rica','https://flagcdn.com/w320/cr.png',NULL);
INSERT INTO TBL_PAIS (nome, bandeira, votos) VALUES ('British Indian Ocean Territory','https://flagcdn.com/w320/io.png',NULL);
INSERT INTO TBL_PAIS (nome, bandeira, votos) VALUES ('Mongolia','https://flagcdn.com/w320/mn.png',NULL);
INSERT INTO TBL_PAIS (nome, bandeira, votos) VALUES ('French Guiana','https://flagcdn.com/w320/gf.png',NULL);
INSERT INTO TBL_PAIS (nome, bandeira, votos) VALUES ('Canada','https://flagcdn.com/w320/ca.png',NULL);
INSERT INTO TBL_PAIS (nome, bandeira, votos) VALUES ('Cook Islands','https://flagcdn.com/w320/ck.png',NULL);
INSERT INTO TBL_PAIS (nome, bandeira, votos) VALUES ('Estonia','https://flagcdn.com/w320/ee.png',NULL);
INSERT INTO TBL_PAIS (nome, bandeira, votos) VALUES ('Trinidad and Tobago','https://flagcdn.com/w320/tt.png',NULL);
INSERT INTO TBL_PAIS (nome, bandeira, votos) VALUES ('Cocos (Keeling) Islands','https://flagcdn.com/w320/cc.png',NULL);
INSERT INTO TBL_PAIS (nome, bandeira, votos) VALUES ('Comoros','https://flagcdn.com/w320/km.png',NULL);
INSERT INTO TBL_PAIS (nome, bandeira, votos) VALUES ('Christmas Island','https://flagcdn.com/w320/cx.png',NULL);
INSERT INTO TBL_PAIS (nome, bandeira, votos) VALUES ('Timor-Leste','https://flagcdn.com/w320/tl.png',NULL);
INSERT INTO TBL_PAIS (nome, bandeira, votos) VALUES ('Denmark','https://flagcdn.com/w320/dk.png',NULL);
INSERT INTO TBL_PAIS (nome, bandeira, votos) VALUES ('North Macedonia','https://flagcdn.com/w320/mk.png',NULL);
INSERT INTO TBL_PAIS (nome, bandeira, votos) VALUES ('Bangladesh','https://flagcdn.com/w320/bd.png',NULL);
INSERT INTO TBL_PAIS (nome, bandeira, votos) VALUES ('Mauritius','https://flagcdn.com/w320/mu.png',NULL);
INSERT INTO TBL_PAIS (nome, bandeira, votos) VALUES ('Cyprus','https://flagcdn.com/w320/cy.png',NULL);
INSERT INTO TBL_PAIS (nome, bandeira, votos) VALUES ('Guernsey','https://flagcdn.com/w320/gg.png',NULL);
INSERT INTO TBL_PAIS (nome, bandeira, votos) VALUES ('Brunei','https://flagcdn.com/w320/bn.png',NULL);
INSERT INTO TBL_PAIS (nome, bandeira, votos) VALUES ('Japan','https://flagcdn.com/w320/jp.png',NULL);
INSERT INTO TBL_PAIS (nome, bandeira, votos) VALUES ('Azerbaijan','https://flagcdn.com/w320/az.png',NULL);
INSERT INTO TBL_PAIS (nome, bandeira, votos) VALUES ('Bahamas','https://flagcdn.com/w320/bs.png',NULL);
INSERT INTO TBL_PAIS (nome, bandeira, votos) VALUES ('Latvia','https://flagcdn.com/w320/lv.png',NULL);
INSERT INTO TBL_PAIS (nome, bandeira, votos) VALUES ('Mayotte','https://flagcdn.com/w320/yt.png',NULL);
INSERT INTO TBL_PAIS (nome, bandeira, votos) VALUES ('Afghanistan','https://upload.wikimedia.org/wikipedia/commons/thumb/5/5c/Flag_of_the_Taliban.svg/320px-Flag_of_the_Taliban.svg.png',NULL);
INSERT INTO TBL_PAIS (nome, bandeira, votos) VALUES ('Kyrgyzstan','https://flagcdn.com/w320/kg.png',NULL);
INSERT INTO TBL_PAIS (nome, bandeira, votos) VALUES ('Norfolk Island','https://flagcdn.com/w320/nf.png',NULL);
INSERT INTO TBL_PAIS (nome, bandeira, votos) VALUES ('Vanuatu','https://flagcdn.com/w320/vu.png',NULL);
INSERT INTO TBL_PAIS (nome, bandeira, votos) VALUES ('United Arab Emirates','https://flagcdn.com/w320/ae.png',NULL);
INSERT INTO TBL_PAIS (nome, bandeira, votos) VALUES ('Lesotho','https://flagcdn.com/w320/ls.png',NULL);
INSERT INTO TBL_PAIS (nome, bandeira, votos) VALUES ('Myanmar','https://flagcdn.com/w320/mm.png',NULL);
INSERT INTO TBL_PAIS (nome, bandeira, votos) VALUES ('United Kingdom','https://flagcdn.com/w320/gb.png',NULL);
INSERT INTO TBL_PAIS (nome, bandeira, votos) VALUES ('Norway','https://flagcdn.com/w320/no.png',NULL);
INSERT INTO TBL_PAIS (nome, bandeira, votos) VALUES ('Réunion','https://flagcdn.com/w320/re.png',NULL);
INSERT INTO TBL_PAIS (nome, bandeira, votos) VALUES ('South Korea','https://flagcdn.com/w320/kr.png',NULL);
INSERT INTO TBL_PAIS (nome, bandeira, votos) VALUES ('Turks and Caicos Islands','https://flagcdn.com/w320/tc.png',NULL);
INSERT INTO TBL_PAIS (nome, bandeira, votos) VALUES ('Djibouti','https://flagcdn.com/w320/dj.png',NULL);
INSERT INTO TBL_PAIS (nome, bandeira, votos) VALUES ('Australia','https://flagcdn.com/w320/au.png',NULL);
INSERT INTO TBL_PAIS (nome, bandeira, votos) VALUES ('Marshall Islands','https://flagcdn.com/w320/mh.png',NULL);
INSERT INTO TBL_PAIS (nome, bandeira, votos) VALUES ('Oman','https://flagcdn.com/w320/om.png',NULL);
INSERT INTO TBL_PAIS (nome, bandeira, votos) VALUES ('Nepal','https://flagcdn.com/w320/np.png',NULL);
INSERT INTO TBL_PAIS (nome, bandeira, votos) VALUES ('Niue','https://flagcdn.com/w320/nu.png',NULL);
INSERT INTO TBL_PAIS (nome, bandeira, votos) VALUES ('Togo','https://flagcdn.com/w320/tg.png',NULL);
INSERT INTO TBL_PAIS (nome, bandeira, votos) VALUES ('Republic of the Congo','https://flagcdn.com/w320/cg.png',NULL);
INSERT INTO TBL_PAIS (nome, bandeira, votos) VALUES ('Madagascar','https://flagcdn.com/w320/mg.png',NULL);
INSERT INTO TBL_PAIS (nome, bandeira, votos) VALUES ('San Marino','https://flagcdn.com/w320/sm.png',NULL);
INSERT INTO TBL_PAIS (nome, bandeira, votos) VALUES ('Lithuania','https://flagcdn.com/w320/lt.png',NULL);
INSERT INTO TBL_PAIS (nome, bandeira, votos) VALUES ('Bhutan','https://flagcdn.com/w320/bt.png',NULL);
INSERT INTO TBL_PAIS (nome, bandeira, votos) VALUES ('Ivory Coast','https://flagcdn.com/w320/ci.png',NULL);
INSERT INTO TBL_PAIS (nome, bandeira, votos) VALUES ('Saint Kitts and Nevis','https://flagcdn.com/w320/kn.png',NULL);
INSERT INTO TBL_PAIS (nome, bandeira, votos) VALUES ('Switzerland','https://flagcdn.com/w320/ch.png',NULL);
INSERT INTO TBL_PAIS (nome, bandeira, votos) VALUES ('Isle of Man','https://flagcdn.com/w320/im.png',NULL);
INSERT INTO TBL_PAIS (nome, bandeira, votos) VALUES ('Monaco','https://flagcdn.com/w320/mc.png',NULL);
INSERT INTO TBL_PAIS (nome, bandeira, votos) VALUES ('Ghana','https://flagcdn.com/w320/gh.png',NULL);
INSERT INTO TBL_PAIS (nome, bandeira, votos) VALUES ('Kosovo','https://flagcdn.com/w320/xk.png',NULL);
INSERT INTO TBL_PAIS (nome, bandeira, votos) VALUES ('Seychelles','https://flagcdn.com/w320/sc.png',NULL);
INSERT INTO TBL_PAIS (nome, bandeira, votos) VALUES ('Grenada','https://flagcdn.com/w320/gd.png',NULL);
INSERT INTO TBL_PAIS (nome, bandeira, votos) VALUES ('Mauritania','https://flagcdn.com/w320/mr.png',NULL);
INSERT INTO TBL_PAIS (nome, bandeira, votos) VALUES ('New Zealand','https://flagcdn.com/w320/nz.png',NULL);
INSERT INTO TBL_PAIS (nome, bandeira, votos) VALUES ('Guinea','https://flagcdn.com/w320/gn.png',NULL);
INSERT INTO TBL_PAIS (nome, bandeira, votos) VALUES ('Tonga','https://flagcdn.com/w320/to.png',NULL);
INSERT INTO TBL_PAIS (nome, bandeira, votos) VALUES ('Italy','https://flagcdn.com/w320/it.png',NULL);
INSERT INTO TBL_PAIS (nome, bandeira, votos) VALUES ('Albania','https://flagcdn.com/w320/al.png',NULL);
INSERT INTO TBL_PAIS (nome, bandeira, votos) VALUES ('Bolivia','https://flagcdn.com/w320/bo.png',NULL);
INSERT INTO TBL_PAIS (nome, bandeira, votos) VALUES ('DR Congo','https://flagcdn.com/w320/cd.png',NULL);
INSERT INTO TBL_PAIS (nome, bandeira, votos) VALUES ('Palau','https://flagcdn.com/w320/pw.png',NULL);
INSERT INTO TBL_PAIS (nome, bandeira, votos) VALUES ('Libya','https://flagcdn.com/w320/ly.png',NULL);
INSERT INTO TBL_PAIS (nome, bandeira, votos) VALUES ('Puerto Rico','https://flagcdn.com/w320/pr.png',NULL);
INSERT INTO TBL_PAIS (nome, bandeira, votos) VALUES ('Russia','https://flagcdn.com/w320/ru.png',NULL);
INSERT INTO TBL_PAIS (nome, bandeira, votos) VALUES ('Chile','https://flagcdn.com/w320/cl.png',NULL);
INSERT INTO TBL_PAIS (nome, bandeira, votos) VALUES ('Jordan','https://flagcdn.com/w320/jo.png',NULL);
INSERT INTO TBL_PAIS (nome, bandeira, votos) VALUES ('Bermuda','https://flagcdn.com/w320/bm.png',NULL);
INSERT INTO TBL_PAIS (nome, bandeira, votos) VALUES ('South Africa','https://flagcdn.com/w320/za.png',NULL);
INSERT INTO TBL_PAIS (nome, bandeira, votos) VALUES ('Sri Lanka','https://flagcdn.com/w320/lk.png',NULL);
INSERT INTO TBL_PAIS (nome, bandeira, votos) VALUES ('Antigua and Barbuda','https://flagcdn.com/w320/ag.png',NULL);
INSERT INTO TBL_PAIS (nome, bandeira, votos) VALUES ('Ethiopia','https://flagcdn.com/w320/et.png',NULL);
INSERT INTO TBL_PAIS (nome, bandeira, votos) VALUES ('Iceland','https://flagcdn.com/w320/is.png',NULL);
INSERT INTO TBL_PAIS (nome, bandeira, votos) VALUES ('Guatemala','https://flagcdn.com/w320/gt.png',NULL);
INSERT INTO TBL_PAIS (nome, bandeira, votos) VALUES ('Tuvalu','https://flagcdn.com/w320/tv.png',NULL);
INSERT INTO TBL_PAIS (nome, bandeira, votos) VALUES ('Heard Island and McDonald Islands','https://flagcdn.com/w320/hm.png',NULL);
INSERT INTO TBL_PAIS (nome, bandeira, votos) VALUES ('São Tomé and Príncipe','https://flagcdn.com/w320/st.png',NULL);
INSERT INTO TBL_PAIS (nome, bandeira, votos) VALUES ('Egypt','https://flagcdn.com/w320/eg.png',NULL);
INSERT INTO TBL_PAIS (nome, bandeira, votos) VALUES ('Bosnia and Herzegovina','https://flagcdn.com/w320/ba.png',NULL);
INSERT INTO TBL_PAIS (nome, bandeira, votos) VALUES ('Jersey','https://flagcdn.com/w320/je.png',NULL);
INSERT INTO TBL_PAIS (nome, bandeira, votos) VALUES ('Luxembourg','https://flagcdn.com/w320/lu.png',NULL);
INSERT INTO TBL_PAIS (nome, bandeira, votos) VALUES ('Guyana','https://flagcdn.com/w320/gy.png',NULL);
INSERT INTO TBL_PAIS (nome, bandeira, votos) VALUES ('Haiti','https://flagcdn.com/w320/ht.png',NULL);
INSERT INTO TBL_PAIS (nome, bandeira, votos) VALUES ('Qatar','https://flagcdn.com/w320/qa.png',NULL);
INSERT INTO TBL_PAIS (nome, bandeira, votos) VALUES ('Svalbard and Jan Mayen','https://flagcdn.com/w320/sj.png',NULL);
INSERT INTO TBL_PAIS (nome, bandeira, votos) VALUES ('Cambodia','https://flagcdn.com/w320/kh.png',NULL);
INSERT INTO TBL_PAIS (nome, bandeira, votos) VALUES ('Somalia','https://flagcdn.com/w320/so.png',NULL);
INSERT INTO TBL_PAIS (nome, bandeira, votos) VALUES ('Kenya','https://flagcdn.com/w320/ke.png',NULL);
INSERT INTO TBL_PAIS (nome, bandeira, votos) VALUES ('Nauru','https://flagcdn.com/w320/nr.png',NULL);

-- Users
    
INSERT INTO TBL_USUARIO (username, email, senha, fkPais) VALUES 
('joaosilva', 'joao.silva@email.com', 'senha123', 8),   -- Brasil
('mariasantos', 'maria.santos@email.com', 'mari456', 20), -- Áustria
('pedroalves', 'pedro.alves@email.com', 'pedro789', 57),  -- Alemanha
('anacarvalho', 'ana.carvalho@email.com', 'ana1011', 144), -- Portugal
('carlosrodrigues', 'carlos.rodrigues@email.com', 'carlos1213', 107), -- EUA
('luquinhas', 'lucas@lima', '1234ABC', 4);

-- Publi

INSERT INTO TBL_PUBLICACAO (descricao, dtPubli, denuncias, fkUsuario) VALUES
('Visitando o Cristo Redentor pela primeira vez!', NOW(), 0, 1), -- joaosilva / Brasil
('Passeio de bicicleta ao longo do Danúbio!', NOW(), 0, 2),      -- mariasantos / Áustria
('Arquitetura impressionante em Munique.', NOW(), 1, 3),         -- pedroalves / Alemanha
('Caminhada por Lisboa com muito pastel de nata!', NOW(), 0, 4), -- anacarvalho / Portugal
('Feriado no Grand Canyon, experiência inesquecível!', NOW(), 0, 5); -- carlosrodrigues / EUA

-- Imagem

INSERT INTO TBL_IMAGEM (imagem, fkPublicacao) VALUES
('https://cdn.pixabay.com/photo/2017/03/31/15/49/cristo-redentor-2191673_1280.jpg', 1),
('https://www.pedalareviajar.com.br/wp-content/uploads/2020/03/20190921_151959.jpg', 2),
('https://dynamic-media-cdn.tripadvisor.com/media/photo-o/04/24/5a/48/new-town-hall-neus-rathaus.jpg?w=1000&h=800&s=1', 3),
('https://dynamic-media-cdn.tripadvisor.com/media/photo-o/22/84/c5/8b/desde-1837.jpg?w=1400&h=800&s=1', 4),
('https://s2.glbimg.com/4RDNeI6pAs-e6D6oQm_rggyT2AE=/e.glbimg.com/og/ed/f/original/2019/04/13/fotos_canyon_marilia1.jpg', 5);

-- Comentarios

-- Comentários para publicação 1 (Brasil)
INSERT INTO TBL_COMENTARIO (descricao, fkPublicacao, fkUsuario) VALUES
('Demais! Quero visitar também.', 1, 2),
('Já fui, é lindo demais!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!', 1, 4);

-- Comentários para publicação 2 (Áustria)
INSERT INTO TBL_COMENTARIO (descricao, fkPublicacao, fkUsuario) VALUES
('Amo esse tipo de passeio!', 2, 3),
('Fotos lindas!', 2, 1);

-- Comentários para publicação 3 (Alemanha)
INSERT INTO TBL_COMENTARIO (descricao, fkPublicacao, fkUsuario) VALUES
('Munique é top demais!', 3, 5),
('A arquitetura é mesmo surreal.', 3, 2);

-- Comentários para publicação 4 (Portugal)
INSERT INTO TBL_COMENTARIO (descricao, fkPublicacao, fkUsuario) VALUES
('Fiquei com vontade de comer pastel agora.', 4, 1),
('Lisboa é maravilhosa!', 4, 3);

-- Comentários para publicação 5 (EUA)
INSERT INTO TBL_COMENTARIO (descricao, fkPublicacao, fkUsuario) VALUES
('Incrível! Deve ser emocionante ver de perto.', 5, 2),
('Sempre sonhei em ir aí.', 5, 4);

-- Conquistas

INSERT INTO TBL_CONQUISTA (fkPublicacao, fkPais) VALUES
(1, 8),    -- Brasil
(2, 20),   -- Áustria
(3, 57),   -- Alemanha
(4, 144),  -- Portugal
(5, 107);  -- EUA

-- ATV_Publi

INSERT INTO TBL_ATIVIDADE_PUBLI (fkUsuario, fkPublicacao) VALUES
(2, 1), (3, 1),         -- 2 curtidas pub 1
(1, 2), (4, 2), (5, 2), -- 3 curtidas pub 2
(1, 3),                 -- 1 curtida pub 3
(2, 4), (5, 4),         -- 2 curtidas pub 4
(1, 5), (2, 5), (3, 5); -- 3 curtidas pub 5

-- ATV_Coment

-- Atividades nos comentários da publicação 1
INSERT INTO TBL_ATIVIDADE_COMENT (fkUsuario, fkPublicacao, fkComentario) VALUES
(3, 1, 1),
(5, 1, 2);

-- Publicação 2
INSERT INTO TBL_ATIVIDADE_COMENT (fkUsuario, fkPublicacao, fkComentario) VALUES
(5, 2, 3),
(4, 2, 4);

-- Publicação 3
INSERT INTO TBL_ATIVIDADE_COMENT (fkUsuario, fkPublicacao, fkComentario) VALUES
(1, 3, 5),
(4, 3, 6);

-- Publicação 4
INSERT INTO TBL_ATIVIDADE_COMENT (fkUsuario, fkPublicacao, fkComentario) VALUES
(5, 4, 7),
(2, 4, 8);

-- Publicação 5
INSERT INTO TBL_ATIVIDADE_COMENT (fkUsuario, fkPublicacao, fkComentario) VALUES
(1, 5, 9),
(3, 5, 10);



-- SELECT --
SELECT * FROM TBL_PAIS;    
SELECT * FROM TBL_USUARIO;
SELECT * FROM TBL_PUBLICACAO;
SELECT * FROM TBL_COMENTARIO;
SELECT * FROM TBL_IMAGEM;
SELECT * FROM TBL_CONQUISTA;

SELECT 
	idPais as identificador, 
    nome as pais,
    bandeira
FROM
	TBL_PAIS;
-- ------------------------------------------------------------    
    
SELECT 
	idUsuario, 
	username, 
    email, 
    imgPerfil, 
    senha 
FROM 
	TBL_USUARIO 
WHERE 
	email = '${email}' AND senha = '${senha}';
-- ------------------------------------------------------------

SELECT 
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
-- ------------------------------------------------------------

SELECT 
	COUNT(idComentario) as contagem
FROM 
	TBL_COMENTARIO
WHERE
	fkPublicacao = 5;
-- ------------------------------------------------------------

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
GROUP BY
    c.idComentario,
    u.username,
    u.imgPerfil,
    c.descricao,
    c.dtPubli
ORDER BY 
    c.idComentario DESC;    
-- ------------------------------------------------------------

SELECT
    fkPublicacao as publiCurtida
FROM
	TBL_ATIVIDADE_PUBLI
WHERE
	fkUsuario = 1;
 -- ------------------------------------------------------------   

SELECT
    fkPublicacao as publiCurtida
FROM
	TBL_ATIVIDADE_COMENT
WHERE
	fkUsuario = 1;



-- UPDATES

UPDATE TBL_PUBLICACAO, (select r.denuncias FROM TBL_PUBLICACAO as r WHERE idRegistro = 1) as b 
SET TBL_PUBLICACAO.denuncias = b.denuncias + 1
WHERE TBL_PUBLICACAO.idPublicacao = 1;


-- INSERTS

INSERT INTO TBL_COMENTARIO (descricao, fkPublicacao, fkUsuario) VALUES
('Demais! Quero visitar também.', 1, 2);


-- DELETE

DELETE FROM TBL_ATIVIDADE_PUBLI WHERE fkPublicacao = 2 AND fkUsuario = 1;
