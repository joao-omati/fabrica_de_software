
/* Criando a Tabela Inscrito Convenio, ele é a nossa ficha de inscrição */


/* 

	OBSERVAÇÃO: VAMOS CRIAR UMA NOVA TABELA PARA O ESTAGIÁRIO ESCOLHER INSCRITO, POIS UM ESTAGIÁRIO PODE ESCOLHER VARIOS OU NENHUM INSCRITO 
	
	O INSCRITO PODE SER ESCOLIDO PPOR VÁRIOS OU NEM UM ESTAGIÁRIO	

*/

CREATE TABLE inscritoconvenio (
	idfichaconvenio SERIAL PRIMARY KEY,
	nomeinscrito VARCHAR(100) NOT NULL,
	dtnascimento DATE NOT NULL,
	testavpsico BOOLEAN NOT NULL DEFAULT FALSE,
	tipoencaminhamento VARCHAR(50) NOT NULL CHECK (tipoencaminhamento IN ('CAPS','CRAS','CREAS','DEAM','DPDF','MPDFT','SES','SEJUS','UBS','Clinica Ana Lucia Chaves Fecury Unieuro Asa Sul')),
	nomeresp VARCHAR(50),
	grauresp VARCHAR(25),
	cpfresp CHAR(11) UNIQUE,
	estadocivilresp VARCHAR(25) CHECK (estadocivilresp IN ('Solteiro', 'Casado', 'Divorciado', 'Viúvo', 'União Estável', 'Nenhum', 'Outros')),
	tellcellresp VARCHAR(20),
	emailresp VARCHAR(45),
	estadocivilinscrito VARCHAR(25) CHECK (estadocivilinscrito IN ('Solteiro', 'Casado', 'Divorciado', 'Viúvo', 'União Estável', 'Nenhum', 'Outros')),
	cpfinscrito CHAR(11) NOT NULL UNIQUE,
	tellcellinscrito VARCHAR(20) NOT NULL,
	contatourgencia VARCHAR(15) NOT NULL,
	nomecontatourgencia VARCHAR(50)NOT NULL,
	emailinscrito VARCHAR(50) NOT NULL,
	identidadegenero VARCHAR(25) NOT NULL CHECK (identidadegenero IN('Masculino', 'Feminino', 'Não Binário', 'Transgênero','Outros')),
	etnia VARCHAR(15) NOT NULL CHECK (etnia IN('Branca', 'Preta', 'Parda', 'Amarela', 'Indígena', 'Outras')),
	religiao VARCHAR(30) NOT NULL CHECK (religiao IN('Católico','Evangélico','Budismo','Espirita', 'Hinduísmo', 'Islamismo', 'Judaismo', 'Religião de Matriz Africana', 'Sem religião', 'Outros')),
	confirmlgpd BOOLEAN NOT NULL DEFAULT FALSE, 
	dthinscricao DATE NOT NULL DEFAULT NOW(),
	status BOOLEAN DEFAULT TRUE
);


/* Criando a Tabela Inscrito Comunidade, ele é a nossa ficha de inscrição */

CREATE TABLE inscritocomunidade (
	idfichacomunidade SERIAL PRIMARY KEY,
	nomeinscrito VARCHAR(100) NOT NULL,
	dtnascimento DATE NOT NULL,
	nomeresp VARCHAR(50),
	grauresp VARCHAR(25),
	cpfresp CHAR(11) UNIQUE,
	estadocivilresp VARCHAR(25) CHECK (estadocivilresp IN ('Solteiro', 'Casado', 'Divorciado', 'Viúvo', 'União Estável', 'Nenhum', 'Outros')),
	tellcellresp VARCHAR(20),
	emailresp VARCHAR(45),
	estadocivilinscrito VARCHAR(25) CHECK (estadocivilinscrito IN ('Solteiro', 'Casado', 'Divorciado', 'Viúvo', 'União Estável', 'Nenhum', 'Outros')),
	cpfinscrito CHAR(11) NOT NULL UNIQUE,
	tellcellinscrito VARCHAR(20) NOT NULL,
	contatourgencia VARCHAR(15) NOT NULL,
	nomecontatourgencia VARCHAR(50)NOT NULL,
	emailinscrito VARCHAR(45) NOT NULL,
	identidadegenero VARCHAR(25) NOT NULL CHECK(identidadegenero IN('Masculino', 'Feminino', 'Não Binário', 'Transgênero', 'Outros')),
	etnia VARCHAR(15) NOT NULL CHECK (etnia IN('Branca', 'Preta', 'Parda', 'Amarela', 'Indígena','Outras')),
	religiao VARCHAR(30) NOT NULL CHECK (religiao IN('Católico','Evangélico','Budismo','Espirita', 'Hinduísmo', 'Islamismo', 'Judaismo', 'Religião de Matriz Africana', 'Sem religião', 'Outros')),
	confirmlgpd BOOLEAN NOT NULL DEFAULT FALSE,
	dthinscricao DATE NOT NULL DEFAULT NOW(),
	status BOOLEAN DEFAULT TRUE
);

