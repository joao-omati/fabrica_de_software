-- Active: 1750871648690@@127.0.0.1@5432@reserva
-- ESSA É A SEGUNDA VERSÃO DO NOSSO BANCO DE DADOS! PARA JUSTAMENTE CORRIGIR UM PROBLEMA DE LÓGICA


-- Criação da tabela assessora
CREATE TABLE assessora (
    idassessora SERIAL PRIMARY KEY,
    nome VARCHAR(50) NOT NULL,
    cpf CHAR(11) NOT NULL UNIQUE, 
    email VARCHAR(100) NOT NULL,
    senha VARCHAR(255) NOT NULL,
    status BOOLEAN DEFAULT TRUE /* PARA FAZER DELETE LÓGIGO */
);

-- Criação de tabela NTI 

CREATE TABLE nti (
    idnti SERIAL PRIMARY KEY,
    nome VARCHAR(50) NOT NULL,
    cpf CHAR(11) NOT NULL UNIQUE,
    email VARCHAR(100) NOT NULL,
    senha VARCHAR(255) NOT NULL,
    status BOOLEAN DEFAULT TRUE /* PARA FAZER DELETE LÓGICO*/
);

-- Criação de tabela Turma
CREATE TABLE turma(
	idturma SERIAL PRIMARY KEY,
	cpfnti CHAR(11), /* Vamos deixar Nullable porque o Desenvolvedor pode inserir, atualizar também sem a obrigatóriedade do NTI    */
	codturma VARCHAR(100),
	periodoletivo VARCHAR(10),
	status BOOLEAN DEFAULT TRUE, /* PARA FAZER DELETE LÓGICO */
	FOREIGN KEY (cpfnti) REFERENCES nti (cpf)
);

-- Criação de tabela sala

CREATE TABLE sala(
	idsala SERIAL PRIMARY KEY,
	cpfnti CHAR(11), /* FK, Vamos deixar Nullable porque o Desenvolvedor pode inserir ou atualizar também as salas */
	bloco CHAR(1),
	tvtamanho INT,
	disponibilidade BOOLEAN NOT NULL DEFAULT TRUE,
	capacidade INT NOT NULL,
	andar VARCHAR(25),
	numerosala INT NOT NULL,
	periodo VARCHAR(15) CHECK (periodo IN ('Primeiro', 'Segundo') OR periodo IS NULL), /*Período da Sala, vamos deixar NullAble para ser inserido posteriormente pela assessora*/
	turno VARCHAR(10), /*Turno da sala, vamos deixar NullAble para ser inserido posteriormente pela assessora*/
	status BOOLEAN NOT NULL DEFAULT TRUE, /* PARA FAZER DELETE LÓGICO */
	FOREIGN KEY (cpfnti) REFERENCES nti(cpf)
);

-- Criação de tabela reserva

CREATE TABLE reserva(
	idreserva SERIAL PRIMARY KEY,
	cpfass CHAR(11), /* Deixando Nullable porque tanto a assessora como o NTI pode fazer a reserva*/
	cpfnti CHAR(11), /* Deixando Nullable porque tanto a assessora como o NTI pode fazer a reserva*/
	idsala INT NOT NULL,
	idturma INT NULL, /* Chave estrangeira opcional para futura associação com a tabela turma. Permite que a reserva seja criada antes do cadastro completo da turma. */
	codturma VARCHAR(100) NOT NULL, -- apenas informativo
	diasemana VARCHAR(10) NOT NULL, -- Segunda, Terça, Quarta, Quinta, Sexta	
	datainicial DATE DEFAULT NOW(),
	datafinal DATE NOT NULL CHECK (datafinal >= datainicial),
	responsavel VARCHAR(100) NOT NULL,
	descrição VARCHAR(255), -- É opcional a descrição da reserva
	status BOOLEAN DEFAULT TRUE, -- Usar para delete lógico
	FOREIGN KEY (cpfass) REFERENCES assessora(cpf),
	FOREIGN KEY (cpfnti) REFERENCES nti(cpf),
	FOREIGN KEY (idsala) REFERENCES sala(idsala),
		FOREIGN KEY (idturma) REFERENCES turma(idturma)
);


