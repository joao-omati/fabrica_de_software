-- Criação da tabela assessora
CREATE TABLE assessora (
    idassessora SERIAL PRIMARY KEY,
    nome VARCHAR(50) NOT NULL,
    cpf CHAR(11) NOT NULL UNIQUE, 
    email VARCHAR(100) NOT NULL,
    senha VARCHAR(255) NOT NULL,
    status BOOLEAN DEFAULT TRUE
);
-- Criação de tabela NTI 
CREATE TABLE nti (
    idnti SERIAL PRIMARY KEY,
    nome VARCHAR(50) NOT NULL,
    cpf CHAR(11) NOT NULL,
    email VARCHAR(100) NOT NULL,
    senha VARCHAR(255) NOT NULL,
    status BOOLEAN DEFAULT TRUE
);