CREATE TABLE endereco (
	idendereco SERIAL PRIMARY KEY,
	idfichaconvenio INT,
	idfichacomunidade INT,
	cidade VARCHAR(40) NOT NULL,
	bairro VARCHAR(50),
	rua VARCHAR(100) NOT NULL,
	uf CHAR(2) DEFAULT 'DF' CHECK(uf in('DF')) NOT NULL,
	cep CHAR(10) UNIQUE NOT NULL,
	FOREIGN KEY (idfichaconvenio) REFERENCES inscritoconvenio(idfichaconvenio),
	FOREIGN KEY (idfichacomunidade) REFERENCES inscritocomunidade(idfichacomunidade) 
);

/* Criando tabela referente ao atributo Tipo Terapia*/

CREATE TABLE tipoterapia(
	idtipoterapia SERIAL PRIMARY KEY,
	idfichaconvenio INT,
	idfichacomunidade INT,	
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
	idfichaconvenio INT,
	idfichacomunidade INT,
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
	idmotivoacamp SERIAL PRIMARY KEY,
	idfichaconvenio INT,
	idfichacomunidade INT,
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
	idfichaconvenio INT,
	idfichacomunidade INT,
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
	idfichaconvenio INT,
	idfichacomunidade INT,
	doencaresp BOOLEAN DEFAULT FALSE, /* atributo referente a doenca respiratório*/
	cancer BOOLEAN DEFAULT FALSE,
	diabete BOOLEAN DEFAULT FALSE,
	disfusexual BOOLEAN DEFAULT FALSE, /* atributo referente a disfuncao sexual */
	doencadgt BOOLEAN DEFAULT FALSE, /* atributo referente a doenca degenerativa */
	escleorosemlt BOOLEAN DEFAULT FALSE, /* atributo referente a escleorose multipla */
	hcpt BOOLEAN DEFAULT FALSE, /* atributo referente a hipertensao ou cardiopatia */
	luposatm BOOLEAN DEFAULT FALSE, /* atributo referente ao lupos ou outras doencas autoimune */
	obesidade BOOLEAN DEFAULT FALSE, 
	pblmarenal BOOLEAN DEFAULT FALSE,/* atributo referente a problemas renais*/
	outro BOOLEAN DEFAULT FALSE,
	FOREIGN KEY (idfichaconvenio) REFERENCES inscritoconvenio(idfichaconvenio),
	FOREIGN  KEY (idfichacomunidade) REFERENCES inscritocomunidade(idfichacomunidade)
);

/* Criando tabela para disponibilidade */

CREATE TABLE disponibilidade(
	iddisponibilidade SERIAL PRIMARY KEY,
	idfichaconvenio INT,
	idfichacomunidade INT,
	manha BOOLEAN DEFAULT FALSE,
	tarde BOOLEAN DEFAULT FALSE,
	noite BOOLEAN DEFAULT FALSE,
	sabado BOOLEAN DEFAULT FALSE,
	FOREIGN KEY (idfichaconvenio) REFERENCES inscritoconvenio(idfichaconvenio),
	FOREIGN  KEY (idfichacomunidade) REFERENCES inscritocomunidade(idfichacomunidade)
);

