-- Criação da tabela assessora
CREATE TABLE assessora (
    idassessora SERIAL PRIMARY KEY,
    nome VARCHAR(50),
    cpf CHAR(11) NOT NULL UNIQUE, 
    email VARCHAR(100),
    senha VARCHAR(255),
    status BOOLEAN DEFAULT TRUE
);
-- Criação de tabela NTI 
CREATE TABLE nti (
    idnti SERIAL PRIMARY KEY,
    nome VARCHAR(50),
    cpf CHAR(11) NOT ,
    email VARCHAR(100),
    senha VARCHAR(255),
    status BOOLEAN DEFAULT TRUE
);