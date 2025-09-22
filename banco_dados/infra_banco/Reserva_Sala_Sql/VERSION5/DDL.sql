<<<<<<< HEAD:banco_dados/infra_banco/Reserva_Sala_Sql/VERSION5a/DDL.sql
-- Active: 1757523534123@@127.0.0.1@5432@SCP
=======
-- Active: 1757350708892@@127.0.0.1@5432@scp
>>>>>>> origin/Vitor_banco_dados_2:banco_dados/infra_banco/Reserva_Sala_Sql/VERSION5/DDL.sql
-- Active: 1750708565763@@127.0.0.1@5432@reserva 

-- CRIANDO A TABELA USUARIO, fiz uma generalização visto que os dados a serem inseridos vai servir para todos
CREATE TABLE usuario(
    idusuario INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY, -- MELHOR QUE SERIAL E MAIS UTILIZADO
    matricula INTEGER NOT NULL UNIQUE,
    matriculauser INTEGER, -- Vamos permitir que seja NULLABLE
    nome VARCHAR(255) NOT NULL,
    emailinst VARCHAR(255) NOT NULL,
    sexo CHAR(1) CHECK(sexo IN ('M','F','O')),/* M = masculino, F = feminino, O = outro */
    cargo VARCHAR(25) NOT NULL CHECK(cargo IN ('Diretor','Assessora','Secretaria','Coordenador','NAPI','NTI','Manutenção')),
    senha VARCHAR(255) NOT NULL, 
    dthinsert TIMESTAMP DEFAULT NOW(),
    dthdelete TIMESTAMP CHECK(dthdelete >= dthinsert OR dthdelete IS NULL), -- validação do delete lógico, a data de insart não pode ser menor 
    statusdelete BOOLEAN DEFAULT FALSE, -- DELETE LÓGICO
    FOREIGN KEY (matriculauser) REFERENCES usuario(matricula)
); 


-- CRIANDO A TABELA BLOCO

CREATE TABLE bloco(

    idbloco INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    nomebloco CHAR(1) NOT NULL UNIQUE, 
    matriculauser INTEGER NULL, -- VAMOS PERMITIR NULLABLE
    ativo BOOLEAN DEFAULT TRUE, -- Informa se a sala está aptada para ser reservada
    motivoinativo VARCHAR(255) CHECK( ativo = FALSE OR motivoinativo IS NULL), /* So deve ser colocado quando o atributo ativo for false*/
    dthinsert TIMESTAMP DEFAULT NOW(),
    dthdelete TIMESTAMP CHECK(dthdelete >= dthinsert OR dthdelete IS NULL), -- validação do delete lógico, data do insart não pode ser menor 
    statusdelete BOOLEAN DEFAULT FALSE, -- DELETE LÓGICO
    FOREIGN KEY (matriculauser) REFERENCES usuario(matricula)
);

-- CRIANDO A TABELA SALA 
CREATE TABLE sala(

    idsala INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    idbloco INTEGER NOT NULL,
    matriculauser INTEGER NULL,
    andar VARCHAR(20),
    nomebloco CHAR(1) NULL, -- VAMOS PERMITIR NULLABLE
    numerosala INTEGER NOT NULL,    
    capacidade INTEGER NOT NULL,
    tvtamanho VARCHAR(5) NOT NULL, -- Tamanho em polegadas, exemplo: 55"
    datashow BOOLEAN DEFAULT FALSE, -- Apenas infromar se tem ou não
    ativo BOOLEAN DEFAULT TRUE, -- Informa se a sala está aptada para ser reservada
    motivoinativo VARCHAR(255) CHECK( ativo = FALSE OR motivoinativo IS NULL), /* So deve ser colocado quando o atributo ativo for false*/
    dthinsert TIMESTAMP DEFAULT NOW(),
    dthdelete TIMESTAMP CHECK(dthdelete >= dthinsert OR dthdelete IS NULL), -- validação do delete lógico, data do insart não pode ser menor 
    statusdelete BOOLEAN DEFAULT FALSE, -- DELETE LÓGICO
    FOREIGN KEY (matriculauser) REFERENCES usuario(matricula),
    FOREIGN KEY (idbloco) REFERENCES bloco(idbloco)
);


-- CRIANDO A TABELA CURSO É  MERAMENTE INFORMATICO, VAI SERVIR PARA FILTRAGEM
CREATE TABLE curso(

    idcurso INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    matriculauser INTEGER, -- Vamos permitir que seja NULLABLE
    nomecurso VARCHAR(255) NOT NULL, -- Vai ser permitido mesclagem, exemplo: Enfermagem \ Fisiologia
    dthinsert TIMESTAMP DEFAULT NOW(),
    dthdelete TIMESTAMP CHECK(dthdelete >= dthinsert OR dthdelete IS NULL),
    statusdelete BOOLEAN DEFAULT FALSE,
    FOREIGN KEY (matriculauser) REFERENCES usuario(matricula)
);

