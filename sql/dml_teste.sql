-- Se tiver alguma consulta comentada é para testes depois, ou para estudar

-- Para Inserts, colunas que possuem DEFAULT ou então coluna de PK SERIAL não é necessário colocar dentro da primeira abertura de ()

SELECT * FROM inscritoconvenio;
SELECT * FROM inscritocomunidade;

--
INSERT INTO inscritoconvenio (nomeinscrito,dtnascimento,testavpsico,tipoencaminhamento,
							  nomeresp,grauresp,cpfresp,estadocivilresp,tellcellresp,emailresp,
							  estadocivilinscrito,cpfinscrito,tellcellinscrito,contatourgencia,emailinscrito,
							  identidadegenero,etnia,religiao, confirmlgpd)
VALUES (
	'João da silva',
	'2003-10-15',
	true,
	'CAPS',
	'Guilherme Braga Rios da Costa',
	'Pai',
	'12345678910',
	'Solteiro',
	'61993242321',
	'josep@gmail.com',
	'Casado',
	'12345678911',
	'61983746374',
	'61932745362',
	'iewquieuqwe@gmail.com',
	'Masculino',
	'Branca',
	'Outros',
	TRUE
);

INSERT INTO inscritoconvenio (nomeinscrito,dtnascimento,testavpsico,tipoencaminhamento,
							  nomeresp,grauresp,cpfresp,estadocivilresp,tellcellresp,emailresp,
							  estadocivilinscrito,cpfinscrito,tellcellinscrito,contatourgencia,emailinscrito,
							  identidadegenero,etnia,religiao, confirmlgpd)
VALUES (
	'Pedro Alvares Cabral',
	'2003-10-15',
	true,
	'CREAS',
	'Josép Silva',
	'Irmão',
	'12345678912',
	'Solteiro',
	'61993242321',
	'josep@gmail.com',
	'Casado',
	'12345678913',
	'61983746374',
	'61932745362',
	'iewquieuqwe@gmail.com',
	'Masculino',
	'Branca',
	'Outros',
	TRUE
);

