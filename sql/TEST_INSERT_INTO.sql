SELECT * FROM inscritoconvenio;
SELECT * FROM inscritocomunidade;
SELECT * FROM endereco;
SELECT * FROM medicamento;
SELECT * FROM tipoterapia;
SELECT * FROM pcdsnd;
SELECT * FROM doencafisica;
SELECT * FROM disponibilidade;
SELECT * FROM coordenador;
SELECT * FROM supervisor;
SELECT * FROM secretaria;
SELECT * FROM resptec;
SELECT * FROM estagiario;
SELECT * FROM escolheins;
SELECT * FROM sala;
SELECT * FROM agendamento;
SELECT * FROM salaagendamento;
SELECT * FROM prontuario;
SELECT * FROM folhaevo;
SELECT * FROM fichafreqest;
SELECT * FROM anamnese;
SELECT * FROM laudomed;
SELECT * FROM arqinscrito;
SELECT * FROM arquivamento;
SELECT * FROM soliarquivamento;
SELECT * FROM htocorrencia;

INSERT INTO 
	inscritoconvenio (nomeinscrito, dtnascimento, testavpsico, tipoencaminhamento, nomeresp, grauresp, cpfresp, estadocivilresp, tellcellresp, emailresp, estadocivilinscrito, cpfinscrito, tellcellinscrito, contatourgencia, nomecontatourgencia, emailinscrito, identidadegenero, etnia, religiao, confirmlgpd, dthinscricao, status) 
