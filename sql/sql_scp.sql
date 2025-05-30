/*CREATE Database scp;*/

CREATE TABLE coordenador(
	idcoordenador SERIAL PRIMARY KEY,
	nome VARCHAR(50),
	senha VARCHAR(255) UNIQUE,
	cpf CHAR(11) UNIQUE,
	crp INT NOT NULL UNIQUE,
	dthcoord TIMESTAMP NOT NULL,
	status BOOLEAN DEFAULT TRUE,
	FOREIGN KEY (crp) REFERENCES coordenador(crp)
);

CREATE TABLE supervisor (
	idsupervisor SERIAL PRIMARY KEY,
	crpcoord INT UNIQUE NOT NULL,
	nome VARCHAR(50) NOT NULL,
	cpf CHAR(11) NOT NULL UNIQUE,
	crp INT NOT NULL UNIQUE,
	senha VARCHAR(255),
	dthsup TIMESTAMP NOT NULL,
	status BOOLEAN DEFAULT TRUE,
	FOREIGN KEY (crpcoord) REFERENCES coordenador(crp)	
);


/*ALTER TABLE supervisor
ALTER COLUMN crp TYPE INT;*/

/* ALTER TABLE supervisor
DROP CONSTRAINT supervisor_crpcoord_fkey; */ 

CREATE TABLE secretaria (
	idsecretaria SERIAL PRIMARY KEY,
	crpcoord INT UNIQUE NOT NULL,
	nome VARCHAR(50) NOT NULL,
	cpf CHAR(11) NOT NULL UNIQUE,
	codfuncionario INT NOT NULL UNIQUE,
	senha VARCHAR(255) NOT NULL,
	dthsec TIMESTAMP NOT NULL,
	status BOOLEAN DEFAULT TRUE,
	FOREIGN KEY (crpcoord) REFERENCES coordenador(crp)
);

CREATE TABLE resptec(
	idresptec SERIAL PRIMARY KEY,
	crpcoord INT NOT NULL UNIQUE,
	nome VARCHAR(50) NOT NULL,
	senha VARCHAR(255) NOT NULL,
	cpf CHAR(11) NOT NULL UNIQUE,
	crpresp INT NOT NULL UNIQUE,
	dthresp TIMESTAMP NOT NULL,
	status BOOLEAN DEFAULT TRUE,
	FOREIGN KEY (crpcoord) REFERENCES coordenador(crp)
);

CREATE TABLE estagiario (
	idestagiario SERIAL PRIMARY KEY,
	crpsup INT NOT NULL UNIQUE,
	crpcoord INT NOT NULL UNIQUE,
	nome VARCHAR(50) NOT NULL,
	ra INT NOT NULL UNIQUE,
	senha VARCHAR(10) NOT NULL,
	nivelestagio VARCHAR(10) NOT NULL,
	semestre VARCHAR(10) NOT NULL, 
	emailinst VARCHAR(45) NOT NULL UNIQUE,
	status BOOLEAN DEFAULT TRUE,
	FOREIGN KEY (crpsup) REFERENCES supervisor (crp),
	FOREIGN KEY (crpcoord) REFERENCES coordenador (crp)
);

select * from coordenador;
/* Para tirar Foreign key da tabela use o exemplo abaixo
ALTER TABLE estagiario
DROP CONSTRAINT estagiario_crpcoord_fkey;

DROP TABLE estagiario; */