/* Criando a entidade Coordenador */
CREATE TABLE coordenador (
	idcoordenador SERIAL PRIMARY KEY,
	nome VARCHAR(50) NOT NULL,
	senha VARCHAR(255) NOT NULL,
	cpf CHAR(11) UNIQUE NOT NULL,
	crp INT NOT NULL UNIQUE, /* CRP do coordenador que está sendo cadastrado*/
	crpcoord INT, /* CRP do coordenador que já existe no banco*/
	dthcoord TIMESTAMP NOT NULL DEFAULT NOW(),
	emailinst VARCHAR (255) NOT NULL, /* email-institucuinal do coordenador*/
	status BOOLEAN DEFAULT TRUE,
	FOREIGN KEY (crpcoord) REFERENCES coordenador(crp)
);

/* Modificando a coluna senha do coordenador para ter 255 caracteres, assim irá comportar senhas hash

	ALTER TABLE coordenador

	ALTER COLUMN senha TYPE VARCHAR(255);

*/

/* 
	Modificando a coluna senha do coordenador para ter 255 caracteres, assim irá comportar senhas hash 
	ALTER TABLE coordenador
	ALTER COLUMN senha TYPE VARCHAR(255); 
*/

CREATE TABLE supervisor (
	idsupervisor SERIAL PRIMARY KEY,
	crpcoord INT NOT NULL, /*Removi o UNIQUE assim ele pode cadastrar vários supervisores*/
	nome VARCHAR(50) NOT NULL,
	cpf CHAR(11) NOT NULL UNIQUE,
	crp INT NOT NULL UNIQUE,
	senha VARCHAR(255),
	emailinst VARCHAR (255), /*email institucional do supervisor*/
	dthsup TIMESTAMP NOT NULL DEFAULT NOW(), 
	status BOOLEAN DEFAULT TRUE,
	FOREIGN KEY (crpcoord) REFERENCES coordenador(crp)	
);


/*ALTER TABLE supervisor
ALTER COLUMN crp TYPE INT;*/

/* ALTER TABLE supervisor
DROP CONSTRAINT supervisor_crpcoord_fkey; */ 

CREATE TABLE secretaria (
	idsecretaria SERIAL PRIMARY KEY,
	crpcoord INT NOT NULL,
	nome VARCHAR(50) NOT NULL,
	cpf CHAR(11) NOT NULL UNIQUE,
	codfuncionario INT NOT NULL UNIQUE,
	senha VARCHAR(255) NOT NULL,
	dthsec TIMESTAMP NOT NULL DEFAULT NOW(),
	emailinst VARCHAR (255), /* email institucional da secretaria*/
	status BOOLEAN DEFAULT TRUE,
	FOREIGN KEY (crpcoord) REFERENCES coordenador(crp)
);

CREATE TABLE resptec(
	idresptec SERIAL PRIMARY KEY,
	crpcoord INT NOT NULL,
	nome VARCHAR(50) NOT NULL,
	senha VARCHAR(255) NOT NULL,
	cpf CHAR(11) NOT NULL UNIQUE,
	crpresp INT NOT NULL UNIQUE,
	dthresp TIMESTAMP NOT NULL DEFAULT NOW(),
	emailinst VARCHAR (255) NOT NULL, /* Email institucional da responsável técnica*/ 
	status BOOLEAN DEFAULT TRUE,
	FOREIGN KEY (crpcoord) REFERENCES coordenador(crp)
);

CREATE TABLE estagiario (
	idestagiario SERIAL PRIMARY KEY,
	crpsup INT NOT NULL,
	crpcoord INT NOT NULL,
	nome VARCHAR(50) NOT NULL,
	ra INT NOT NULL UNIQUE,
	senha VARCHAR(255) NOT NULL,
	nivelestagio VARCHAR(32) NOT NULL,
	semestre VARCHAR(32) NOT NULL, 
	emailinst VARCHAR(255) NOT NULL, /* Geralmente o email institucional deles é do supervisor, porém aqui podemos aceitar o email institucional do aluno */
	dthestg TIMESTAMP DEFAULT NOW(),
	status BOOLEAN DEFAULT TRUE,
	FOREIGN KEY (crpsup) REFERENCES supervisor (crp),
	FOREIGN KEY (crpcoord) REFERENCES coordenador (crp)
);


/* estagiainscrito */

