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
	cpfnti CHAR(11), /* Vamos deixar Nullable porque o Desenvolvedor pode inserir ou atualizar também as salas */
	bloco CHAR(1),
	tvtamanho INT,
	situacao VARCHAR(10) NOT NULL CHECK (situacao IN('Livre','Ocupadado','Manutenção')),
	capacidade INT NOT NULL,
	andar VARCHAR(25),
	numerosala INT NOT NULL,
	status BOOLEAN DEFAULT TRUE, /* PARA FAZER DELETE LÓGICO */
	FOREIGN KEY (cpfnti) REFERENCES nti(cpf)
);

-- Criação de tabela sala
CREATE TABLE tursala(
	idtursala SERIAL PRIMARY KEY,
	idturma INT NOT NULL,
	idsala INT NOT NULL,
	FOREIGN KEY (idturma) REFERENCES turma(idturma),
	FOREIGN KEY (idsala) REFERENCES sala(idsala)
);

-- Criação de tabela reserva

CREATE TABLE reserva(
	idreserva SERIAL PRIMARY KEY,
	cpfass CHAR(11),
	cpfnti CHAR(11),
	idsala INT NOT NULL,
	diasemana VARCHAR(10) NOT NULL,
	periodolt VARCHAR(15) NOT NULL,
	turno VARCHAR(10) NOT NULL,
	datainicial DATE DEFAULT NOW(),
	datafinal DATE DEFAULT NOW(),
	responsavel VARCHAR(100) NOT NULL,
	statusreserva BOOLEAN NOT NULL DEFAULT TRUE,
	descrição VARCHAR(255) NOT NULL,
	FOREIGN KEY (cpfass) REFERENCES assessora(cpf),
	FOREIGN KEY (cpfnti) REFERENCES nti(cpf),
	FOREIGN KEY (idsala) REFERENCES sala(idsala)
);
