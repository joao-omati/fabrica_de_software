-- Active: 1751377694609@@127.0.0.1@5432@reserva
-- Active: 1751302420903@@127.0.0.1@5432@reserva
-- Active: 1751309244752@@127.0.0.1@5432@reserva 
-- Active: 1749757574490@@127.0.0.1@5432@reserva 

-- CRIANDO A TABELA USUARIO, fiz uma generalização visto que os dados a serem inseridos vai servir para todos
CREATE TABLE usuario(
    idusuario INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY, -- MELHOR QUE SERIAL E MAIS UTILIZADO
    matricula INTEGER NOT NULL UNIQUE,
    nome VARCHAR(255) NOT NULL,
    emailinst VARCHAR(255) NOT NULL,
    sexo CHAR(1) CHECK(sexo IN ('M','F','O')),/* M = masculino, F = feminino, O = outro */
    cargo VARCHAR(25) NOT NULL CHECK(cargo IN ('Diretor','Assessora','Secretaria','Coordenador','NAPI','NTI','Manutenção')),
    senha VARCHAR(255) NOT NULL, 
    dthinsert TIMESTAMP DEFAULT NOW(),
    dthdelete TIMESTAMP CHECK(dthdelete >= dthinsert OR dthdelete IS NULL), -- validação do delete lógico, a data de insart não pode ser menor
    statuslogin BOOLEAN DEFAULT TRUE, 
    status BOOLEAN DEFAULT TRUE -- DELETE LÓGICO
); 

-- CRIANDO A TABELA SALA 
CREATE TABLE sala(

    idsala INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    matricula INTEGER NULL, -- VAMOS PERMITIR NULLABLE
    andar VARCHAR(25) NOT NULL,
    bloco CHAR(1) NOT NULL,
    numerosala INTEGER NOT NULL,    
    capacidade INTEGER NOT NULL,
    tvtamanho INTEGER NOT NULL,
    datashow BOOLEAN DEFAULT FALSE,
    dthinsert TIMESTAMP DEFAULT NOW(),
    dthdelete TIMESTAMP CHECK(dthdelete >= dthinsert OR dthdelete IS NULL), -- validação do delete lógico, data do insart não pode ser menor 
    status BOOLEAN DEFAULT TRUE, -- DELETE LÓGICO
    FOREIGN KEY (matricula) REFERENCES usuario(matricula)
);


-- CRIANDO TABELA SALADISPO QUE SE REFE A DISPONIBILIDADE DA SALA PELO TURNO E PERIODO PARA SER VINCULADO A UMA RESERVA
CREATE TABLE saladispo (
    idsaladispo INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    idsala INTEGER NOT NULL,
    matricula INTEGER, /* Matricula só deve ser preenchida se a disponibilidade for False ou Null*/
    turno VARCHAR(15) CHECK (turno IN ('Manhã', 'Tarde', 'Noite') OR turno IS NULL),
    disponibilidade BOOLEAN DEFAULT TRUE,
    motivoinativo VARCHAR(255), /* Descrição so deve ser colocado quando a disponibilidade for false ou null*/
    dthinsert TIMESTAMP DEFAULT NOW(),
    dthdelete TIMESTAMP CHECK (dthdelete >= dthinsert OR dthdelete IS NULL), 
    status BOOLEAN DEFAULT TRUE, -- DELETE LÓGICO
    FOREIGN KEY (idsala) REFERENCES sala(idsala),
    FOREIGN KEY (matricula) REFERENCES usuario(matricula)

);

-- CRIANDO TABELA PERIODO, ATRIBUTO MULTIVALORADO QUE SE REFERE AOS PERIODOS/HORAS DA AULA NAQUELA SALA DISPONIVEL QUE FOI RESERVADA
CREATE TABLE periodo(
    idperiodo INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    idsaladispo INTEGER NOT NULL,
    primeiro BOOLEAN DEFAULT FALSE, 
    segundo BOOLEAN DEFAULT FALSE, 
    terceiro BOOLEAN DEFAULT FALSE, 
    quarto BOOLEAN DEFAULT FALSE, 
    integral BOOLEAN DEFAULT FALSE,
    FOREIGN KEY (idsaladispo) REFERENCES saladispo(idsaladispo)
);