VALUES
	('Ana Clara Silva', '2005-03-15', TRUE, 'CAPS', 'João Carlos Silva', 'Pai', '11122233344', 'Casado', '11987654321', 'joao.silva@email.com', 'Solteiro', '44455566677', '11998765432', '11991234567', 'Maria Silva', 'ana.clara@email.com', 'Feminino', 'Branca', 'Católico', TRUE, '2024-01-10', TRUE),
	('Bruno Souza Costa', '2008-07-22', FALSE, 'CRAS', 'Mariana Costa', 'Mãe', '22233344455', 'Solteiro', '21976543210', 'mariana.costa@email.com', 'Solteiro', '55566677788', '21987654321', '21991234567', 'Pedro Souza', 'bruno.souza@email.com', 'Masculino', 'Parda', 'Evangélico', TRUE, '2024-02-15', TRUE),
	('Carla Dias Pereira', '2003-11-01', TRUE, 'CREAS', 'Fernando Pereira', 'Avô', '33344455566', 'Viúvo', '31965432109', 'fernando.pereira@email.com', 'Solteiro', '66677788899', '31998765432', '31991234567', 'Helena Dias', 'carla.dias@email.com', 'Feminino', 'Preta', 'Espirita', TRUE, '2024-03-01', TRUE),
	('Daniel Lima Santos', '2010-02-28', TRUE, 'DEAM', 'Patricia Santos', 'Mãe', '44455566677', 'Divorciado', '41954321098', 'patricia.santos@email.com', 'Solteiro', '77788899900', '41987654321', '41991234567', 'Marcos Lima', 'daniel.lima@email.com', 'Masculino', 'Amarela', 'Budismo', TRUE, '2024-04-20', TRUE),
	('Eduarda Alves Rocha', '2006-09-10', FALSE, 'DPDF', 'Roberto Rocha', 'Padrasto', '55566677788', 'Casado', '51943210987', 'roberto.rocha@email.com', 'Solteiro', '88899900011', '51987654321', '51991234567', 'Simone Alves', 'eduarda.alves@email.com', 'Feminino', 'Indígena', 'Sem religião', TRUE, '2024-05-05', TRUE),
	('Felipe Gomes Teixeira', '2004-01-05', TRUE, 'MPDFT', 'Andrea Teixeira', 'Mãe', '66677788899', 'Casado', '61932109876', 'andrea.teixeira@email.com', 'Solteiro', '99900011122', '61987654321', '61991234567', 'Carlos Gomes', 'felipe.gomes@email.com', 'Masculino', 'Branca', 'Católico', TRUE, '2024-06-12', TRUE),
	('Giovanna Mendes Oliveira', '2009-04-18', FALSE, 'SES', 'Paulo Oliveira', 'Pai', '77788899900', 'Solteiro', '71921098765', 'paulo.oliveira@email.com', 'Solteiro', '00011122233', '71987654321', '71991234567', 'Beatriz Mendes', 'giovanna.mendes@email.com', 'Feminino', 'Parda', 'Evangélico', TRUE, '2024-07-01', TRUE),
	('Heitor Nunes Barbosa', '2007-06-30', TRUE, 'SEJUS', 'Sandra Barbosa', 'Mãe', '88899900011', 'Viúvo', '81910987654', 'sandra.barbosa@email.com', 'Solteiro', '11122233344', '81987654321', '81991234567', 'Ricardo Nunes', 'heitor.nunes@email.com', 'Masculino', 'Preta', 'Espirita', TRUE, '2024-08-18', TRUE),
	('Isabela Costa Andrade', '2005-08-25', FALSE, 'UBS', 'Gustavo Andrade', 'Padrasto', '99900011122', 'Casado', '91909876543', 'gustavo.andrade@email.com', 'Solteiro', '22233344455', '91987654321', '91991234567', 'Luciana Costa', 'isabela.costa@email.com', 'Feminino', 'Amarela', 'Budismo', TRUE, '2024-09-22', TRUE),
	('João Victor Ferreira', '2008-12-03', TRUE, 'Clinica Ana Lucia Chaves Fecury Unieuro Asa Sul', 'Mônica Ferreira', 'Mãe', '00011122233', 'Divorciado', '11987654321', 'monica.ferreira@email.com', 'Solteiro', '33344455566', '11998765432', '11991234567', 'Roberto Victor', 'joao.victor@email.com', 'Masculino', 'Indígena', 'Sem religião', TRUE, '2024-10-03', TRUE),
	('Karen Santos Rocha', '2003-05-19', TRUE, 'CAPS', 'José Rocha', 'Pai', '11122233345', 'Casado', '21976543211', 'jose.rocha@email.com', 'Solteiro', '44455566678', '21987654322', '21991234568', 'Fernanda Santos', 'karen.santos@email.com', 'Feminino', 'Branca', 'Católico', TRUE, '2024-11-14', TRUE),
	('Lucas Silva Andrade', '2010-01-08', FALSE, 'CRAS', 'Ana Andrade', 'Mãe', '22233344456', 'Solteiro', '31965432110', 'ana.andrade@email.com', 'Solteiro', '55566677789', '31998765433', '31991234569', 'Carlos Silva', 'lucas.silva@email.com', 'Masculino', 'Parda', 'Evangélico', TRUE, '2024-12-01', TRUE),
	('Mariana Lima Souza', '2006-07-12', TRUE, 'CREAS', 'Pedro Souza', 'Avô', '33344455567', 'Viúvo', '41954321099', 'pedro.souza@email.com', 'Solteiro', '66677788800', '41987654322', '41991234570', 'Sandra Lima', 'mariana.lima@email.com', 'Feminino', 'Preta', 'Espirita', TRUE, '2025-01-05', TRUE),
	('Nicolas Almeida Ribeiro', '2004-11-29', FALSE, 'DEAM', 'Juliana Ribeiro', 'Mãe', '44455566678', 'Divorciado', '51943210989', 'juliana.ribeiro@email.com', 'Solteiro', '77788899901', '51987654322', '51991234571', 'Marcelo Almeida', 'nicolas.almeida@email.com', 'Masculino', 'Amarela', 'Budismo', TRUE, '2025-02-19', TRUE),
	('Olivia Pereira Rocha', '2009-02-14', TRUE, 'DPDF', 'Ricardo Rocha', 'Padrasto', '55566677789', 'Casado', '61932109878', 'ricardo.rocha@email.com', 'Solteiro', '88899900012', '61987654322', '61991234572', 'Cristina Pereira', 'olivia.pereira@email.com', 'Feminino', 'Indígena', 'Sem religião', TRUE, '2025-03-25', TRUE),
	('Pedro Henrique Santos', '2007-04-07', TRUE, 'MPDFT', 'Claudia Santos', 'Mãe', '66677788890', 'Casado', '71921098767', 'claudia.santos@email.com', 'Solteiro', '99900011123', '71987654322', '71991234573', 'Felipe Henrique', 'pedro.santos@email.com', 'Masculino', 'Branca', 'Católico', TRUE, '2025-04-01', TRUE),
	('Quirino Souza Lopes', '2005-09-21', FALSE, 'SES', 'Renata Lopes', 'Mãe', '77788899901', 'Solteiro', '81910987656', 'renata.lopes@email.com', 'Solteiro', '00011122234', '81987654322', '81991234574', 'Sergio Souza', 'quirino.souza@email.com', 'Masculino', 'Parda', 'Evangélico', TRUE, '2025-05-10', TRUE),
	('Rafaela Dantas Costa', '2008-03-02', TRUE, 'SEJUS', 'Marisa Costa', 'Mãe', '88899900012', 'Viúvo', '91909876545', 'marisa.costa@email.com', 'Solteiro', '11122233345', '91987654322', '91991234575', 'Antônio Dantas', 'rafaela.dantas@email.com', 'Feminino', 'Preta', 'Espirita', TRUE, '2025-06-03', TRUE),
	('Sophia Miranda Carvalho', '2003-06-26', FALSE, 'UBS', 'Eduardo Carvalho', 'Pai', '99900011123', 'Divorciado', '11987654323', 'eduardo.carvalho@email.com', 'Solteiro', '22233344456', '11998765434', '11991234576', 'Viviane Miranda', 'sophia.miranda@email.com', 'Feminino', 'Amarela', 'Budismo', TRUE, '2025-06-08', TRUE),
	('Thiago Rocha Gomes', '2006-10-17', TRUE, 'Clinica Ana Lucia Chaves Fecury Unieuro Asa Sul', 'Isabel Gomes', 'Mãe', '00011122234', 'Casado', '21976543212', 'isabel.gomes@email.com', 'Solteiro', '33344455567', '21987654323', '21991234577', 'André Rocha', 'thiago.rocha@email.com', 'Masculino', 'Indígena', 'Sem religião', TRUE, '2025-06-09', TRUE);
	