--Inserindo alguns dados (~20) na tabela inscritocomunidade
INSERT INTO inscritocomunidade (
    nomeinscrito, dtnascimento, nomeresp, grauresp, cpfresp, estadocivilresp, tellcellresp, emailresp, 
    estadocivilinscrito, cpfinscrito, tellcellinscrito, contatourgencia, emailinscrito, identidadegenero, 
    etnia, religiao, confirmlgpd
) VALUES 
    ('Ana Julia Ferreira', '2008-04-15', 'Marcos Ferreira', 'Pai', '11122233301', 'Casado', '(61)98888-1111', 'marcos.f@email.com', 'Solteiro', '10101010101', '(61)98111-0001', '(61)98888-1111', 'anajulia@email.com', 'Feminino', 'Parda', 'Católico', TRUE),
    ('Carlos Eduardo Lima', '1995-08-20', NULL, NULL, NULL, NULL, NULL, NULL, 'Solteiro', '20202020202', '(61)98222-0002', '(61)98222-0003', 'carlos.lima@email.com', 'Masculino', 'Branca', 'Sem religião', TRUE),
    ('Mariana Costa', '1989-11-01', NULL, NULL, NULL, NULL, NULL, NULL, 'Casado', '30303030303', '(61)98333-0003', '(61)98333-0004', 'mari.costa@email.com', 'Feminino', 'Preta', 'Evangélico', TRUE),
    ('Lucas Almeida', '2012-01-30', 'Sandra Almeida', 'Mãe', '44455566602', 'União Estável', '(61)98888-2222', 'sandra.a@email.com', 'Nenhum', '40404040404', '(61)98444-0004', '(61)98888-2222', 'lucas.a@email.com', 'Masculino', 'Parda', 'Espirita', TRUE),
    ('Beatriz Santos', '1998-07-22', NULL, NULL, NULL, NULL, NULL, NULL, 'União Estável', '50505050505', '(61)98555-0005', '(61)98555-0006', 'bia.santos@email.com', 'Feminino', 'Branca', 'Católico', TRUE),
    ('Gabriel Ribeiro', '1978-02-10', NULL, NULL, NULL, NULL, NULL, NULL, 'Divorciado', '60606060606', '(61)98666-0006', '(61)98666-0007', 'gabriel.r@email.com', 'Masculino', 'Parda', 'Sem religião', FALSE),
    ('Sofia Pereira', '2001-09-05', NULL, NULL, NULL, NULL, NULL, NULL, 'Solteiro', '70707070707', '(61)98777-0007', '(61)98777-0008', 'sofia.p@email.com', 'Não Binário', 'Preta', 'Outros', TRUE),
    ('Davi Martins', '2015-06-18', 'Ricardo Martins', 'Pai', '88899900003', 'Divorciado', '(61)98888-3333', 'ricardo.m@email.com', 'Nenhum', '80808080808', '(61)98888-0008', '(61)98888-3333', 'davi.m@email.com', 'Masculino', 'Amarela', 'Budismo', TRUE),
    ('Laura Gomes', '1985-03-25', NULL, NULL, NULL, NULL, NULL, NULL, 'Viúvo', '90909090909', '(61)98999-0009', '(61)98999-0010', 'laura.gomes@email.com', 'Feminino', 'Indígena', 'Religião de Matriz Africana', TRUE),
    ('Arthur Azevedo', '2003-12-12', NULL, NULL, NULL, NULL, NULL, NULL, 'Solteiro', '12121212121', '(61)99111-0010', '(61)99111-0011', 'arthur.az@email.com', 'Masculino', 'Parda', 'Evangélico', TRUE),
    ('Isabella Nunes', '2011-02-28', 'Clara Nunes', 'Mãe', '22233344404', 'Solteiro', '(61)98888-4444', 'clara.n@email.com', 'Nenhum', '23232323232', '(61)99222-0011', '(61)98888-4444', 'isa.nunes@email.com', 'Transgênero', 'Branca', 'Espirita', TRUE),
    ('Miguel Moreira', '1999-05-19', NULL, NULL, NULL, NULL, NULL, NULL, 'Solteiro', '34343434343', '(61)99333-0012', '(61)99333-0013', 'miguel.m@email.com', 'Masculino', 'Parda', 'Católico', TRUE),
    ('Helena Carvalho', '2000-10-03', NULL, NULL, NULL, NULL, NULL, NULL, 'Solteiro', '45454545454', '(61)99444-0013', '(61)99444-0014', 'helena.c@email.com', 'Feminino', 'Preta', 'Judaismo', TRUE),
    ('Bernardo Rodrigues', '1992-07-21', NULL, NULL, NULL, NULL, NULL, NULL, 'União Estável', '56565656565', '(61)99555-0014', '(61)99555-0015', 'bernardo.r@email.com', 'Masculino', 'Branca', 'Sem religião', TRUE),
    ('Valentina Mendes', '2016-11-30', 'Felipe Mendes', 'Pai', '66677788805', 'Casado', '(61)98888-5555', 'felipe.m@email.com', 'Nenhum', '67676767676', '(61)99666-0015', '(61)98888-5555', 'valentina.m@email.com', 'Feminino', 'Parda', 'Católico', TRUE),
    ('Theo Castro', '1980-01-09', NULL, NULL, NULL, NULL, NULL, NULL, 'Casado', '78787878787', '(61)99777-0016', '(61)99777-0017', 'theo.castro@email.com', 'Masculino', 'Branca', 'Evangélico', TRUE),
    ('Alice Rocha', '2002-04-14', NULL, NULL, NULL, NULL, NULL, NULL, 'Solteiro', '89898989898', '(61)99888-0017', '(61)99888-0018', 'alice.rocha@email.com', 'Feminino', 'Parda', 'Islamismo', TRUE),
    ('Heitor Pinto', '2018-08-08', 'Juliana Pinto', 'Mãe', '99900011106', 'União Estável', '(61)98888-6666', 'juliana.p@email.com', 'Nenhum', '91919191919', '(61)99999-0018', '(61)98888-6666', 'heitor.p@email.com', 'Masculino', 'Preta', 'Religião de Matriz Africana', TRUE),
    ('Manuela Dias', '1996-12-24', NULL, NULL, NULL, NULL, NULL, NULL, 'Solteiro', '24242424242', '(61)99112-0019', '(61)99112-0020', 'manuela.d@email.com', 'Feminino', 'Branca', 'Espirita', TRUE),
    ('Davi Sousa', '1987-10-16', NULL, NULL, NULL, NULL, NULL, NULL, 'Divorciado', '35353535353', '(61)99213-0020', '(61)99213-0021', 'davi.sousa@email.com', 'Masculino', 'Parda', 'Sem religião', TRUE);

