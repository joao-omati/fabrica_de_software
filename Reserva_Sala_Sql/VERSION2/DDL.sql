-- Active: 1750871648690@@127.0.0.1@5432@reserva
-- Active: 1750870493227@@127.0.0.1@5432@reserva

-- VERSIO: 2.1

-- ESSA É A SEGUNDA VERSÃO DO NOSSO BANCO DE DADOS! PARA JUSTAMENTE CORRIGIR UM PROBLEMA DE LÓGICA E ALGUNS ATRIBUTOS

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
	turno VARCHAR(10) CHECK (turno IN ('Manhã', 'Tarde', 'Noite') OR turno IS NULL), /*Turno da sala, vamos deixar NullAble para ser inserido posteriormente pela assessora*/
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
	diasemana VARCHAR(15) NOT NULL, -- Segunda, Terça, Quarta, Quinta, Sexta	
	datainicial DATE DEFAULT CURRENT_DATE, -- Colocando CURRENT_DATE porque é melhor para o campo DATE que a função NOW()
	datafinal DATE NOT NULL CHECK (datafinal >= datainicial),
	responsavel VARCHAR(100) NOT NULL,
	descricao VARCHAR(255), -- É opcional a descrição da reserva
	situacao BOOLEAN DEFAULT TRUE NOT NULL, /* TRUE = Reservado, FALSE = Livre*/
	status BOOLEAN DEFAULT TRUE, -- Usar para delete lógico
	FOREIGN KEY (cpfass) REFERENCES assessora(cpf),
	FOREIGN KEY (cpfnti) REFERENCES nti(cpf),
	FOREIGN KEY (idsala) REFERENCES sala(idsala),
	FOREIGN KEY (idturma) REFERENCES turma(idturma)
);