INSERT INTO 
	inscritocomunidade (nomeinscrito, dtnascimento, nomeresp, grauresp, cpfresp, estadocivilresp, tellcellresp, emailresp, estadocivilinscrito, cpfinscrito, tellcellinscrito, contatourgencia, nomecontatourgencia, emailinscrito, identidadegenero, etnia, religiao, confirmlgpd, dthinscricao, status) 
VALUES
	('Pedro Alvares Cabral', '2000-01-15', 'Ana Cabral', 'Mãe', '12345678901', 'Solteiro', '11987654321', 'ana.cabral@email.com', 'Solteiro', '01234567890', '11998765432', '11991234567', 'Joana Cabral', 'pedro.cabral@email.com', 'Masculino', 'Branca', 'Católico', TRUE, '2024-05-01', TRUE),
	('Maria da Silva Souza', '1995-03-20', 'Carlos Souza', 'Pai', '23456789012', 'Casado', '21976543210', 'carlos.souza@email.com', 'Casado', '12345678901', '21987654321', '21992345678', 'Fernanda Souza', 'maria.souza@email.com', 'Feminino', 'Parda', 'Evangélico', TRUE, '2024-05-02', TRUE),
	('João Victor Oliveira', '2002-07-01', 'Patrícia Oliveira', 'Mãe', '34567890123', 'Divorciado', '31965432109', 'patricia.oliver@email.com', 'Solteiro', '23456789012', '31998765432', '31993456789', 'Roberto Oliveira', 'joao.oliver@email.com', 'Masculino', 'Preta', 'Espirita', TRUE, '2024-05-03', TRUE),
	('Ana Clara Santos', '1988-11-10', 'Márcia Santos', 'Mãe', '45678901234', 'Viúvo', '41954321098', 'marcia.santos@email.com', 'União Estável', '34567890123', '41987654321', '41994567890', 'Paula Santos', 'ana.santos@email.com', 'Feminino', 'Branca', 'Sem religião', TRUE, '2024-05-04', TRUE),
	('Lucas Martins Lima', '2005-02-28', 'Ricardo Lima', 'Pai', '56789012345', 'União Estável', '51943210987', 'ricardo.lima@email.com', 'Solteiro', '45678901234', '51987654321', '51995678901', 'Silvia Lima', 'lucas.lima@email.com', 'Masculino', 'Amarela', 'Budismo', TRUE, '2024-05-05', TRUE),
	('Fernanda Costa Alves', '1990-09-05', 'Mariana Alves', 'Mãe', '67890123456', 'Solteiro', '61932109876', 'mariana.alves@email.com', 'Divorciado', '56789012345', '61987654321', '61996789012', 'Rafael Alves', 'fernanda.alves@email.com', 'Feminino', 'Parda', 'Católico', TRUE, '2024-05-06', TRUE),
	('Guilherme Pereira Neto', '1998-04-12', 'Sonia Neto', 'Mãe', '78901234567', 'Casado', '71921098765', 'sonia.neto@email.com', 'Solteiro', '67890123456', '71987654321', '71997890123', 'Eduardo Neto', 'guilherme.neto@email.com', 'Masculino', 'Indígena', 'Religião de Matriz Africana', TRUE, '2024-05-07', TRUE),
	('Isabela Gomes Ribeiro', '2001-08-30', 'Antônio Ribeiro', 'Pai', '89012345678', 'Divorciado', '81910987654', 'antonio.ribeiro@email.com', 'Solteiro', '78901234567', '81987654321', '81998901234', 'Carla Ribeiro', 'isabela.ribeiro@email.com', 'Feminino', 'Preta', 'Evangélico', TRUE, '2024-05-08', TRUE),
	('Henrique Rocha Costa', '1993-06-18', 'Cristina Costa', 'Mãe', '90123456789', 'Viúvo', '91909876543', 'cristina.costa@email.com', 'Casado', '89012345678', '91987654321', '91999012345', 'Felipe Costa', 'henrique.costa@email.com', 'Masculino', 'Branca', 'Hinduísmo', TRUE, '2024-05-09', TRUE),
	('Julia Pires Mendes', '2004-10-25', 'Paulo Mendes', 'Pai', '01234567890', 'União Estável', '11987654321', 'paulo.mendes@email.com', 'Solteiro', '90123456789', '11998765432', '11991234567', 'Denise Mendes', 'julia.mendes@email.com', 'Feminino', 'Parda', 'Islamismo', TRUE, '2024-05-10', TRUE),
	('Leonardo Barreto Cordeiro', '1997-01-03', 'Flávia Cordeiro', 'Mãe', '12345678902', 'Solteiro', '21976543210', 'flavia.cordeiro@email.com', 'Solteiro', '01234567891', '21987654321', '21992345678', 'Gustavo Cordeiro', 'leonardo.cordeiro@email.com', 'Masculino', 'Preta', 'Judaismo', TRUE, '2024-05-11', TRUE),
	('Beatriz Neves Vasconcelos', '1985-05-14', 'Rodrigo Vasconcelos', 'Pai', '23456789013', 'Casado', '31965432109', 'rodrigo.vasconcelos@email.com', 'Casado', '12345678902', '31998765432', '31993456789', 'Valeria Vasconcelos', 'beatriz.vasconcelos@email.com', 'Feminino', 'Branca', 'Outros', TRUE, '2024-05-12', TRUE),
	('Caique Gomes Santos', '2003-09-08', 'Mônica Santos', 'Mãe', '34567890124', 'Divorciado', '41954321098', 'monica.santos@email.com', 'Solteiro', '23456789013', '41987654321', '41994567890', 'Thiago Santos', 'caique.santos@email.com', 'Masculino', 'Amarela', 'Sem religião', TRUE, '2024-05-13', TRUE),
	('Diana Sales Mendes', '1999-12-22', 'Alexandre Mendes', 'Pai', '45678901235', 'Viúvo', '51943210987', 'alexandre.mendes@email.com', 'União Estável', '34567890124', '51987654321', '51995678901', 'Mariana Mendes', 'diana.mendes@email.com', 'Feminino', 'Indígena', 'Católico', TRUE, '2024-05-14', TRUE),
	('Emanuel Diniz Almeida', '2006-03-01', 'Carolina Almeida', 'Mãe', '56789012346', 'União Estável', '61932109876', 'carolina.almeida@email.com', 'Solteiro', '45678901235', '61987654321', '61996789012', 'Luiz Almeida', 'emanuel.almeida@email.com', 'Masculino', 'Parda', 'Evangélico', TRUE, '2024-05-15', TRUE),
	('Fabiana Leal Batista', '1992-07-16', 'João Batista', 'Pai', '67890123457', 'Solteiro', '71921098765', 'joao.batista@email.com', 'Divorciado', '56789012346', '71987654321', '71997890123', 'Regina Batista', 'fabiana.batista@email.com', 'Feminino', 'Preta', 'Espirita', TRUE, '2024-05-16', TRUE),
	('Gabriel Rocha Siqueira', '2000-11-09', 'Laura Siqueira', 'Mãe', '78901234568', 'Casado', '81910987654', 'laura.siqueira@email.com', 'Solteiro', '67890123457', '81987654321', '81998901234', 'Daniel Siqueira', 'gabriel.siqueira@email.com', 'Masculino', 'Branca', 'Budismo', TRUE, '2024-05-17', TRUE),
	('Heloisa Santos Silva', '1996-02-04', 'Fernando Silva', 'Pai', '89012345679', 'Divorciado', '91909876543', 'fernando.silva@email.com', 'Casado', '78901234568', '91987654321', '91999012345', 'Bianca Silva', 'heloisa.silva@email.com', 'Feminino', 'Amarela', 'Hinduísmo', TRUE, '2024-05-18', TRUE),
	('Igor Vasconcelos Costa', '2004-08-20', 'Juliana Costa', 'Mãe', '90123456780', 'Viúvo', '11987654321', 'juliana.costa@email.com', 'Solteiro', '89012345679', '11998765432', '11991234567', 'Miguel Costa', 'igor.costa@email.com', 'Masculino', 'Indígena', 'Islamismo', TRUE, '2024-05-19', TRUE),
	('Juliana Dantas Almeida', '1991-04-10', 'Cesar Almeida', 'Pai', '01234567893', 'Solteiro', '21976543210', 'cesar.almeida@email.com', 'Divorciado', '90123456780', '21987654321', '21992345678', 'Alice Almeida', 'juliana.almeida@email.com', 'Feminino', 'Parda', 'Judaismo', TRUE, '2024-05-20', TRUE);
	
