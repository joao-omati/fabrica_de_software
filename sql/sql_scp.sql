
/* Criando a Tabela Inscrito Convenio, ele é a nossa ficha de inscrição */

CREATE TABLE inscritoconvenio (
idfichaconvenio SERIAL PRIMARY KEY,
nomeinscrito VARCHAR NOT NULL,
dtnascimento TIMESTAMP NOT NULL,
testavpsico BOOLEAN NOT NULL DEFAULT FALSE,
tipoencaminhamento VARCHAR(50) NOT NULL CHECK (tipoencaminhamento IN ('CAPS,CRAS,CREAS,DEAM,DPDF,MPDFT,SES,SEJUS,UBS,Clinica Ana Lucia Chaves Fecury(Unieuro Asa Sul)')),
nomeresp VARCHAR(50),
grauresp VARCHAR(25),
cpfresp CHAR(11),
estadocivilresp VARCHAR(25),
tellcellresp VARCHAR(15),
emailresp VARCHAR(45),
estadocivilinscrito VARCHAR(25) NOT NULL UNIQUE CHECK (estadocivilinscrito IN ('Solteiro, Casado, Divorciado, Viúvo, União Estável, Nenhum, Outros')),
cpfinscrito CHAR(11) NOT NULL UNIQUE,
tellcellinscrito VARCHAR(16) NOT NULL,
contatourgencia VARCHAR(15) NOT NULL,
emailinscrito VARCHAR(50) NOT NULL,
identidadedegenero VARCHAR(25) NOT NULL CHECK (identidadedegenero IN('Masculino, Feminino, Não Binário, Transgênero, Outra')),
etnia VARCHAR(15) NOT NULL CHECK (etnia IN('Branca, Preta, Parda, Amarela, Indígena e Outra')),
religiao VARCHAR(30) NOT NULL CHECK (religiao IN('Católico','Evangélico','Budismo','Espirita', 'Hinduísmo', 'Islamismo', 'Judaismo', 'Religião de Matriz Africana', 'Sem religião', 'Outros')),
confirmlgpd BOOLEAN NOT NULL, 
dthinscricao TIMESTAMP NOT NULL,
status BOOLEAN DEFAULT TRUE
);

/* Criando a Tabela Inscrito Comunidade, ele é a nossa ficha de inscrição */

CREATE TABLE inscritocomunidade (
idfichacomunidade SERIAL PRIMARY KEY,
nomeinscrito VARCHAR(50) NOT NULL,
dtnascimento TIMESTAMP NOT NULL,
nomeresp VARCHAR(50),
grauresp VARCHAR(25),
cpfresp CHAR(11) UNIQUE,
estadocivilresp VARCHAR(25),
tellcellresp VARCHAR(45),
emailresp VARCHAR(45),
estadocivilinscrito VARCHAR(25) NOT NULL UNIQUE CHECK (estadocivilinscrito IN ('Solteiro, Casado, Divorciado, Viúvo, União Estável, Nenhum, Outros')),
cpfinscrito CHAR(11) NOT NULL UNIQUE,
tellcellinscrito VARCHAR(15) NOT NULL,
contatourgencia VARCHAR(15) NOT NULL,
emailinscrito VARCHAR(45) NOT NULL,
identidadegenero VARCHAR(25) NOT NULL CHECK(identidadegenero IN('Masculino, Feminino, Não Binário, Transgênero, Outra')),
etnia VARCHAR(15) NOT NULL CHECK (etnia IN('Branca, Preta, Parda, Amarela, Indígena e Outra')),
religiao VARCHAR(30) NOT NULL CHECK (religiao IN('Católico','Evangélico','Budismo','Espirita', 'Hinduísmo', 'Islamismo', 'Judaismo', 'Religião de Matriz Africana', 'Sem religião', 'Outros')),
confirmlgpd BOOLEAN NOT NULL,
dthinscricao TIMESTAMP NOT NULL,
status BOOLEAN DEFAULT TRUE
);

CREATE TABLE endereco(

	idendereco SERIAL PRIMARY KEY,
	idfichaconvenio INT UNIQUE,
	idfichacomunidade INT UNIQUE,
	cidade VARCHAR(40) NOT NULL,
	bairro VARCHAR(50),
	rua VARCHAR(10) NOT NULL,
	uf CHAR(2) DEFAULT 'DF' CHECK(uf in('DF')) NOT NULL,
	cep INT UNIQUE NOT NULL,
	FOREIGN KEY (idfichaconvenio) REFERENCES inscritoconvenio(idfichaconvenio),
	FOREIGN KEY (idfichacomunidade) REFERENCES inscritocomunidade(idfichacomunidade) 
);

/* Criando tabela referente ao atributo Tipo Terapia*/

CREATE TABLE tipoterapia(
	idtipoterapia SERIAL PRIMARY KEY,
	idfichaconvenio INT UNIQUE,
	idfichacomunidade INT UNIQUE,	
	individual VARCHAR(25) CHECK (individual IN ('infantil','adolecente','adulto','idoso')),
	familia VARCHAR(25),
	grupo VARCHAR(25),
	casal VARCHAR(25) CHECK(casal IN ('casual','namorados','noivos','casados','divorciados')),
	FOREIGN KEY (idfichaconvenio) REFERENCES inscritoconvenio(idfichaconvenio),
	FOREIGN  KEY (idfichacomunidade) REFERENCES inscritocomunidade(idfichacomunidade)
);