-- CRIANDO A TABELA CURSO
CREATE TABLE curso(

    idcurso INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    matricula INTEGER, -- Vamos permitir que seja NULLABLE
    nomecurso VARCHAR(255) NOT NULL,
    dthinsert TIMESTAMP DEFAULT NOW(),
    dthdelete TIMESTAMP CHECK(dthdelete >= dthinsert OR dthinsert IS NULL),
    status BOOLEAN DEFAULT TRUE
);


-- CRIANDO A TABELA TURMA 

CREATE TABLE turma(
    idturma INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    idcurso INTEGER, -- VAMOS PERMITIR QUE SEJA NULL ABLE
    matricula INTEGER,-- VAMOS PERMITIR QUE SEJA NULL ABLE
    codturma VARCHAR(255) NOT NULL, 
    periodoletivo varchar(25), -- VAMOS PERMITIR QUE SEJA NULL ABLE 
    qtdaluno INTEGER, -- VAMOS PERMITIR NULLABLE POIS POSTERIORMENTE ELES IRÃO PRECISAR DESSE DADO
    dthinsert TIMESTAMP DEFAULT NOW(),
    dthdelete TIMESTAMP CHECK (dthdelete >= dthinsert OR dthdelete is NULL),
    status BOOLEAN DEFAULT TRUE,
    FOREIGN KEY (matricula) REFERENCES usuario(matricula),
    FOREIGN KEY (idcurso) REFERENCES curso(idcurso)
);

-- CRIANDO TABELA TURSALA ENTIDADE DE MUITO PARA MUITOS ENTRE TURMA E SALA
CREATE TABLE tursala(
    idtursala INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    idsala INTEGER NOT NULL,
    idturma INTEGER NOT NULL,
    FOREIGN KEY (idsala) REFERENCES sala(idsala),
    FOREIGN KEY (idturma) REFERENCES turma(idturma)
);

-- CRIANDO A TABLA RESERVA
CREATE TABLE reserva(

    idreserva INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY, 
    matricula INTEGER NOT NULL, -- OBRIGATÓRIO SABER QUE FEZ A RESERVA
    idsaladispo INTEGER NOT NULL, -- Para criar listas de reservas deitas, insart, updates, deletes lógicos automatizados
    idcurso INTEGER NOT NULL, -- O mesmo de cima
    idturma INTEGER NOT NULL, -- Puxar todas as turmas já cadastradas para listar e fazer um menu dropdown, um filtro, sistema de busca, insart automatizado
    codturma VARCHAR(255), -- meramente informativo
    datainicial DATE DEFAULT CURRENT_DATE, -- CURRENT_DATE É MELHOR PARA O PRENCHIMENTO AUTOMATICO NO CAMPO COM DOMÍNIO DATe
    datafinal DATE CHECK(datafinal >= datainicial OR datafinal IS NULL),
    responsavel VARCHAR(255) NOT NULL,
    descricao VARCHAR(255),-- VAMOS DEIXAR OPCIONAL PARA QUANDO A RESERVA FOR CANCELADA, OU SEJA, QUANDO O CAMPO SITUAÇÃO É FALSE 
    situacao BOOLEAN DEFAULT TRUE, -- PERMITINDO VALORES BOOLEANS, SE FOR TRUE = RESERVADO, FALSE = CANCELADO
    dthinsert TIMESTAMP DEFAULT NOW(),
    dthdelete TIMESTAMP CHECK(dthdelete >= dthinsert OR dthdelete IS NULL),
    status BOOLEAN DEFAULT TRUE,
    FOREIGN KEY (matricula) REFERENCES usuario(matricula), 
    FOREIGN KEY (idsaladispo) REFERENCES saladispo(idsaladispo),
    FOREIGN KEY (idturma) REFERENCES turma(idturma),
    FOREIGN KEY (idcurso) REFERENCES curso(idcurso)
);

-- CRIANDO TABELA DIASEMANA
CREATE TABLE diasemana(
    iddiasemana INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    idreserva INTEGER NOT NULL,
    segunda BOOLEAN DEFAULT FALSE, 
    terca BOOLEAN DEFAULT FALSE, 
    quarta BOOLEAN DEFAULT FALSE, 
    quinta BOOLEAN DEFAULT FALSE,
    sexta BOOLEAN DEFAULT FALSE, 
    sabado BOOLEAN DEFAULT FALSE, 
    domingo BOOLEAN DEFAULT FALSE,
    FOREIGN KEY(idreserva) REFERENCES reserva(idreserva)
);