INSERT INTO endereco (idfichacomunidade, cidade, bairro, 
					  rua, cep)
VALUES 
    
    (7, 'Samambaia', 'QN 408 Conjunto F', 'Samambaia Norte', '72318-556'),
    (8, 'Ceilândia', 'QNM 20 Conjunto A', 'Ceilândia Sul', '72210-201'),
    (9, 'Sobradinho', 'Quadra 14 Conjunto E', 'Setor de Mansões', '73025-145'),
    (10, 'Gama', 'Setor Leste Quadra 45', 'Lote 12', '72445-045'),
    (11, 'Recanto das Emas', 'Quadra 405 Conjunto 10', 'Avenida Potiguar', '72631-110'),
    (12, 'Planaltina', 'Setor Tradicional Quadra 50', 'Avenida Independência', '73330-050'),
    (13, 'Cruzeiro', 'SRES Quadra 10 Bloco G', 'Cruzeiro Velho', '70648-173'),
	(14, 'Águas Claras', 'Avenida das Araucárias', 'Lote 1835', '71936-250');
	
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

INSERT INTO pcdsnd (idfichacomunidade, tea)
VALUES
	(16, TRUE),
	(24, TRUE);
	
INSERT INTO pcdsnd (idfichacomunidade, dfa)
VALUES
	(10, TRUE),
	(12, TRUE);