CREATE TABLE  escolheins(
	idescolheins SERIAL PRIMARY KEY,
	idestagiario INT,
	idfichaconvenio INT,
	idfichacomunidade INT,
	status BOOLEAN DEFAULT FALSE,
	dthescolha TIMESTAMP DEFAULT NOW(),
	FOREIGN KEY (idestagiario) REFERENCES estagiario (idestagiario),
	FOREIGN KEY (idfichaconvenio) REFERENCES inscritoconvenio (idfichaconvenio),
	FOREIGN KEY (idfichacomunidade) REFERENCES inscritocomunidade (idfichacomunidade)
);

select * from coordenador;
/* Para tirar Foreign key da tabela use o exemplo abaixo
ALTER TABLE estagiario
DROP CONSTRAINT estagiario_crpcoord_fkey;

DROP TABLE estagiario; */


/* Criando tabela sala */
CREATE TABLE sala(
	idsala SERIAL PRIMARY KEY,
	codfuncionario INT, /* FK para secretária */
	crpresp INT, /* Fk para responsável tec */
	crpcoord INT, /* FK para coordenador */
	numsala INT NOT NULL,
	tiposala VARCHAR(10) NOT NULL,
	capacidade INT NOT NULL,
	dthsala TIMESTAMP NOT NULL DEFAULT NOW(),
	status BOOLEAN NOT NULL DEFAULT FALSE,
	FOREIGN KEY (crpcoord) REFERENCES coordenador (crp),
	FOREIGN KEY (codfuncionario) REFERENCES secretaria (codfuncionario),
	FOREIGN KEY (crpresp) REFERENCES resptec (crpresp)
);

/* Criando tabela Agendamento */

CREATE TABLE agendamento(
	idagendamento SERIAL PRIMARY KEY,
	idsala INT NOT NULL,
	codfuncionario INT,
	crpresp INT,
	crpcoord INT,
	confirmsec BOOLEAN DEFAULT FALSE,
	dthconfirmsec TIMESTAMP,
	confirmresp BOOLEAN DEFAULT FALSE,
	dthconfirmresp TIMESTAMP,
	confirmcoord BOOLEAN DEFAULT FALSE,
	dthconfirmcoord TIMESTAMP,
	FOREIGN KEY (idsala) REFERENCES sala(idsala),
	FOREIGN KEY (codfuncionario) REFERENCES secretaria (codfuncionario),
	FOREIGN KEY (crpresp) REFERENCES resptec (crpresp),
	FOREIGN KEY (crpcoord) REFERENCES coordenador (crp)
);

/* Criando tabela sala agendamento*/

CREATE TABLE salaagendamento(
	idsolicitacoes SERIAL PRIMARY KEY,
	idagendamento INT NOT NULL,
	crpsup INT,
	ra INT,
	dthsolisup TIMESTAMP,
	dthsoliest TIMESTAMP,
	FOREIGN KEY (idagendamento) REFERENCES agendamento(idagendamento),
	FOREIGN KEY (crpsup) REFERENCES supervisor (crp),
	FOREIGN KEY (ra) REFERENCES estagiario (ra)
);

/* CRIANDO TABELA PRONTUÁRIO */

CREATE TABLE prontuario (

	idprontuario SERIAL PRIMARY KEY,
	crpcoord INT, 
	crpsup INT ,
	ra INT ,
	idfichaconvenio INT,
	idfichacomunidade INT, 
	tcle BYTEA NOT NULL,
	dthprontuario TIMESTAMP NOT NULL DEFAULT NOW(),
	status BOOLEAN DEFAULT TRUE,
	FOREIGN KEY (crpcoord) REFERENCES coordenador (crp),
	FOREIGN KEY (crpsup) REFERENCES supervisor (crp),
	FOREIGN KEY (ra) REFERENCES estagiario (ra),
	FOREIGN KEY (idfichaconvenio) REFERENCES inscritoconvenio (idfichaconvenio),
	FOREIGN KEY (idfichacomunidade) REFERENCES inscritocomunidade (idfichacomunidade)
);

CREATE TABLE folhaevo (
	idfolhaevolução SERIAL PRIMARY KEY,
	idprontuario INT NOT NULL,
	folhaevolucao BYTEA NOT NULL,
	dthanexo TIMESTAMP NOT NULL DEFAULT NOW()
);

CREATE TABLE fichafreqest(
	idfichafreq SERIAL PRIMARY KEY,
	ra INT NOT NULL,
	crpsup INT,
	crpcoord INT,
	fichafreq BYTEA, 
	FOREIGN KEY (ra) REFERENCES estagiario (ra),
	FOREIGN KEY (crpsup) REFERENCES supervisor (crp),
	FOREIGN KEY (crpcoord) REFERENCES coordenador (crp)
);

