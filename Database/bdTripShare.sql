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
    fkVoto INT,
    CONSTRAINT fkUsuarioPais FOREIGN KEY (fkPais)
		REFERENCES TBL_PAIS(idPais),
	CONSTRAINT fkUsuarioVoto FOREIGN KEY (fkVoto)
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

INSERT INTO TBL_PAIS (nome, bandeira, votos) VALUES ('Eritrea','https://flagcdn.com/w320/er.png',7087);
INSERT INTO TBL_PAIS (nome, bandeira, votos) VALUES ('Cameroon','https://flagcdn.com/w320/cm.png',4352);
INSERT INTO TBL_PAIS (nome, bandeira, votos) VALUES ('Montenegro','https://flagcdn.com/w320/me.png',9376);
INSERT INTO TBL_PAIS (nome, bandeira, votos) VALUES ('Fiji','https://flagcdn.com/w320/fj.png',1214);
INSERT INTO TBL_PAIS (nome, bandeira, votos) VALUES ('Tunisia','https://flagcdn.com/w320/tn.png',3109);
INSERT INTO TBL_PAIS (nome, bandeira, votos) VALUES ('Senegal','https://flagcdn.com/w320/sn.png',8724);
INSERT INTO TBL_PAIS (nome, bandeira, votos) VALUES ('South Georgia','https://flagcdn.com/w320/gs.png',2543);
INSERT INTO TBL_PAIS (nome, bandeira, votos) VALUES ('Brazil','https://flagcdn.com/w320/br.png',10689);
INSERT INTO TBL_PAIS (nome, bandeira, votos) VALUES ('Liechtenstein','https://flagcdn.com/w320/li.png',6402);
INSERT INTO TBL_PAIS (nome, bandeira, votos) VALUES ('Mexico','https://flagcdn.com/w320/mx.png',2891);
INSERT INTO TBL_PAIS (nome, bandeira, votos) VALUES ('Palestine','https://flagcdn.com/w320/ps.png',6633);
INSERT INTO TBL_PAIS (nome, bandeira, votos) VALUES ('Greenland','https://flagcdn.com/w320/gl.png',2048);
INSERT INTO TBL_PAIS (nome, bandeira, votos) VALUES ('United States Minor Outlying Islands','https://flagcdn.com/w320/um.png',7825);
INSERT INTO TBL_PAIS (nome, bandeira, votos) VALUES ('Equatorial Guinea','https://flagcdn.com/w320/gq.png',4380);
INSERT INTO TBL_PAIS (nome, bandeira, votos) VALUES ('Guadeloupe','https://flagcdn.com/w320/gp.png',9570);
INSERT INTO TBL_PAIS (nome, bandeira, votos) VALUES ('Saint Helena, Ascension and Tristan da Cunha','https://flagcdn.com/w320/sh.png',3382);
INSERT INTO TBL_PAIS (nome, bandeira, votos) VALUES ('Turkey','https://flagcdn.com/w320/tr.png',3470);
INSERT INTO TBL_PAIS (nome, bandeira, votos) VALUES ('Chad','https://flagcdn.com/w320/td.png',5233);
INSERT INTO TBL_PAIS (nome, bandeira, votos) VALUES ('Honduras','https://flagcdn.com/w320/hn.png',6599);
INSERT INTO TBL_PAIS (nome, bandeira, votos) VALUES ('Austria','https://flagcdn.com/w320/at.png',9407);
INSERT INTO TBL_PAIS (nome, bandeira, votos) VALUES ('Romania','https://flagcdn.com/w320/ro.png',6704);
INSERT INTO TBL_PAIS (nome, bandeira, votos) VALUES ('Gabon','https://flagcdn.com/w320/ga.png',1429);
INSERT INTO TBL_PAIS (nome, bandeira, votos) VALUES ('Namibia','https://flagcdn.com/w320/na.png',2102);
INSERT INTO TBL_PAIS (nome, bandeira, votos) VALUES ('Rwanda','https://flagcdn.com/w320/rw.png',4926);
INSERT INTO TBL_PAIS (nome, bandeira, votos) VALUES ('Saint Vincent and the Grenadines','https://flagcdn.com/w320/vc.png',8318);
INSERT INTO TBL_PAIS (nome, bandeira, votos) VALUES ('Bulgaria','https://flagcdn.com/w320/bg.png',9746);
INSERT INTO TBL_PAIS (nome, bandeira, votos) VALUES ('Colombia','https://flagcdn.com/w320/co.png',5621);
INSERT INTO TBL_PAIS (nome, bandeira, votos) VALUES ('Suriname','https://flagcdn.com/w320/sr.png',7930);
INSERT INTO TBL_PAIS (nome, bandeira, votos) VALUES ('Zimbabwe','https://flagcdn.com/w320/zw.png',4986);
INSERT INTO TBL_PAIS (nome, bandeira, votos) VALUES ('Venezuela','https://flagcdn.com/w320/ve.png',8867);
INSERT INTO TBL_PAIS (nome, bandeira, votos) VALUES ('Eswatini','https://flagcdn.com/w320/sz.png',1817);
INSERT INTO TBL_PAIS (nome, bandeira, votos) VALUES ('Philippines','https://flagcdn.com/w320/ph.png',6914);
INSERT INTO TBL_PAIS (nome, bandeira, votos) VALUES ('Turkmenistan','https://flagcdn.com/w320/tm.png',1467);
INSERT INTO TBL_PAIS (nome, bandeira, votos) VALUES ('Algeria','https://flagcdn.com/w320/dz.png',2591);
INSERT INTO TBL_PAIS (nome, bandeira, votos) VALUES ('Niger','https://flagcdn.com/w320/ne.png',5996);
INSERT INTO TBL_PAIS (nome, bandeira, votos) VALUES ('Jamaica','https://flagcdn.com/w320/jm.png',1674);
INSERT INTO TBL_PAIS (nome, bandeira, votos) VALUES ('Armenia','https://flagcdn.com/w320/am.png',7220);
INSERT INTO TBL_PAIS (nome, bandeira, votos) VALUES ('Caribbean Netherlands','https://flagcdn.com/w320/bq.png',2130);
INSERT INTO TBL_PAIS (nome, bandeira, votos) VALUES ('Solomon Islands','https://flagcdn.com/w320/sb.png',3583);
INSERT INTO TBL_PAIS (nome, bandeira, votos) VALUES ('Cuba','https://flagcdn.com/w320/cu.png',8071);
INSERT INTO TBL_PAIS (nome, bandeira, votos) VALUES ('French','https://flagcdn.com/w320/tf.png',12358);
INSERT INTO TBL_PAIS (nome, bandeira, votos) VALUES ('Åland Islands','https://flagcdn.com/w320/ax.png',8667);
INSERT INTO TBL_PAIS (nome, bandeira, votos) VALUES ('United States Virgin Islands','https://flagcdn.com/w320/vi.png',7549);
INSERT INTO TBL_PAIS (nome, bandeira, votos) VALUES ('Liberia','https://flagcdn.com/w320/lr.png',1697);
INSERT INTO TBL_PAIS (nome, bandeira, votos) VALUES ('Sudan','https://flagcdn.com/w320/sd.png',5913);
INSERT INTO TBL_PAIS (nome, bandeira, votos) VALUES ('British Virgin Islands','https://flagcdn.com/w320/vg.png',7772);
INSERT INTO TBL_PAIS (nome, bandeira, votos) VALUES ('Tanzania','https://flagcdn.com/w320/tz.png',2472);
INSERT INTO TBL_PAIS (nome, bandeira, votos) VALUES ('Croatia','https://flagcdn.com/w320/hr.png',3043);
INSERT INTO TBL_PAIS (nome, bandeira, votos) VALUES ('Andorra','https://flagcdn.com/w320/ad.png',4045);
INSERT INTO TBL_PAIS (nome, bandeira, votos) VALUES ('Belize','https://flagcdn.com/w320/bz.png',1083);
INSERT INTO TBL_PAIS (nome, bandeira, votos) VALUES ('Barbados','https://flagcdn.com/w320/bb.png',6098);
INSERT INTO TBL_PAIS (nome, bandeira, votos) VALUES ('Slovakia','https://flagcdn.com/w320/sk.png',4048);
INSERT INTO TBL_PAIS (nome, bandeira, votos) VALUES ('Vatican City','https://flagcdn.com/w320/va.png',7412);
INSERT INTO TBL_PAIS (nome, bandeira, votos) VALUES ('Lebanon','https://flagcdn.com/w320/lb.png',6625);
INSERT INTO TBL_PAIS (nome, bandeira, votos) VALUES ('Moldova','https://flagcdn.com/w320/md.png',9194);
INSERT INTO TBL_PAIS (nome, bandeira, votos) VALUES ('Finland','https://flagcdn.com/w320/fi.png',4710);
INSERT INTO TBL_PAIS (nome, bandeira, votos) VALUES ('Taiwan','https://flagcdn.com/w320/tw.png',5951);
INSERT INTO TBL_PAIS (nome, bandeira, votos) VALUES ('Micronesia','https://flagcdn.com/w320/fm.png',3186);
INSERT INTO TBL_PAIS (nome, bandeira, votos) VALUES ('Vietnam','https://flagcdn.com/w320/vn.png',1420);
INSERT INTO TBL_PAIS (nome, bandeira, votos) VALUES ('French Polynesia','https://flagcdn.com/w320/pf.png',2917);
INSERT INTO TBL_PAIS (nome, bandeira, votos) VALUES ('Tokelau','https://flagcdn.com/w320/tk.png',9822);
INSERT INTO TBL_PAIS (nome, bandeira, votos) VALUES ('Germany','https://flagcdn.com/w320/de.png',4833);
INSERT INTO TBL_PAIS (nome, bandeira, votos) VALUES ('Uganda','https://flagcdn.com/w320/ug.png',1761);
INSERT INTO TBL_PAIS (nome, bandeira, votos) VALUES ('Sint Maarten','https://flagcdn.com/w320/sx.png',5614);
INSERT INTO TBL_PAIS (nome, bandeira, votos) VALUES ('Kazakhstan','https://flagcdn.com/w320/kz.png',6977);
INSERT INTO TBL_PAIS (nome, bandeira, votos) VALUES ('Northern Mariana Islands','https://flagcdn.com/w320/mp.png',8695);
INSERT INTO TBL_PAIS (nome, bandeira, votos) VALUES ('Dominica','https://flagcdn.com/w320/dm.png',7732);
INSERT INTO TBL_PAIS (nome, bandeira, votos) VALUES ('South Sudan','https://flagcdn.com/w320/ss.png',5036);
INSERT INTO TBL_PAIS (nome, bandeira, votos) VALUES ('American Samoa','https://flagcdn.com/w320/as.png',3611);
INSERT INTO TBL_PAIS (nome, bandeira, votos) VALUES ('Pitcairn Islands','https://flagcdn.com/w320/pn.png',4376);
INSERT INTO TBL_PAIS (nome, bandeira, votos) VALUES ('Tajikistan','https://flagcdn.com/w320/tj.png',2230);
INSERT INTO TBL_PAIS (nome, bandeira, votos) VALUES ('Wallis and Futuna','https://flagcdn.com/w320/wf.png',9443);
INSERT INTO TBL_PAIS (nome, bandeira, votos) VALUES ('Slovenia','https://flagcdn.com/w320/si.png',7947);
INSERT INTO TBL_PAIS (nome, bandeira, votos) VALUES ('Cape Verde','https://flagcdn.com/w320/cv.png',2758);
INSERT INTO TBL_PAIS (nome, bandeira, votos) VALUES ('Maldives','https://flagcdn.com/w320/mv.png',3469);
INSERT INTO TBL_PAIS (nome, bandeira, votos) VALUES ('Yemen','https://flagcdn.com/w320/ye.png',6758);
INSERT INTO TBL_PAIS (nome, bandeira, votos) VALUES ('North Korea','https://flagcdn.com/w320/kp.png',7382);
INSERT INTO TBL_PAIS (nome, bandeira, votos) VALUES ('Georgia','https://flagcdn.com/w320/ge.png',6085);
INSERT INTO TBL_PAIS (nome, bandeira, votos) VALUES ('Belgium','https://flagcdn.com/w320/be.png',5948);
INSERT INTO TBL_PAIS (nome, bandeira, votos) VALUES ('Uzbekistan','https://flagcdn.com/w320/uz.png',1501);
INSERT INTO TBL_PAIS (nome, bandeira, votos) VALUES ('Dominican Republic','https://flagcdn.com/w320/do.png',3804);
INSERT INTO TBL_PAIS (nome, bandeira, votos) VALUES ('Portugal','https://flagcdn.com/w320/pt.png',8087);
INSERT INTO TBL_PAIS (nome, bandeira, votos) VALUES ('Faroe Islands','https://flagcdn.com/w320/fo.png',6892);
INSERT INTO TBL_PAIS (nome, bandeira, votos) VALUES ('Western Sahara','https://flagcdn.com/w320/eh.png',3310);
INSERT INTO TBL_PAIS (nome, bandeira, votos) VALUES ('Martinique','https://flagcdn.com/w320/mq.png',2905);
INSERT INTO TBL_PAIS (nome, bandeira, votos) VALUES ('Saint Lucia','https://flagcdn.com/w320/lc.png',8231);
INSERT INTO TBL_PAIS (nome, bandeira, votos) VALUES ('Mozambique','https://flagcdn.com/w320/mz.png',1946);
INSERT INTO TBL_PAIS (nome, bandeira, votos) VALUES ('Thailand','https://flagcdn.com/w320/th.png',3739);
INSERT INTO TBL_PAIS (nome, bandeira, votos) VALUES ('Israel','https://flagcdn.com/w320/il.png',6823);
INSERT INTO TBL_PAIS (nome, bandeira, votos) VALUES ('Falkland Islands','https://flagcdn.com/w320/fk.png',2366);
INSERT INTO TBL_PAIS (nome, bandeira, votos) VALUES ('Benin','https://flagcdn.com/w320/bj.png',3254);
INSERT INTO TBL_PAIS (nome, bandeira, votos) VALUES ('Indonesia','https://flagcdn.com/w320/id.png',5527);
INSERT INTO TBL_PAIS (nome, bandeira, votos) VALUES ('Papua New Guinea','https://flagcdn.com/w320/pg.png',7674);
INSERT INTO TBL_PAIS (nome, bandeira, votos) VALUES ('Bahrain','https://flagcdn.com/w320/bh.png',8473);
INSERT INTO TBL_PAIS (nome, bandeira, votos) VALUES ('Macau','https://flagcdn.com/w320/mo.png',4744);
INSERT INTO TBL_PAIS (nome, bandeira, votos) VALUES ('Greece','https://flagcdn.com/w320/gr.png',4656);
INSERT INTO TBL_PAIS (nome, bandeira, votos) VALUES ('Syria','https://flagcdn.com/w320/sy.png',3971);
INSERT INTO TBL_PAIS (nome, bandeira, votos) VALUES ('Central African Republic','https://flagcdn.com/w320/cf.png',7263);
INSERT INTO TBL_PAIS (nome, bandeira, votos) VALUES ('Guam','https://flagcdn.com/w320/gu.png',8106);
INSERT INTO TBL_PAIS (nome, bandeira, votos) VALUES ('Poland','https://flagcdn.com/w320/pl.png',6543);
INSERT INTO TBL_PAIS (nome, bandeira, votos) VALUES ('Bouvet Island','https://flagcdn.com/w320/bv.png',3147);
INSERT INTO TBL_PAIS (nome, bandeira, votos) VALUES ('Antarctica','https://flagcdn.com/w320/aq.png',9866);
INSERT INTO TBL_PAIS (nome, bandeira, votos) VALUES ('United States','https://flagcdn.com/w320/us.png',9084);
INSERT INTO TBL_PAIS (nome, bandeira, votos) VALUES ('Zambia','https://flagcdn.com/w320/zm.png',6079);
INSERT INTO TBL_PAIS (nome, bandeira, votos) VALUES ('Kiribati','https://flagcdn.com/w320/ki.png',3723);
INSERT INTO TBL_PAIS (nome, bandeira, votos) VALUES ('Peru','https://flagcdn.com/w320/pe.png',1536);
INSERT INTO TBL_PAIS (nome, bandeira, votos) VALUES ('Uruguay','https://flagcdn.com/w320/uy.png',2759);
INSERT INTO TBL_PAIS (nome, bandeira, votos) VALUES ('Anguilla','https://flagcdn.com/w320/ai.png',8184);
INSERT INTO TBL_PAIS (nome, bandeira, votos) VALUES ('Iran','https://flagcdn.com/w320/ir.png',4322);
INSERT INTO TBL_PAIS (nome, bandeira, votos) VALUES ('El Salvador','https://flagcdn.com/w320/sv.png',6466);
INSERT INTO TBL_PAIS (nome, bandeira, votos) VALUES ('Hungary','https://flagcdn.com/w320/hu.png',1108);
INSERT INTO TBL_PAIS (nome, bandeira, votos) VALUES ('Samoa','https://flagcdn.com/w320/ws.png',7274);
INSERT INTO TBL_PAIS (nome, bandeira, votos) VALUES ('Ecuador','https://flagcdn.com/w320/ec.png',6997);
INSERT INTO TBL_PAIS (nome, bandeira, votos) VALUES ('France','https://flagcdn.com/w320/fr.png',3944);
INSERT INTO TBL_PAIS (nome, bandeira, votos) VALUES ('Nigeria','https://flagcdn.com/w320/ng.png',3718);
INSERT INTO TBL_PAIS (nome, bandeira, votos) VALUES ('India','https://flagcdn.com/w320/in.png',7428);
INSERT INTO TBL_PAIS (nome, bandeira, votos) VALUES ('Saint Martin','https://flagcdn.com/w320/mf.png',3185);
INSERT INTO TBL_PAIS (nome, bandeira, votos) VALUES ('Burkina Faso','https://flagcdn.com/w320/bf.png',5656);
INSERT INTO TBL_PAIS (nome, bandeira, votos) VALUES ('Iraq','https://flagcdn.com/w320/iq.png',8216);
INSERT INTO TBL_PAIS (nome, bandeira, votos) VALUES ('Kuwait','https://flagcdn.com/w320/kw.png',7140);
INSERT INTO TBL_PAIS (nome, bandeira, votos) VALUES ('Czechia','https://flagcdn.com/w320/cz.png',2446);
INSERT INTO TBL_PAIS (nome, bandeira, votos) VALUES ('Montserrat','https://flagcdn.com/w320/ms.png',1575);
INSERT INTO TBL_PAIS (nome, bandeira, votos) VALUES ('Morocco','https://flagcdn.com/w320/ma.png',4987);
INSERT INTO TBL_PAIS (nome, bandeira, votos) VALUES ('New Caledonia','https://flagcdn.com/w320/nc.png',9880);
INSERT INTO TBL_PAIS (nome, bandeira, votos) VALUES ('Gambia','https://flagcdn.com/w320/gm.png',2911);
INSERT INTO TBL_PAIS (nome, bandeira, votos) VALUES ('Netherlands','https://flagcdn.com/w320/nl.png',6361);
INSERT INTO TBL_PAIS (nome, bandeira, votos) VALUES ('Saint Pierre and Miquelon','https://flagcdn.com/w320/pm.png',2202);
INSERT INTO TBL_PAIS (nome, bandeira, votos) VALUES ('Saint Barthélemy','https://flagcdn.com/w320/bl.png',5639);
INSERT INTO TBL_PAIS (nome, bandeira, votos) VALUES ('Hong Kong','https://flagcdn.com/w320/hk.png',1900);
INSERT INTO TBL_PAIS (nome, bandeira, votos) VALUES ('China','https://flagcdn.com/w320/cn.png',5780);
INSERT INTO TBL_PAIS (nome, bandeira, votos) VALUES ('Ukraine','https://flagcdn.com/w320/ua.png',8352);
INSERT INTO TBL_PAIS (nome, bandeira, votos) VALUES ('Botswana','https://flagcdn.com/w320/bw.png',2501);
INSERT INTO TBL_PAIS (nome, bandeira, votos) VALUES ('Curaçao','https://flagcdn.com/w320/cw.png',6223);
INSERT INTO TBL_PAIS (nome, bandeira, votos) VALUES ('Serbia','https://flagcdn.com/w320/rs.png',3127);
INSERT INTO TBL_PAIS (nome, bandeira, votos) VALUES ('Sweden','https://flagcdn.com/w320/se.png',1323);
INSERT INTO TBL_PAIS (nome, bandeira, votos) VALUES ('Sierra Leone','https://flagcdn.com/w320/sl.png',7681);
INSERT INTO TBL_PAIS (nome, bandeira, votos) VALUES ('Spain','https://flagcdn.com/w320/es.png',5315);
INSERT INTO TBL_PAIS (nome, bandeira, votos) VALUES ('Panama','https://flagcdn.com/w320/pa.png',8794);
INSERT INTO TBL_PAIS (nome, bandeira, votos) VALUES ('Singapore','https://flagcdn.com/w320/sg.png',3281);
INSERT INTO TBL_PAIS (nome, bandeira, votos) VALUES ('Laos','https://flagcdn.com/w320/la.png',9854);
INSERT INTO TBL_PAIS (nome, bandeira, votos) VALUES ('Malawi','https://flagcdn.com/w320/mw.png',1766);
INSERT INTO TBL_PAIS (nome, bandeira, votos) VALUES ('Burundi','https://flagcdn.com/w320/bi.png',6163);
INSERT INTO TBL_PAIS (nome, bandeira, votos) VALUES ('Belarus','https://flagcdn.com/w320/by.png',4760);
INSERT INTO TBL_PAIS (nome, bandeira, votos) VALUES ('Cayman Islands','https://flagcdn.com/w320/ky.png',4327);
INSERT INTO TBL_PAIS (nome, bandeira, votos) VALUES ('Malaysia','https://flagcdn.com/w320/my.png',6890);
INSERT INTO TBL_PAIS (nome, bandeira, votos) VALUES ('Pakistan','https://flagcdn.com/w320/pk.png',1402);
INSERT INTO TBL_PAIS (nome, bandeira, votos) VALUES ('Argentina','https://flagcdn.com/w320/ar.png',8517);
INSERT INTO TBL_PAIS (nome, bandeira, votos) VALUES ('Angola','https://flagcdn.com/w320/ao.png',2609);
INSERT INTO TBL_PAIS (nome, bandeira, votos) VALUES ('Malta','https://flagcdn.com/w320/mt.png',7061);
INSERT INTO TBL_PAIS (nome, bandeira, votos) VALUES ('Aruba','https://flagcdn.com/w320/aw.png',4235);
INSERT INTO TBL_PAIS (nome, bandeira, votos) VALUES ('Paraguay','https://flagcdn.com/w320/py.png',9571);
INSERT INTO TBL_PAIS (nome, bandeira, votos) VALUES ('Guinea-Bissau','https://flagcdn.com/w320/gw.png',4978);
INSERT INTO TBL_PAIS (nome, bandeira, votos) VALUES ('Saudi Arabia','https://flagcdn.com/w320/sa.png',2953);
INSERT INTO TBL_PAIS (nome, bandeira, votos) VALUES ('Gibraltar','https://flagcdn.com/w320/gi.png',7898);
INSERT INTO TBL_PAIS (nome, bandeira, votos) VALUES ('Nicaragua','https://flagcdn.com/w320/ni.png',3154);
INSERT INTO TBL_PAIS (nome, bandeira, votos) VALUES ('Ireland','https://flagcdn.com/w320/ie.png',4989);
INSERT INTO TBL_PAIS (nome, bandeira, votos) VALUES ('Mali','https://flagcdn.com/w320/ml.png',6138);
INSERT INTO TBL_PAIS (nome, bandeira, votos) VALUES ('Costa Rica','https://flagcdn.com/w320/cr.png',7246);
INSERT INTO TBL_PAIS (nome, bandeira, votos) VALUES ('British Indian Ocean Territory','https://flagcdn.com/w320/io.png',4997);
INSERT INTO TBL_PAIS (nome, bandeira, votos) VALUES ('Mongolia','https://flagcdn.com/w320/mn.png',3112);
INSERT INTO TBL_PAIS (nome, bandeira, votos) VALUES ('French Guiana','https://flagcdn.com/w320/gf.png',2760);
INSERT INTO TBL_PAIS (nome, bandeira, votos) VALUES ('Canada','https://flagcdn.com/w320/ca.png',8940);
INSERT INTO TBL_PAIS (nome, bandeira, votos) VALUES ('Cook Islands','https://flagcdn.com/w320/ck.png',5420);
INSERT INTO TBL_PAIS (nome, bandeira, votos) VALUES ('Estonia','https://flagcdn.com/w320/ee.png',2167);
INSERT INTO TBL_PAIS (nome, bandeira, votos) VALUES ('Trinidad and Tobago','https://flagcdn.com/w320/tt.png',8450);
INSERT INTO TBL_PAIS (nome, bandeira, votos) VALUES ('Cocos (Keeling) Islands','https://flagcdn.com/w320/cc.png',1465);
INSERT INTO TBL_PAIS (nome, bandeira, votos) VALUES ('Comoros','https://flagcdn.com/w320/km.png',4384);
INSERT INTO TBL_PAIS (nome, bandeira, votos) VALUES ('Christmas Island','https://flagcdn.com/w320/cx.png',8802);
INSERT INTO TBL_PAIS (nome, bandeira, votos) VALUES ('Timor-Leste','https://flagcdn.com/w320/tl.png',5716);
INSERT INTO TBL_PAIS (nome, bandeira, votos) VALUES ('Denmark','https://flagcdn.com/w320/dk.png',7385);
INSERT INTO TBL_PAIS (nome, bandeira, votos) VALUES ('North Macedonia','https://flagcdn.com/w320/mk.png',4231);
INSERT INTO TBL_PAIS (nome, bandeira, votos) VALUES ('Bangladesh','https://flagcdn.com/w320/bd.png',9843);
INSERT INTO TBL_PAIS (nome, bandeira, votos) VALUES ('Mauritius','https://flagcdn.com/w320/mu.png',1357);
INSERT INTO TBL_PAIS (nome, bandeira, votos) VALUES ('Cyprus','https://flagcdn.com/w320/cy.png',6549);
INSERT INTO TBL_PAIS (nome, bandeira, votos) VALUES ('Guernsey','https://flagcdn.com/w320/gg.png',3478);
INSERT INTO TBL_PAIS (nome, bandeira, votos) VALUES ('Brunei','https://flagcdn.com/w320/bn.png',4612);
INSERT INTO TBL_PAIS (nome, bandeira, votos) VALUES ('Japan','https://flagcdn.com/w320/jp.png',3137);
INSERT INTO TBL_PAIS (nome, bandeira, votos) VALUES ('Azerbaijan','https://flagcdn.com/w320/az.png',7441);
INSERT INTO TBL_PAIS (nome, bandeira, votos) VALUES ('Bahamas','https://flagcdn.com/w320/bs.png',2764);
INSERT INTO TBL_PAIS (nome, bandeira, votos) VALUES ('Latvia','https://flagcdn.com/w320/lv.png',5027);
INSERT INTO TBL_PAIS (nome, bandeira, votos) VALUES ('Mayotte','https://flagcdn.com/w320/yt.png',6928);
INSERT INTO TBL_PAIS (nome, bandeira, votos) VALUES ('Afghanistan','https://upload.wikimedia.org/wikipedia/commons/thumb/5/5c/Flag_of_the_Taliban.svg/320px-Flag_of_the_Taliban.svg.png',3940);
INSERT INTO TBL_PAIS (nome, bandeira, votos) VALUES ('Kyrgyzstan','https://flagcdn.com/w320/kg.png',3270);
INSERT INTO TBL_PAIS (nome, bandeira, votos) VALUES ('Norfolk Island','https://flagcdn.com/w320/nf.png',6705);
INSERT INTO TBL_PAIS (nome, bandeira, votos) VALUES ('Vanuatu','https://flagcdn.com/w320/vu.png',5922);
INSERT INTO TBL_PAIS (nome, bandeira, votos) VALUES ('United Arab Emirates','https://flagcdn.com/w320/ae.png',8539);
INSERT INTO TBL_PAIS (nome, bandeira, votos) VALUES ('Lesotho','https://flagcdn.com/w320/ls.png',7366);
INSERT INTO TBL_PAIS (nome, bandeira, votos) VALUES ('Myanmar','https://flagcdn.com/w320/mm.png',1084);
INSERT INTO TBL_PAIS (nome, bandeira, votos) VALUES ('United Kingdom','https://flagcdn.com/w320/gb.png',2281);
INSERT INTO TBL_PAIS (nome, bandeira, votos) VALUES ('Norway','https://flagcdn.com/w320/no.png',3874);
INSERT INTO TBL_PAIS (nome, bandeira, votos) VALUES ('Réunion','https://flagcdn.com/w320/re.png',8035);
INSERT INTO TBL_PAIS (nome, bandeira, votos) VALUES ('South Korea','https://flagcdn.com/w320/kr.png',4652);
INSERT INTO TBL_PAIS (nome, bandeira, votos) VALUES ('Turks and Caicos Islands','https://flagcdn.com/w320/tc.png',7346);
INSERT INTO TBL_PAIS (nome, bandeira, votos) VALUES ('Djibouti','https://flagcdn.com/w320/dj.png',2893);
INSERT INTO TBL_PAIS (nome, bandeira, votos) VALUES ('Australia','https://flagcdn.com/w320/au.png',1844);
INSERT INTO TBL_PAIS (nome, bandeira, votos) VALUES ('Marshall Islands','https://flagcdn.com/w320/mh.png',8265);
INSERT INTO TBL_PAIS (nome, bandeira, votos) VALUES ('Oman','https://flagcdn.com/w320/om.png',6531);
INSERT INTO TBL_PAIS (nome, bandeira, votos) VALUES ('Nepal','https://flagcdn.com/w320/np.png',7580);
INSERT INTO TBL_PAIS (nome, bandeira, votos) VALUES ('Niue','https://flagcdn.com/w320/nu.png',4635);
INSERT INTO TBL_PAIS (nome, bandeira, votos) VALUES ('Togo','https://flagcdn.com/w320/tg.png',6021);
INSERT INTO TBL_PAIS (nome, bandeira, votos) VALUES ('Republic of the Congo','https://flagcdn.com/w320/cg.png',4177);
INSERT INTO TBL_PAIS (nome, bandeira, votos) VALUES ('Madagascar','https://flagcdn.com/w320/mg.png',7702);
INSERT INTO TBL_PAIS (nome, bandeira, votos) VALUES ('San Marino','https://flagcdn.com/w320/sm.png',3656);
INSERT INTO TBL_PAIS (nome, bandeira, votos) VALUES ('Lithuania','https://flagcdn.com/w320/lt.png',9071);
INSERT INTO TBL_PAIS (nome, bandeira, votos) VALUES ('Bhutan','https://flagcdn.com/w320/bt.png',5534);
INSERT INTO TBL_PAIS (nome, bandeira, votos) VALUES ('Ivory Coast','https://flagcdn.com/w320/ci.png',5067);
INSERT INTO TBL_PAIS (nome, bandeira, votos) VALUES ('Saint Kitts and Nevis','https://flagcdn.com/w320/kn.png',7004);
INSERT INTO TBL_PAIS (nome, bandeira, votos) VALUES ('Switzerland','https://flagcdn.com/w320/ch.png',5984);
INSERT INTO TBL_PAIS (nome, bandeira, votos) VALUES ('Isle of Man','https://flagcdn.com/w320/im.png',7459);
INSERT INTO TBL_PAIS (nome, bandeira, votos) VALUES ('Monaco','https://flagcdn.com/w320/mc.png',4087);
INSERT INTO TBL_PAIS (nome, bandeira, votos) VALUES ('Ghana','https://flagcdn.com/w320/gh.png',9913);
INSERT INTO TBL_PAIS (nome, bandeira, votos) VALUES ('Kosovo','https://flagcdn.com/w320/xk.png',5963);
INSERT INTO TBL_PAIS (nome, bandeira, votos) VALUES ('Seychelles','https://flagcdn.com/w320/sc.png',3384);
INSERT INTO TBL_PAIS (nome, bandeira, votos) VALUES ('Grenada','https://flagcdn.com/w320/gd.png',4366);
INSERT INTO TBL_PAIS (nome, bandeira, votos) VALUES ('Mauritania','https://flagcdn.com/w320/mr.png',6867);
INSERT INTO TBL_PAIS (nome, bandeira, votos) VALUES ('New Zealand','https://flagcdn.com/w320/nz.png',2897);
INSERT INTO TBL_PAIS (nome, bandeira, votos) VALUES ('Guinea','https://flagcdn.com/w320/gn.png',9021);
INSERT INTO TBL_PAIS (nome, bandeira, votos) VALUES ('Tonga','https://flagcdn.com/w320/to.png',4976);
INSERT INTO TBL_PAIS (nome, bandeira, votos) VALUES ('Italy','https://flagcdn.com/w320/it.png',3136);
INSERT INTO TBL_PAIS (nome, bandeira, votos) VALUES ('Albania','https://flagcdn.com/w320/al.png',6093);
INSERT INTO TBL_PAIS (nome, bandeira, votos) VALUES ('Bolivia','https://flagcdn.com/w320/bo.png',5128);
INSERT INTO TBL_PAIS (nome, bandeira, votos) VALUES ('DR Congo','https://flagcdn.com/w320/cd.png',2252);
INSERT INTO TBL_PAIS (nome, bandeira, votos) VALUES ('Palau','https://flagcdn.com/w320/pw.png',7644);
INSERT INTO TBL_PAIS (nome, bandeira, votos) VALUES ('Libya','https://flagcdn.com/w320/ly.png',4661);
INSERT INTO TBL_PAIS (nome, bandeira, votos) VALUES ('Puerto Rico','https://flagcdn.com/w320/pr.png',1936);
INSERT INTO TBL_PAIS (nome, bandeira, votos) VALUES ('Russia','https://flagcdn.com/w320/ru.png',8662);
INSERT INTO TBL_PAIS (nome, bandeira, votos) VALUES ('Chile','https://flagcdn.com/w320/cl.png',1445);
INSERT INTO TBL_PAIS (nome, bandeira, votos) VALUES ('Jordan','https://flagcdn.com/w320/jo.png',1827);
INSERT INTO TBL_PAIS (nome, bandeira, votos) VALUES ('Bermuda','https://flagcdn.com/w320/bm.png',7190);
INSERT INTO TBL_PAIS (nome, bandeira, votos) VALUES ('South Africa','https://flagcdn.com/w320/za.png',1756);
INSERT INTO TBL_PAIS (nome, bandeira, votos) VALUES ('Sri Lanka','https://flagcdn.com/w320/lk.png',3687);
INSERT INTO TBL_PAIS (nome, bandeira, votos) VALUES ('Antigua and Barbuda','https://flagcdn.com/w320/ag.png',2315);
INSERT INTO TBL_PAIS (nome, bandeira, votos) VALUES ('Ethiopia','https://flagcdn.com/w320/et.png',8086);
INSERT INTO TBL_PAIS (nome, bandeira, votos) VALUES ('Iceland','https://flagcdn.com/w320/is.png',4812);
INSERT INTO TBL_PAIS (nome, bandeira, votos) VALUES ('Guatemala','https://flagcdn.com/w320/gt.png',5274);
INSERT INTO TBL_PAIS (nome, bandeira, votos) VALUES ('Tuvalu','https://flagcdn.com/w320/tv.png',3326);
INSERT INTO TBL_PAIS (nome, bandeira, votos) VALUES ('Heard Island and McDonald Islands','https://flagcdn.com/w320/hm.png',2653);
INSERT INTO TBL_PAIS (nome, bandeira, votos) VALUES ('São Tomé and Príncipe','https://flagcdn.com/w320/st.png',6132);
INSERT INTO TBL_PAIS (nome, bandeira, votos) VALUES ('Egypt','https://flagcdn.com/w320/eg.png',1327);
INSERT INTO TBL_PAIS (nome, bandeira, votos) VALUES ('Bosnia and Herzegovina','https://flagcdn.com/w320/ba.png',9126);
INSERT INTO TBL_PAIS (nome, bandeira, votos) VALUES ('Jersey','https://flagcdn.com/w320/je.png',7317);
INSERT INTO TBL_PAIS (nome, bandeira, votos) VALUES ('Luxembourg','https://flagcdn.com/w320/lu.png',7915);
INSERT INTO TBL_PAIS (nome, bandeira, votos) VALUES ('Guyana','https://flagcdn.com/w320/gy.png',5283);
INSERT INTO TBL_PAIS (nome, bandeira, votos) VALUES ('Haiti','https://flagcdn.com/w320/ht.png',2042);
INSERT INTO TBL_PAIS (nome, bandeira, votos) VALUES ('Qatar','https://flagcdn.com/w320/qa.png',7511);
INSERT INTO TBL_PAIS (nome, bandeira, votos) VALUES ('Svalbard and Jan Mayen','https://flagcdn.com/w320/sj.png',5978);
INSERT INTO TBL_PAIS (nome, bandeira, votos) VALUES ('Cambodia','https://flagcdn.com/w320/kh.png',4701);
INSERT INTO TBL_PAIS (nome, bandeira, votos) VALUES ('Somalia','https://flagcdn.com/w320/so.png',8152);
INSERT INTO TBL_PAIS (nome, bandeira, votos) VALUES ('Kenya','https://flagcdn.com/w320/ke.png',5566);
INSERT INTO TBL_PAIS (nome, bandeira, votos) VALUES ('Nauru','https://flagcdn.com/w320/nr.png',3762);

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
	c.fkPublicacao as fkPublicacao,
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
-- ------------------------------------------------------------   