INSERT INTO motivoacompanhamento(idfichacomunidade,tristeza,chorofc,depressao) 
VALUES (
	20,
	TRUE,
	TRUE,
	TRUE
);

INSERT INTO medicamento (idfichaconvenio, idfichacomunidade, ansiolitico, antidepressivo, antipsicotico, estabhumor, memoriatct, outro) 
VALUES
	(7, NULL, TRUE, FALSE, FALSE, FALSE, FALSE, FALSE),
	(NULL, 8, FALSE, TRUE, FALSE, FALSE, FALSE, FALSE),
	(9, NULL, FALSE, FALSE, TRUE, FALSE, FALSE, FALSE),
	(NULL, 10, FALSE, FALSE, FALSE, TRUE, FALSE, FALSE),
	(11, NULL, FALSE, FALSE, FALSE, FALSE, TRUE, FALSE);
	
INSERT INTO doencafisica (idfichaconvenio, idfichacomunidade, doencaresp, cancer, diabete, disfusexual, doencadgt, escleorosemlt, hcpt, luposatm, obesidade, pblmarenal, outro) VALUES
(10, NULL, TRUE, FALSE, FALSE, FALSE, FALSE, FALSE, FALSE, FALSE, FALSE, FALSE, FALSE),
(NULL, 15, FALSE, TRUE, FALSE, FALSE, FALSE, FALSE, FALSE, FALSE, FALSE, FALSE, FALSE),
(7, NULL, FALSE, FALSE, TRUE, FALSE, FALSE, FALSE, TRUE, FALSE, TRUE, FALSE, FALSE),
(NULL, 19, FALSE, FALSE, FALSE, TRUE, FALSE, FALSE, FALSE, FALSE, FALSE, FALSE, FALSE),
(12, NULL, FALSE, FALSE, FALSE, FALSE, TRUE, TRUE, FALSE, TRUE, FALSE, FALSE, FALSE);

INSERT INTO disponibilidade (idfichaconvenio, idfichacomunidade, manha, tarde, noite, sabado) VALUES
(7, NULL, TRUE, TRUE, FALSE, FALSE),
(NULL, 12, FALSE, TRUE, TRUE, FALSE),
(9, NULL, TRUE, FALSE, FALSE, TRUE),
(NULL, 18, FALSE, FALSE, TRUE, TRUE),
(15, NULL, TRUE, TRUE, TRUE, FALSE);

INSERT INTO coordenador (nome, senha, cpf, crp, crpcoord, emailinst, status) VALUES
('Mônica Silva', MD5('senha123coor'), '11122233344', 12345, NULL, 'monica.silva@instituicao.com', TRUE),
('Ricardo Almeida', MD5('pass_coord_456'), '22233344455', 23456, 12345, 'ricardo.almeida@instituicao.com', TRUE),
('Fernanda Costa', MD5('segur4coor789'), '33344455566', 34567, 12345, 'fernanda.costa@instituicao.com', TRUE),
('Gustavo Pereira', MD5('coor_senha_abc'), '44455566677', 45678, 23456, 'gustavo.pereira@instituicao.com', TRUE),
('Patrícia Santos', MD5('nova_senha_def'), '55566677788', 56789, 34567, 'patricia.santos@instituicao.com', TRUE);


INSERT INTO coordenador (nome, senha, cpf, crp, crpcoord, emailinst, status) 
	
	VALUES(
			'Guilher Monico',
			MD5('senha123456'),
			'12345678923',
			123089,
			12345,
		'guilhermeMonico@unieuro.com.br',
		TRUE);

INSERT INTO supervisor (crpcoord, nome, cpf, crp, senha, emailinst, status) VALUES
(12345, 'Ana Paula Gomes', '66677788899', 67890, MD5('senha_sup_ana'), 'ana.gomes@instituicao.com', TRUE),
(23456, 'Carlos Eduardo Nogueira', '77788899900', 78901, MD5('super_carlos_123'), 'carlos.nogueira@instituicao.com', TRUE),
(12345, 'Mariana Ferreira Lima', '88899900011', 89012, MD5('mari_super_secure'), 'mariana.lima@instituicao.com', TRUE),
(34567, 'Roberto Dias Costa', '99900011122', 90123, MD5('roberto_pass_sup'), 'roberto.costa@instituicao.com', TRUE),
(23456, 'Sofia Alves Pinto', '00011122233', 01234, MD5('sofia_senha_sup'), 'sofia.pinto@instituicao.com', TRUE);