/* Criando tabela referente ao atributo PCDS e neuro advergências */

CREATE TABLE pcdsnd(
	idpcdnd SERIAL PRIMARY KEY,
	idfichaconvenio INT UNIQUE,
	idfichacomunidade INT UNIQUE,
	tea VARCHAR(40),
	tdah VARCHAR(60),
	deficienciafisicamotora VARCHAR(30),
	deficienciavisual VARCHAR(25),
	deficienciaauditiva VARCHAR(25),
	trantornoaprendizagem VARCHAR(30),
	superadotacao VARCHAR(20),
	FOREIGN KEY (idfichaconvenio) REFERENCES inscritoconvenio(idfichaconvenio),
	FOREIGN  KEY (idfichacomunidade) REFERENCES inscritocomunidade(idfichacomunidade)
);

/* Criando tabela do motivo de acompanhamento*/

CREATE TABLE motivoacompanhamento(
	idmotivoacamo SERIAL PRIMARY KEY,
	idfichaconvenio INT UNIQUE,
	idfichacomunidade INT UNIQUE,
	ansiedade VARCHAR(15),
	assediomoral VARCHAR(20),
	depressao VARCHAR(15),
	dfaprendizagem VARCHAR(30), /*ESSA COLUNA SE REFERE A DIFICULDADE DE APRENDIZAGEM*/
	humorinstavel VARCHAR(50),
	insonia VARCHAR(50),
	isolamentosocial VARCHAR(50),
	luto VARCHAR(15),
	tristeza VARCHAR(15),
	apatia VARCHAR(15),
	chorarfalcimente VARCHAR(15),
	exaustao VARCHAR(15),
	fadiga VARCHAR(15),
	faltanimo VARCHAR(15),
	violenciadomestica VARCHAR(25),
	assediosexual VARCHAR(20),
	outro VARCHAR(10),
	FOREIGN KEY (idfichaconvenio) REFERENCES inscritoconvenio(idfichaconvenio),
	FOREIGN  KEY (idfichacomunidade) REFERENCES inscritocomunidade(idfichacomunidade)
);

/*Criando Tabela para medicação*/

CREATE TABLE medicamento(
	idmedicamento SERIAL PRIMARY KEY,
	idfichaconvenio INT UNIQUE,
	idfichacomunidade INT UNIQUE,
	ansiolitico VARCHAR(25),
	antidepressivo VARCHAR(25),
	antipsicotico VARCHAR(25),
	estabhumor VARCHAR(25), /*estabilizador de humor*/
	memoriatct VARCHAR(25), /* memorização, concentração, atenção*/
	outro VARCHAR(25),
	FOREIGN KEY (idfichaconvenio) REFERENCES inscritoconvenio(idfichaconvenio),
	FOREIGN  KEY (idfichacomunidade) REFERENCES inscritocomunidade(idfichacomunidade)
);

/* Criando Tabela para Doenças Físicas*/

CREATE TABLE doencafisica(
	iddoencafisica SERIAL PRIMARY KEY,
	idfichaconvenio INT UNIQUE,
	idfichacomunidade INT UNIQUE,
	doencaresoiratoria VARCHAR(30),
	cancer VARCHAR(15),
	diabete VARCHAR(30),
	disfuncaosexual VARCHAR(30),
	doencadegenerativa VARCHAR(50),
	escleorosemultipla VARCHAR(50),
	hipertensaooucardiopatia VARCHAR(50),
	luposouautoimune VARCHAR(50),
	obesidade VARCHAR(15),
	problemasrenais VARCHAR(25),
	FOREIGN KEY (idfichaconvenio) REFERENCES inscritoconvenio(idfichaconvenio),
	FOREIGN  KEY (idfichacomunidade) REFERENCES inscritocomunidade(idfichacomunidade)
);

/* Criando tabela para disponibilidade */

CREATE TABLE disponibilidade(
	iddisponibilidade SERIAL PRIMARY KEY,
	idfichaconvenio INT UNIQUE,
	idfichacomunidade INT UNIQUE,
	manhadiasemana VARCHAR(25),
	tardediasemana VARCHAR(25),
	noitediasemna VARCHAR(25),
	sabado VARCHAR(25),
	FOREIGN KEY (idfichaconvenio) REFERENCES inscritoconvenio(idfichaconvenio),
	FOREIGN  KEY (idfichacomunidade) REFERENCES inscritocomunidade(idfichacomunidade)
);

/* Criando a entidade Coordenador */
CREATE TABLE coordenador(
	idcoordendor SERIAL PRIMARY KEY,
	nome VARCHAR(50),
	senha VARCHAR(16) UNIQUE
	cpf CHAR(11) UNIQUE,
	crp VARCHAR(11) UNIQUE,
	dthcoord TIMESTAMP NOT NULL,
	status BOOLEAN DEFAULT TRUE
);