-- CRIANDO TABELA TURMA É MERAMENTE INFORMATICO, VAI SERVIR PARA FILTRAGEM
CREATE TABLE turma(
    idturma INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    idcurso INTEGER NULL, -- VAMOS PERMITIR QUE SEJA NULL ABLE
    matriculauser INTEGER,-- VAMOS PERMITIR QUE SEJA NULL ABLE
    codturma VARCHAR(255) NOT NULL, -- ELES PODEM COLOCAR TURMAS MESCLADAS EXEMPLO: FIO02/FIO01
    periodoletivo varchar(25), -- VAMOS PERMITIR QUE SEJA NULL ABLE 
    qtdaluno INTEGER, -- VAMOS PERMITIR NULLABLE POIS POSTERIORMENTE ELES IRÃO PRECISAR DESSE DADO
    dthinsert TIMESTAMP DEFAULT NOW(),
    dthdelete TIMESTAMP CHECK (dthdelete >= dthinsert OR dthdelete is NULL),
    statusdelete BOOLEAN DEFAULT FALSE,
    FOREIGN KEY (matriculauser) REFERENCES usuario(matricula),
    FOREIGN KEY (idcurso) REFERENCES curso(idcurso)
);

-- CRIANDO TABELA RESERVA

CREATE TABLE reserva(

    idreserva INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY, 
    matriculauser INTEGER NOT NULL, -- OBRIGATÓRIO SABER QUEM FEZ A RESERVA
    idcurso INTEGER NULL, -- Vamos permitir null para quando quiserem futuramente fazer um filtro por curso
    idturma INTEGER NULL, -- Vamos permitir null para posteriomente no futuro eles colocarem a opção de filtragem por codturma
    codturma VARCHAR(255) NOT NULL, -- Isso vai permitir a mesclagem de turma em uma sala, aplicação deve dar um jeito de inserir primeiro na entidade turma e depois aqui
    datainicial DATE DEFAULT CURRENT_DATE, -- CURRENT_DATE É MELHOR PARA O PRENCHIMENTO AUTOMATICO NO CAMPO COM DOMÍNIO DATe
    datafinal DATE CHECK(datafinal >= datainicial OR datafinal IS NULL),
    dthinsert TIMESTAMP DEFAULT NOW(),
    dthdelete TIMESTAMP CHECK(dthdelete >= dthinsert OR dthdelete IS NULL),
    statusdelete BOOLEAN DEFAULT FALSE,
    FOREIGN KEY (matriculauser) REFERENCES usuario(matricula), 
    FOREIGN KEY (idturma) REFERENCES turma(idturma),
    FOREIGN KEY (idcurso) REFERENCES curso(idcurso)
);

-- CRIANDO TABELA DE MUITOS PARA MUITOS ENTES RESEVA E SALA 

CREATE TABLE reservasala (
    idreservasala INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    idreserva INTEGER NOT NULL,
    idsala INTEGER NOT NULL,
    turno VARCHAR(25) CHECK(turno IN('Manhã','Tarde','Noite')),
    responsavel VARCHAR(255) NOT NULL,
    descricaoreserva VARCHAR(255), -- Vamos permitir null able, 
    statusreserva BOOLEAN DEFAULT TRUE,
    dthinsert TIMESTAMP DEFAULT NOW(),
    dthdelete TIMESTAMP CHECK(dthdelete >= dthinsert OR dthdelete IS NULL),
    statusdelete BOOLEAN DEFAULT FALSE,
    FOREIGN KEY (idreserva) REFERENCES reserva(idreserva),
    FOREIGN KEY (idsala) REFERENCES sala(idsala)
);

-- CRIANDO TABELA PERIODO, ATRIBUTO MULTIVALORADO QUE SE REFERE AOS PERIODOS/HORAS DA AULA NAQUELA SALA DISPONIVEL QUE FOI RESERVADA
CREATE TABLE periodo(
    idperiodo INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    idreservasala INTEGER NOT NULL,
    primeiro BOOLEAN DEFAULT FALSE, 
    segundo BOOLEAN DEFAULT FALSE, 
    terceiro BOOLEAN DEFAULT FALSE, 
    quarto BOOLEAN DEFAULT FALSE, 
    integral BOOLEAN DEFAULT FALSE,
    dthinsert TIMESTAMP DEFAULT NOW(),
    dthdelete TIMESTAMP CHECK(dthdelete >= dthinsert OR dthdelete IS NULL),
    statusdelete BOOLEAN DEFAULT FALSE,
    FOREIGN KEY (idreservasala) REFERENCES reservasala(idreservasala)
);

-- CRIANDO TABELA DIASEMANA
CREATE TABLE diasemana(
    iddiasemana INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    idreservasala INTEGER NOT NULL, -- FK para idreservasala
    idperiodo INTEGER NOT NULL, -- FK para Periodo
    segunda BOOLEAN DEFAULT FALSE, 
    terca BOOLEAN DEFAULT FALSE, 
    quarta BOOLEAN DEFAULT FALSE, 
    quinta BOOLEAN DEFAULT FALSE,
    sexta BOOLEAN DEFAULT FALSE, 
    sabado BOOLEAN DEFAULT FALSE, 
    domingo BOOLEAN DEFAULT FALSE,
    dthinsert TIMESTAMP DEFAULT NOW(),
    dthdelete TIMESTAMP CHECK(dthdelete >= dthinsert OR dthdelete IS NULL),
    statusdelete BOOLEAN DEFAULT FALSE,
    FOREIGN KEY (idreservasala) REFERENCES reservasala(idreservasala),
    FOREIGN KEY(idperiodo) REFERENCES periodo(idperiodo)
);