INSERT INTO secretaria (crpcoord, nome, cpf, codfuncionario, senha, emailinst, status) VALUES
(12345, 'Camila Rocha', '66677788899', 1001, MD5('sec_senha_01'), 'camila.rocha@instituicao.com', TRUE),
(23456, 'Thiago Mendes', '77788899900', 1002, MD5('sec_pass_02'), 'thiago.mendes@instituicao.com', TRUE),
(12345, 'Daniela Lima', '88899900011', 1003, MD5('secreta_321'), 'daniela.lima@instituicao.com', TRUE),
(34567, 'Eduardo Costa', '99900011122', 1004, MD5('senha_sec_4'), 'eduardo.costa@instituicao.com', TRUE),
(23456, 'Larissa Soares', '00011122233', 1005, MD5('ultra_secreta'), 'larissa.soares@instituicao.com', TRUE);

INSERT INTO resptec (crpcoord, nome, senha, cpf, crpresp, emailinst, status) VALUES
(12345, 'Cláudia Regina', MD5('resptec_senha01'), '66677788899', 60001, 'claudia.regina@instituicao.com', TRUE),
(23456, 'Marcos Vinícius', MD5('seguranca_rt02'), '77788899900', 60002, 'marcos.vinicius@instituicao.com', TRUE),
(12345, 'Sandra Aparecida', MD5('rt_pass321'), '88899900011', 60003, 'sandra.aparecida@instituicao.com', TRUE),
(34567, 'Roberto Carlos', MD5('new_rt_pass4'), '99900011122', 60004, 'roberto.carlos@instituicao.com', TRUE),
(23456, 'Lúcia Helena', MD5('senha_rt_final'), '00011122233', 60005, 'lucia.helena@instituicao.com', TRUE);

INSERT INTO estagiario (crpsup, crpcoord, nome, ra, senha, nivelestagio, semestre, emailinst, status) VALUES
(67890, 12345, 'João Pedro Silva', 1001, MD5('joaoestagio@1'), 'Básico', '1º Semestre', 'joao.silva@aluno.instituicao.com', TRUE),
(78901, 23456, 'Mariana Gomes', 1002, MD5('mariana.est@'), 'Intermediário', '3º Semestre', 'mariana.g@aluno.instituicao.com', TRUE),
(89012, 12345, 'Felipe Souza', 1003, MD5('felipe_estg#'), 'Avançado', '5º Semestre', 'felipe.s@aluno.instituicao.com', TRUE),
(90123, 34567, 'Luisa Dias', 1004, MD5('luisaEstg!'), 'Básico', '2º Semestre', 'luisa.d@aluno.instituicao.com', TRUE),
(01234, 23456, 'Gabriel Alves', 1005, MD5('gabriel-e$tg'), 'Intermediário', '4º Semestre', 'gabriel.a@aluno.instituicao.com', TRUE);

INSERT INTO 
	escolheins (idestagiario, idfichaconvenio, idfichacomunidade, status, dthescolha) 
VALUES
	(16, 2, NULL, TRUE, NOW()),  -- Exemplo: Estagiário ID 16 escolheu inscrição de convênio ID 2
	(17, NULL, 7, TRUE, NOW()),  -- Exemplo: Estagiário ID 17 escolheu inscrição de comunidade ID 7
	(18, 3, NULL, FALSE, NOW()), -- Exemplo: Estagiário ID 18 escolheu inscrição de convênio ID 3
	(19, NULL, 9, TRUE, NOW()),  -- Exemplo: Estagiário ID 19 escolheu inscrição de comunidade ID 9
	(20, 5, NULL, FALSE, NOW()); -- Exemplo: Estagiário ID 20 escolheu inscrição de convênio ID 5

INSERT INTO 
	sala (codfuncionario, crpresp, crpcoord, numsala, tiposala, capacidade, dthsala, status) 
VALUES
	(1001, 60001, 12345, 101, 'Clínica', 10, NOW(), TRUE),
	(1002, 60002, 23456, 102, 'Ateliê', 8, NOW(), TRUE),
	(1003, 60003, 34567, 103, 'Grupo', 15, NOW(), TRUE),
	(1004, 60004, 45678, 201, 'Reunião', 5, NOW(), FALSE),
	(1005, 60005, 56789, 202, 'Clínica', 12, NOW(), TRUE);
	
INSERT INTO 
	agendamento (idsala, codfuncionario, crpresp, crpcoord, confirmsec, dthconfirmsec, confirmresp, dthconfirmresp, confirmcoord, dthconfirmcoord) 