-- Inserindo alguns dados na tabela endereco
INSERT INTO endereco (idfichacomunidade, cidade, bairro, 
					  rua, cep)
VALUES 
    (6, 'Águas Claras', 'Avenida das Araucárias', 'Lote 1835', '71936-250'),
    (7, 'Samambaia', 'QN 408 Conjunto F', 'Samambaia Norte', '72318-556'),
    (8, 'Ceilândia', 'QNM 20 Conjunto A', 'Ceilândia Sul', '72210-201'),
    (9, 'Sobradinho', 'Quadra 14 Conjunto E', 'Setor de Mansões', '73025-145'),
    (10, 'Gama', 'Setor Leste Quadra 45', 'Lote 12', '72445-045'),
    (11, 'Recanto das Emas', 'Quadra 405 Conjunto 10', 'Avenida Potiguar', '72631-110'),
    (12, 'Planaltina', 'Setor Tradicional Quadra 50', 'Avenida Independência', '73330-050'),
    (13, 'Cruzeiro', 'SRES Quadra 10 Bloco G', 'Cruzeiro Velho', '70648-173');

-- Consulta de endereço de uma pessoa específica
SELECT i.nomeinscrito, e.cidade, e.rua, e.uf, e.cep
FROM inscritocomunidade as i
JOIN endereco as e ON e.idfichacomunidade = i.idfichacomunidade
WHERE i.nomeinscrito = 'Camile de Souza';

-- INSERT INTO endereco (idfichaconvenio, idfichacomunidade, cidade, rua, uf, cep)
-- SELECT 
--     NULL,  -- idfichaconvenio (se necessário, pode deixar NULL ou ajustar conforme o caso)
--     idinscrito,  -- Pega o idinscrito da tabela inscritocomunidade
--     'Brasília',  -- Insere diretamente o valor da cidade
--     'rua alvares cabral',  -- Insere diretamente o valor da rua
--     'DF',  -- Insere diretamente o valor do estado (UF)
--     '75023132'  -- Insere diretamente o valor do CEP
-- FROM 
--     inscritocomunidade
-- WHERE 
--     nomeinscrito = 'Camile de Souza';  -- Condição para selecionar Camile

Select ic.nomeinscrito, ic.nomeresp, ic.tellcellresp, ic.cpfinscrito, e.cidade, e.rua, e.uf, e.cep
FROM inscritocomunidade as ic 
JOIN endereco as e ON e.idfichacomunidade = ic.idfichacomunidade
WHERE ic.cpfresp = '11122233301';

-- Inserindo alguns dados na tabela tipoterapia
INSERT INTO tipoterapia (idfichacomunidade, casal)
VALUES 
	(13, TRUE),
	(21, TRUE);
	
INSERT INTO tipoterapia (idfichacomunidade, familia)
VALUES
	(9, TRUE),
	(16, TRUE);
	
INSERT INTO tipoterapia (idfichacomunidade, individualadt)
VALUES
	(17, TRUE),
	(22, TRUE),
	(24, TRUE);

--Fazendo uma consulta buscando dados na tabela inscritocomunidade com a tabela tipoterapia, onde o tipo terapia vai ter a coluna "familia", "casal" ou "indiviualadt" como TRUE.
SELECT ic.nomeinscrito, ic.dtnascimento, ic.identidadegenero, ic.religiao, 
ic.dthinscricao, t.familia, t.casal, t.individualadt 
FROM inscritocomunidade AS ic 
JOIN tipoterapia AS t ON ic.idfichacomunidade = t.idfichacomunidade
WHERE
	t.casal = TRUE OR
	t.familia = TRUE OR
	t.individualadt = TRUE;

-- Inserindo alguns dados na tabela pcdsnd
INSERT INTO pcdsnd (idfichacomunidade, tea)
VALUES
	(16, TRUE),
	(24, TRUE);
	
INSERT INTO pcdsnd (idfichacomunidade, dfa)
VALUES
	(10, TRUE),
	(12, TRUE);

-- Fazendo uma consulta na tabela de pcdsnd
SELECT ic.nomeinscrito, ic.emailinscrito, ic.etnia, ic.status, p.tea, p.dfa
FROM inscritocomunidade AS ic
JOIN pcdsnd AS p ON ic.idfichacomunidade = p.idfichacomunidade
WHERE 
	p.tea = TRUE OR
	p.dfa = TRUE;