CREATE TABLE anamnese(
	idanamnese SERIAL PRIMARY KEY,
	idprontuario INT,
	anamnesedoc BYTEA,
	dthanexo TIMESTAMP DEFAULT NOW(),
	FOREIGN KEY (idprontuario) REFERENCES prontuario(idprontuario)
);

CREATE TABLE laudomed(
	idlaudo SERIAL PRIMARY KEY,
	idprontuario INT,
	laudodoc BYTEA,
	dthanexo TIMESTAMP DEFAULT NOW(),
	FOREIGN KEY (idprontuario) REFERENCES prontuario(idprontuario)
);

CREATE TABLE arqinscrito(
	idarqinscrito SERIAL PRIMARY KEY,
	idfichaconvenio INT,
	idfichacomunidade INT,
	status BOOLEAN DEFAULT TRUE,
	dtharquinscrito TIMESTAMP NOT NULL DEFAULT NOW(),
	FOREIGN KEY (idfichaconvenio) REFERENCES inscritoconvenio (idfichaconvenio),
	FOREIGN KEY (idfichacomunidade) REFERENCES inscritocomunidade (idfichacomunidade)	
);

CREATE TABLE arquivamento(
	idarquivamento SERIAL PRIMARY KEY,
	crpcoord INT,
	crpresp INT,
	idprontuario INT,
	idarqinscrito INT,
	dtharq TIMESTAMP DEFAULT NOW(),
	retencao TIMESTAMP GENERATED ALWAYS AS (dtharq + INTERVAL '5 years') STORED,
	justificativa VARCHAR(255),
	FOREIGN KEY (crpcoord) REFERENCES coordenador (crp),
	FOREIGN KEY (crpresp) REFERENCES resptec (crpresp),
	FOREIGN KEY (idprontuario) REFERENCES prontuario (idprontuario),
	FOREIGN KEY (idarqinscrito) REFERENCES arqinscrito (idarqinscrito)
);


-- Tirei o Default False dos booleans para evitar complicações no futuro, neste boolean vamos permitir null
CREATE TABLE soliarquivamento(
	idsolicitacao SERIAL PRIMARY KEY,
	idprontuario INT,
	idarqinscrito INT,
	idarquivamento INT NOT NULL,
	ra INT,
	dthsoliestagiario TIMESTAMP,
	crpsup INT,
	confirmsup BOOLEAN,
	dthsolisup TIMESTAMP,
	crpresp INT,
	confirmresp BOOLEAN,
	crpcoord INT,
	confirmcoord BOOLEAN,
	descricao VARCHAR(255),
	FOREIGN KEY (idprontuario) REFERENCES prontuario (idprontuario),
	FOREIGN KEY (idarqinscrito) REFERENCES arqinscrito (idarqinscrito),
	FOREIGN KEY (idarquivamento) REFERENCES arquivamento (idarquivamento),
	FOREIGN KEY (ra) REFERENCES estagiario (ra),
	FOREIGN KEY (crpsup) REFERENCES supervisor (crp),
	FOREIGN KEY (crpresp) REFERENCES resptec (crpresp),
	FOREIGN KEY (crpcoord) REFERENCES coordenador (crp)
);

CREATE TABLE htocorrencia(
	idhtc SERIAL PRIMARY KEY,
	idprontuario INT,
	idarqinscrito INT,
	ra INT,
	crpsup INT,
	crpcoord INT,
	nomepessoa VARCHAR(50) NOT NULL,
	dthora TIMESTAMP NOT NULL DEFAULT NOW(),
	comparecimento BOOLEAN DEFAULT FALSE,
	faltas INT NOT NULL,
	justificativa VARCHAR(255) NOT NULL,
	FOREIGN KEY (idprontuario) REFERENCES prontuario (idprontuario),
	FOREIGN KEY (idarqinscrito) REFERENCES arqinscrito (idarqinscrito),
	FOREIGN KEY (ra) REFERENCES estagiario (ra),
	FOREIGN KEY (crpsup) REFERENCES supervisor (crp),
	FOREIGN KEY (crpcoord) REFERENCES coordenador (crp)	
);


