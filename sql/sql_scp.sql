
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
	individualift BOOLEAN DEFAULT FALSE,
	individualadt BOOLEAN DEFAULT FALSE,
	individualadto BOOLEAN DEFAULT FALSE,
	individualids BOOLEAN DEFAULT FALSE,
	familia BOOLEAN DEFAULT FALSE,
	grupo BOOLEAN DEFAULT FALSE,
	casal BOOLEAN DEFAULT FALSE,
	FOREIGN KEY (idfichaconvenio) REFERENCES inscritoconvenio(idfichaconvenio),
	FOREIGN  KEY (idfichacomunidade) REFERENCES inscritocomunidade(idfichacomunidade)
);

/* Criando tabela referente ao atributo PCDS e neuro advergências */

CREATE TABLE pcdsnd(
	idpcdnd SERIAL PRIMARY KEY,
	idfichaconvenio INT UNIQUE,
	idfichacomunidade INT UNIQUE,
	tea BOOLEAN DEFAULT FALSE,
	tdah BOOLEAN DEFAULT FALSE,
	dffs BOOLEAN DEFAULT FALSE, /* campo referente ao atributo deficiência física ou motora*/
	dfv BOOLEAN DEFAULT FALSE, /* campo referente ao atributo deficiência visual*/
	dfa BOOLEAN DEFAULT FALSE, /* campo referente ao atributo deficiência auditiva*/
	ttap BOOLEAN DEFAULT FALSE, /* campo referente ao atributo transtorno de aprendizagem*/
	ahst BOOLEAN DEFAULT FALSE, /* campo referente ao atributo altas habilidades ou superdotação*/
	outro BOOLEAN DEFAULT FALSE,
	FOREIGN KEY (idfichaconvenio) REFERENCES inscritoconvenio(idfichaconvenio),
	FOREIGN  KEY (idfichacomunidade) REFERENCES inscritocomunidade(idfichacomunidade)
);

/* Criando tabela do motivo de acompanhamento*/

CREATE TABLE motivoacompanhamento(
	idmotivoacamo SERIAL PRIMARY KEY,
	idfichaconvenio INT UNIQUE,
	idfichacomunidade INT UNIQUE,
	ansiedade BOOLEAN DEFAULT FALSE,
	assediomoral BOOLEAN DEFAULT FALSE,
	depressao BOOLEAN DEFAULT FALSE,
	dfaprendizagem BOOLEAN DEFAULT FALSE, /* essa coluna é referente ao atributo dificuldade de aprendizagem*/
	humorinstavel BOOLEAN DEFAULT FALSE,
	insonia BOOLEAN DEFAULT FALSE,
	isolasocial BOOLEAN DEFAULT FALSE,
	luto BOOLEAN DEFAULT FALSE,
	tristeza BOOLEAN DEFAULT FALSE,
	apatia BOOLEAN DEFAULT FALSE,
	chorofc BOOLEAN DEFAULT FALSE, /* essa coluna é referente ao atributo choro facil */
	exaustao BOOLEAN DEFAULT FALSE,
	fadiga BOOLEAN DEFAULT FALSE,
	faltanimo BOOLEAN DEFAULT FALSE,
	vldt BOOLEAN DEFAULT FALSE, /* campo referente a violência domestica*/
	assediosexual BOOLEAN DEFAULT FALSE,
	outro BOOLEAN DEFAULT FALSE,
	FOREIGN KEY (idfichaconvenio) REFERENCES inscritoconvenio(idfichaconvenio),
	FOREIGN  KEY (idfichacomunidade) REFERENCES inscritocomunidade(idfichacomunidade)
);

/*Criando Tabela para medicação*/

CREATE TABLE medicamento(
	idmedicamento SERIAL PRIMARY KEY,
	idfichaconvenio INT UNIQUE,
	idfichacomunidade INT UNIQUE,
	ansiolitico BOOLEAN DEFAULT FALSE,
	antidepressivo BOOLEAN DEFAULT FALSE,
	antipsicotico BOOLEAN DEFAULT FALSE,
	estabhumor BOOLEAN DEFAULT FALSE, /*estabilizador de humor*/
	memoriatct BOOLEAN DEFAULT FALSE, /* memorização, concentração, atenção*/
	outro BOOLEAN DEFAULT FALSE,
	FOREIGN KEY (idfichaconvenio) REFERENCES inscritoconvenio(idfichaconvenio),
	FOREIGN  KEY (idfichacomunidade) REFERENCES inscritocomunidade(idfichacomunidade)
);

/* Criando Tabela para Doenças Físicas*/

CREATE TABLE doencafisica(
	iddoencafisica SERIAL PRIMARY KEY,
	idfichaconvenio INT UNIQUE,
	idfichacomunidade INT UNIQUE,
	doencaresp BOOLEAN DEFAULT FALSE, /* atributo referente a doenca respiratório*/
	cancer BOOLEAN DEFAULT FALSE,
	diabete BOOLEAN DEFAULT FALSE,
	disfusexual BOOLEAN DEFAULT FALSE, /* atributo referente a disfuncao sexual */
	doencadgt BOOLEAN DEFAULT FALSE, /* atributo referente a doenca degenerativa */
	escleorosemlt BOOLEAN DEFAULT FALSE, /* atributo referente a escleorose multipla */
	hcpt BOOLEAN DEFAULT FALSE, /* atributo referente a hipertensao ou cardiopatia */
	luposatm BOOLEAN DEFAULT FALSE, /* atributo referente ao lupos ou outras doencas autoimune */
	obesidade BOOLEAN DEFAULT FALSE, 
	pblmrenal BOOLEAN DEFAULT FALSE,/* atributo referente a problemas renais*/
	outro BOOLEAN DEFAULT FALSE,
	FOREIGN KEY (idfichaconvenio) REFERENCES inscritoconvenio(idfichaconvenio),
	FOREIGN  KEY (idfichacomunidade) REFERENCES inscritocomunidade(idfichacomunidade)
);

/* Criando tabela para disponibilidade */

CREATE TABLE disponibilidade(
	iddisponibilidade SERIAL PRIMARY KEY,
	idfichaconvenio INT UNIQUE,
	idfichacomunidade INT UNIQUE,
	manha BOOLEAN DEFAULT FALSE,
	tarde BOOLEAN DEFAULT FALSE,
	noite BOOLEAN DEFAULT FALSE,
	sabado BOOLEAN DEFAULT FALSE,
	FOREIGN KEY (idfichaconvenio) REFERENCES inscritoconvenio(idfichaconvenio),
	FOREIGN  KEY (idfichacomunidade) REFERENCES inscritocomunidade(idfichacomunidade)
);

/* Criando a entidade Coordenador */
CREATE TABLE coordenador(
	idcoordendor SERIAL PRIMARY KEY,
	nome VARCHAR(50),
	senha VARCHAR(255) UNIQUE,
	cpf CHAR(11) UNIQUE,
	crp VARCHAR(11) UNIQUE,
	dthcoord TIMESTAMP NOT NULL,
	status BOOLEAN DEFAULT TRUE
);