VALUES
	(16, 1001, 60001, 12345, TRUE, '2025-06-10 10:00:00', TRUE, '2025-06-10 10:30:00', TRUE, '2025-06-10 11:00:00'),
	(17, 1002, 60002, 23456, TRUE, '2025-06-10 14:00:00', FALSE, NULL, FALSE, NULL),
	(18, 1003, NULL, 12345, TRUE, '2025-06-11 09:00:00', FALSE, NULL, TRUE, '2025-06-11 09:45:00'),
	(19, NULL, 60004, 23456, FALSE, NULL, TRUE, '2025-06-11 15:00:00', FALSE, NULL),
	(20, 1004, 60003, 12345, TRUE, '2025-06-12 11:00:00', TRUE, '2025-06-12 11:15:00', TRUE, '2025-06-12 11:30:00');

INSERT INTO 
	salaagendamento (idagendamento, crpsup, ra, dthsolisup, dthsoliest) 
VALUES
	(11, 67890, 1001, '2025-06-10 09:30:00', NULL),
	(12, 78901, NULL, NULL, '2025-06-10 13:45:00'),
	(13, 89012, 1003, '2025-06-11 08:30:00', '2025-06-11 08:45:00'),
	(14, NULL, 1004, NULL, '2025-06-11 14:30:00'),
	(15, 01234, 1005, '2025-06-12 10:45:00', NULL);

INSERT INTO 
	prontuario (crpcoord, crpsup, ra, idfichaconvenio, idfichacomunidade, tcle, dthprontuario, status) 
VALUES
	(12345, 67890, 1001, 2, NULL, 'Uma versão em bytes do TCLE do paciente João Pedro Silva. Este é um texto de exemplo.', '2025-06-10 10:00:00', TRUE),
	(23456, 78901, 1002, NULL, 7, 'Uma versão em bytes do TCLE da paciente Mariana Gomes. Este é um texto de exemplo para o prontuário da comunidade.', '2025-06-10 14:30:00', TRUE),
	(12345, 89012, 1003, 3, NULL, 'TCLE digitalizado do paciente Felipe Souza. Conteúdo exemplo para prontuário de convênio.', '2025-06-11 09:15:00', TRUE),
	(34567, 90123, 1004, NULL, 9, 'Arquivo de consentimento da paciente Luisa Dias. Exemplo de dados para prontuário da comunidade.', '2025-06-11 16:00:00', TRUE),
	(23456, 01234, 1005, 4, NULL, 'Prontuário e TCLE do paciente Gabriel Alves. Texto de demonstração para a ficha de convênio.', '2025-06-12 11:45:00', TRUE);

INSERT INTO 
	folhaevo (idprontuario, folhaevolucao, dthanexo) 
VALUES
	(6, DECODE('466f6c686145766f6c7563616f31', 'hex'), NOW()), -- Conteúdo binário de exemplo para "FolhaEvolucao1"
	(7, DECODE('466f6c686145766f6c7563616f32', 'hex'), NOW()), -- Conteúdo binário de exemplo para "FolhaEvolucao2"
	(8, DECODE('466f6c686145766f6c7563616f33', 'hex'), NOW()), -- Conteúdo binário de exemplo para "FolhaEvolucao3"
	(9, DECODE('466f6c686145766f6c7563616f34', 'hex'), NOW()), -- Conteúdo binário de exemplo para "FolhaEvolucao4"
	(10, DECODE('466f6c686145766f6c7563616f35', 'hex'), NOW()); -- Conteúdo binário de exemplo para "FolhaEvolucao5"

INSERT INTO 
	fichafreqest (ra, crpsup, crpcoord, fichafreq) 
VALUES
	(1001, 67890, 12345, DECODE('46696368614672657145737431', 'hex')), -- Exemplo binário: "FichaFreqEst1"
	(1002, 78901, 23456, DECODE('46696368614672657145737432', 'hex')), -- Exemplo binário: "FichaFreqEst2"
	(1003, 89012, 12345, DECODE('46696368614672657145737433', 'hex')), -- Exemplo binário: "FichaFreqEst3"
	(1004, 90123, 34567, DECODE('46696368614672657145737434', 'hex')), -- Exemplo binário: "FichaFreqEst4"
	(1005, 01234, 23456, DECODE('46696368614672657145737435', 'hex')); -- Exemplo binário: "FichaFreqEst5"

INSERT INTO 
	anamnese (idprontuario, anamnesedoc, dthanexo) 
VALUES
	(6, DECODE('416e616d6e657365446f6331', 'hex'), NOW()), -- Exemplo de conteúdo binário para "AnamneseDoc1"
	(7, DECODE('416e616d6e657365446f6332', 'hex'), NOW()), -- Exemplo de conteúdo binário para "AnamneseDoc2"
	(8, DECODE('416e616d6e657365446f6333', 'hex'), NOW()), -- Exemplo de conteúdo binário para "AnamneseDoc3"
	(9, DECODE('416e616d6e657365446f6334', 'hex'), NOW()), -- Exemplo de conteúdo binário para "AnamneseDoc4"
	(10, DECODE('416e616d6e657365446f6335', 'hex'), NOW()); -- Exemplo de conteúdo binário para "AnamneseDoc5"