SELECT
	SUM(votos) as total
FROM
	TBL_PAIS;
-- ------------------------------------------------------------   

SELECT 
    p.nome,
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
-- ------------------------------------------------------------   

SELECT
	IFNULL(p.nome, 'Sem voto') AS voto
FROM 
	TBL_USUARIO u 
LEFT JOIN 
	TBL_PAIS p ON p.idPais = u.fkVoto
WHERE
	u.idUsuario = 1;
-- ------------------------------------------------------------   
    
SELECT 
	nome, 
    votos
FROM 
	TBL_PAIS
ORDER BY 
	votos DESC
LIMIT 5;


-- UPDATES

UPDATE TBL_PUBLICACAO, (select r.denuncias FROM TBL_PUBLICACAO as r WHERE idRegistro = 1) as b 
SET TBL_PUBLICACAO.denuncias = b.denuncias + 1
WHERE TBL_PUBLICACAO.idPublicacao = 1;

UPDATE TBL_USUARIO
SET fkVoto = 6
WHERE idUsuario = 6;

UPDATE TBL_PAIS
SET votos = votos + 1
WHERE idPais = 1;


-- INSERTS

INSERT INTO TBL_COMENTARIO (descricao, fkPublicacao, fkUsuario) VALUES
('Demais! Quero visitar também.', 1, 2);


-- DELETE

DELETE FROM TBL_ATIVIDADE_PUBLI WHERE fkPublicacao = 2 AND fkUsuario = 1;
