-- Active: 1750871648690@@127.0.0.1@5432@reserva
-- Active: 1750870493227@@127.0.0.1@5432@reserva

-- VERSAO: 3.0 beta

-- REMODELAGEM PARA SEPARAR SALA FÍSICA DA DISPONIBILIDADE POR TURNO/PERIODO AINDA EM ANDAMENTO!

-- Criação da tabela Diretor
CREATE TABLE diretor (
    iddiretor SERIAL PRIMARY KEY,
    cpf CHAR(11) NOT NULL UNIQUE,
    copfdt CHAR(11),
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(255) NOT NULL,
    senha VARCHAR(255) NOT NULL,
    dthinsart TIMESTAMP DEFAULT NOW(),
    dthdelete TIMESTAMP, -- Opcional
    status BOOLEAN DEFAULT TRUE
);
-- Criação da tabela assessora
CREATE TABLE assessora (
    idassessora SERIAL PRIMARY KEY,
    cpfdt CHAR(11),
    cpfass CHAR(11),
    nome VARCHAR(50) NOT NULL,
    cpf CHAR(11) NOT NULL UNIQUE, 
    email VARCHAR(100) NOT NULL,
    senha VARCHAR(255) NOT NULL,
    dthinsart TIMESTAMP DEFAULT NOW(),
    dthdelete TIMESTAMP,
    FOREIGN KEY (cpfdt) REFERENCES diretor(cpf),
    FOREIGN KEY (cpfdt) REFERENCES assessora(cpf),
    status BOOLEAN DEFAULT TRUE -- PARA FAZER DELETE LÓGICO

);

-- Criação de tabela NTI 
CREATE TABLE nti (
    idnti SERIAL PRIMARY KEY,
    cpfnti CHAR(11), 
    nome VARCHAR(50) NOT NULL,
    cpf CHAR(11) NOT NULL UNIQUE,
    email VARCHAR(100) NOT NULL,
    senha VARCHAR(255) NOT NULL,
    dthinsart TIMESTAMP DEFAULT NOW(),
    dthdelete TIMESTAMP,
    FOREIGN KEY (cpfntei) REFERENCES nti(cpf),
    status BOOLEAN DEFAULT TRUE -- PARA FAZER DELETE LÓGICO
);

-- Criação de tabela Turma
CREATE TABLE turma(
    idturma SERIAL PRIMARY KEY,
    cpfnti CHAR(11), -- Opcional
    codturma VARCHAR(100) NOT NULL,
    periodoletivo VARCHAR(10) NOT NULL,
    dthinsart TIMESTAMP DEFAULT NOW(),
    dthdelete TIMESTAMP,
    FOREIGN KEY (cpfnti) REFERENCES nti(cpf),
    status BOOLEAN DEFAULT TRUE -- DELETE LÓGICO
);

-- Criação de tabela sala (representa a sala física)
CREATE TABLE sala(
    idsala SERIAL PRIMARY KEY,
    cpfnti CHAR(11), -- Opcional para NTI
    bloco CHAR(1) NOT NULL,
    tvtamanho INT,
    datashow BOOLEAN DEFAULT TRUE,
    capacidade INT NOT NULL,
    andar VARCHAR(25) NOT NULL,
    numerosala INT NOT NULL UNIQUE,
    dthinsart TIMESTAMP DEFAULT NOW(),
    dthdelete TIMESTAMP,
    FOREIGN KEY (cpfnti) REFERENCES nti(cpf),
    status BOOLEAN NOT NULL DEFAULT TRUE -- DELETE LÓGICO
);

--Criação da tabela tusala (para facilicar o link entre sala e turma)

CREATE TABLE tusala (
    idtursala SERIAL PRIMARY KEY,
    idsala INT,
    idturma INT,
    FOREIGN KEY (idsala) REFERENCES sala(idsala),
    FOREIGN KEY (idturma) REFERENCES turma(idturma)
);


-- Criação da tabela sala_disponibilidade (turno + período para cada sala)
CREATE TABLE sala_disponibilidade (
    idsala_disponibilidade SERIAL PRIMARY KEY,
    idsala INT NOT NULL,
    periodo VARCHAR(15) NOT NULL CHECK (periodo IN ('Primeiro', 'Segundo')),
    turno VARCHAR(10) CHECK (turno IN ('Manhã', 'Tarde', 'Noite') OR turno IS NULL),
    disponibilidade BOOLEAN NOT NULL DEFAULT TRUE,
    dthinsart TIMESTAMP DEFAULT NOW(),
    dthdelete TIMESTAMP,
    status BOOLEAN NOT NULL DEFAULT TRUE, -- DELETE LÓGICO
    UNIQUE (idsala, periodo, turno),
    FOREIGN KEY (idsala) REFERENCES sala(idsala)
);

-- Criação da tabela reserva (ligada à sala_disponibilidade)
CREATE TABLE reserva(
    idreserva SERIAL PRIMARY KEY,
    cpfass CHAR(11), -- Pode ser assessora
    cpfnti CHAR(11), -- Pode ser NTI
    idsala_disponibilidade INT NOT NULL,
    idturma INT NULL,
    codturma VARCHAR(100) NOT NULL, -- Apenas informativo
    diasemana VARCHAR(15) NOT NULL, -- Segunda, Terça, etc.
    datainicial DATE DEFAULT CURRENT_DATE,
    datafinal DATE NOT NULL CHECK (datafinal >= datainicial),
    responsavel VARCHAR(100) NOT NULL,
    descricao VARCHAR(255),
    situacao BOOLEAN DEFAULT TRUE NOT NULL, -- TRUE = Reservado, FALSE = Livre
    dthinsart TIMESTAMP DEFAULT NOW(),
    dthdelete TIMESTAMP,
    FOREIGN KEY (cpfass) REFERENCES assessora(cpf),
    FOREIGN KEY (cpfnti) REFERENCES nti(cpf),
    FOREIGN KEY (idsala_disponibilidade) REFERENCES sala_disponibilidade(idsalasispo),
    FOREIGN KEY (idturma) REFERENCES turma(idturma),
    status BOOLEAN DEFAULT TRUE -- DELETE LÓGICO
);