INSERT INTO 
	laudomed (idprontuario, laudodoc, dthanexo) 
VALUES
	(6, DECODE('4c6175646f4d656469636f3031', 'hex'), '2025-06-15 10:00:00'), -- Exemplo binário para "LaudoMedico01"
	(7, DECODE('4c6175646f4d656469636f3032', 'hex'), '2025-06-16 11:30:00'), -- Exemplo binário para "LaudoMedico02"
	(8, DECODE('4c6175646f4d656469636f3033', 'hex'), '2025-06-17 09:00:00'), -- Exemplo binário para "LaudoMedico03"
	(9, DECODE('4c6175646f4d656469636f3034', 'hex'), '2025-06-18 14:00:00'), -- Exemplo binário para "LaudoMedico04"
	(10, DECODE('4c6175646f4d656469636f3035', 'hex'), '2025-06-19 16:45:00'); -- Exemplo binário para "LaudoMedico05"

INSERT INTO 
	arqinscrito (idfichaconvenio, idfichacomunidade, status, dtharquinscrito) 
VALUES
	(2, NULL, TRUE, '2025-06-11 10:00:00'), -- Arquivo relacionado ao inscrito de convênio ID 2
	(NULL, 7, TRUE, '2025-06-11 10:05:00'), -- Arquivo relacionado ao inscrito de comunidade ID 7
	(3, NULL, FALSE, '2025-06-11 10:10:00'), -- Arquivo relacionado ao inscrito de convênio ID 3
	(NULL, 8, TRUE, '2025-06-11 10:15:00'), -- Arquivo relacionado ao inscrito de comunidade ID 8
	(4, NULL, TRUE, '2025-06-11 10:20:00'); -- Arquivo relacionado ao inscrito de convênio ID 4


INSERT INTO 
	arquivamento (idsolicitacao, crpcoord, crpresp, idprontuario, idarqinscrito, justificativa) 
VALUES
	(1, 12345, 60001, 6, NULL,'Prontuário e solicitação finalizados com sucesso.'),
	(2, 23456, NULL, 7,1, 'Documentação do inscrito da comunidade arquivada.'),
	(3, 34567, 60002, 8,NULL, 'Processo do convênio encerrado e arquivado.'),
	(4, 45678, NULL, 9,2, 'Folha de evolução e prontuário completos.'),
	(5, 56789, 60003,10, 3, 'Caso de estagiário concluído, arquivamento padrão.');

INSERT INTO 
	soliarquivamento (idprontuario, idarqinscrito, idarquivamento, ra, dthsoliestagiario, crpsup, confirmsup, dthsolisup, crpresp, confirmresp, crpcoord, confirmcoord, descricao) 
VALUES
	(6 , NULL, 1, 1001, '2025-06-11 11:00:00', NULL, NULL, NULL, NULL, NULL, 12345, TRUE, 'Solicitação de arquivamento para prontuário completo.'),
	(7 , 1, 2, NULL, NULL, 67890, TRUE, '2025-06-11 11:15:00', NULL, NULL, 23456, FALSE, 'Solicitação do supervisor para arquivamento do arquivo do inscrito.'),
	(8 , NULL, 3, 1002, '2025-06-11 11:30:00', 78901, FALSE, '2025-06-11 11:35:00', 60001, FALSE, 12345, TRUE, 'Estagiário e supervisor solicitam arquivamento do caso.'),
	(9 , 2, 4, NULL, NULL, NULL, NULL, NULL, 60002, TRUE, 34567, TRUE, 'Responsável técnico confirma arquivamento da documentação.'),
	(10, NULL, 5, 1003, '2025-06-11 11:45:00', 89012, TRUE, '2025-06-11 11:50:00', 60003, FALSE, 23456, FALSE, 'Solicitação de arquivamento pendente de algumas confirmações.');

INSERT INTO 
	htocorrencia (idprontuario, idarqinscrito, ra, crpsup, crpcoord, nomepessoa, faltas, justificativa, comparecimento) 
VALUES
	(6, NULL, 1001, 67890, 12345, 'João Pedro Silva', 1, 'Paciente faltou à sessão inicial de avaliação.', FALSE),
	(7, 1, 1002, 78901, 23456, 'Mariana Gomes', 0, 'Compareceu a todas as sessões agendadas.', TRUE),
	(8, NULL, 1003, 89012, 12345, 'Felipe Souza', 2, 'Faltou a duas sessões devido a problemas de saúde.', FALSE),
	(9, 2, NULL, 90123, 34567, 'Luisa Dias', 0, 'Sessões concluídas conforme o planejado.', TRUE),
	(10, NULL, 1005, 01234, 23456, 'Gabriel Alves', 1, 'Ausência devido a compromisso familiar urgente.', FALSE);
