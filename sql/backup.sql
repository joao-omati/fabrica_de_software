CREATE TABLE prontuario (

	idprontuario SERIAL PRIMARY KEY,
	crpcoord INT, 
	crpsup INT ,
	ra INT ,
	idfichaconvenio INT,
	idfichacomunidade INT, 
	tcle BYTEA NOT NULL,
	dthprontuario TIMESTAMP NOT NULL,
	status BOOLEAN DEFAULT TRUE,
	FOREIGN KEY (crpcoord) REFERENCES coordenador (crp),
	FOREIGN KEY (crpsup) REFERENCES supervisor (crp),
	FOREIGN KEY (ra) REFERENCES estagiario (ra),
	FOREIGN KEY (idfichaconvenio) REFERENCES inscritoconvenio (idfichaconvenio),
	FOREIGN KEY (idfichacomunidade) REFERENCES inscritocomunidade (idfichacomunidade)

);

CREATE TABLE arquinscrito(
	idarqinscrito SERIAL PRIMARY KEY,
	idfichaconvenio INT,
	idfichacomunidade INT,
	status BOOLEAN DEFAULT TRUE,
	dtharquinscrito TIMESTAMP NOT NULL,
	FOREIGN KEY (idfichaconvenio) REFERENCES inscritoconvenio (idfichaconvenio),
	FOREIGN KEY (idfichacomunidade) REFERENCES inscritocomunidade (idfichacomunidade)	
);

CREATE TABLE arquivamento(
	idarquivamento SERIAL PRIMARY KEY,
	idsolicitacao INT NOT NULL,
	crpcoord INT,
	crpresp INT,
	idprontuario INT,
	idarqinscrito INT,
	dtharq TIMESTAMP DEFAULT NOW(),
	retencao TIMESTAMP GENERATED ALWAYS AS (dtharq + INTERVAL '5 years') STORED,
	justificativa VARCHAR(255),
	FOREIGN KEY (idsolicitacao) REFERENCES soliarquivamento (idsolicitacao),
	FOREIGN KEY (crpcoord) REFERENCES coordenador (crp),
	FOREIGN KEY (crpresp) REFERENCES resptec (crpresp),
	FOREIGN KEY (idprontuario) REFERENCES prontuario (idprontuario),
	FOREIGN KEY (idarqinscrito) REFERENCES arqinscrito (idarqinscrito)
);

CREATE TABLE soliarquivamento(
	idsloicitacao SERIAL PRIMARY KEY,
	idprontuario INT,
	idarqinscrito INT,
	idarquivamento INT NOT NULL,
	ra INT,
	dthsoliestagiario TIMESTAMP,
	crpsup INT,
	confirmsup BOOLEAN DEFAULT FALSE,
	dthsolisup TIMESTAMP,
	crpresp INT,
	confirmresp BOOLEAN DEFAULT FALSE,
	crpcoord INT,
	confirmcoord BOOLEAN DEFAULT FALSE,
	descricao VARCHAR(255),
	FOREIGN KEY (idprontuario) REFERENCES prontuario (idprontuario),
	FOREIGN KEY (idarqinscrito) REFERENCES arqinscrito (idarqinscrito),
	FOREIGN KEY (idarquivamento) REFERENCES arquivamento (idarquivamento),
	FOREIGN KEY (ra) REFERENCES estagiario (ra),
	FOREIGN KEY (crpsup) REFERENCES supervisor (crp),
	FOREIGN KEY (crpresp) REFERENCES resptec (crpresptec),
	FOREIGN KEY (crpcoord) REFERENCES coordenador (crp)
);