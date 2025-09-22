-- Active: 1757070480709@@127.0.0.1@5432@scp

--Insert na tabela usuario 
INSERT INTO usuario (matricula, matriculauser, nome, emailinst, sexo, cargo, senha) 
VALUES
(94147, NULL, 'Vitor', 'vitor94147@unieuro.com.br', 'M', 'Diretor', 133122),
(99146, NULL, 'Viceleno', 'viceleno099146@unieuro.com.br', 'F', 'Assessora', 123789),
(12345, NULL, 'Arthur', 'arthur012345@unieuro.com.br', 'M', 'Coordenador', 987321),
(21253, NULL, 'ellen', 'ellen021253@unieuro.com.br', 'F', 'Secretaria', 987654),
(78982, NULL, 'João', 'joao078982@unieuro.com.br', 'M', 'NAPI', 789456),
(34879, NULL, 'Paulo', 'paulo034879@unieuro.com.br', 'M', 'NTI', 456789),
(41456, NULL, 'Corno', 'corno041456@unieuro.com.br', 'F', 'Manutenção', 123456);

--Insert na tabela bloco

INSERT INTO bloco (nomebloco)
VALUES
('A'),
('B'),
('C');

-- Insert na tabela sala

INSERT INTO sala (matriculauser, nomebloco, numerosala, capacidade, tvtamanho, datashow)
VALUES
(94147,'C', 102, 50, '55" ', FALSE),
(94147,'C', 202, 60, '55" ', FALSE),
(94147,'B', 104, 65, '60" ', FALSE),
(94147,'B', 204, 75, '70"', FALSE),
(94147,'A', 106, 90, '70"', FALSE),
(94147,'A', 206, 110, '0"', TRUE);

--Insert into na tabela curso

INSERT INTO curso (nomecurso)
VALUES
('ADMINISTRAÇÃO'),
('ANÁLISE E DESENVOLVIMENTO DE SISTEMAS'),
('ARQUITETURA E URBANISMO'),
('BIOMEDICINA'),
('DIREITO'),
('EDUCAÇÃO FÍSICA'),
('ENFERMAGEM'),
('FARMÁCIA'),
('FISIOTERAPIA'),
('NUTRIÇÃO'),
('ODONTOLOGIA'),
('PSICOLOGIA'),
('SISTEMAS DE INFORMAÇÃO');




-- ANALISE DE DESENVOLVIMENTO DE SISTEMAS ADS para os códigos de turmas que começa com ADM
UPDATE turma SET idcurso = 1 WHERE codturma ILIKE('ADM%');
UPDATE turma SET idcurso = 2 WHERE codturma ILIKE('ADS%');

UPDATE turma SET idcurso = 3 WHERE codturma ILIKE('AUR%');

UPDATE turma SET idcurso = 4 WHERE codturma ILIKE('BIO%');

UPDATE turma SET idcurso = 5 WHERE codturma ILIKE('DIR%');

UPDATE turma SET idcurso = 6 WHERE codturma ILIKE('EFB%');

UPDATE turma SET idcurso = 7 WHERE codturma ILIKE('ENF%');

UPDATE turma SET idcurso = 8 WHERE codturma ILIKE('FAR%');

UPDATE turma SET idcurso = 9 WHERE codturma ILIKE('FIS%');

UPDATE turma SET idcurso = 10 WHERE codturma ILIKE('NUT%');

UPDATE turma SET idcurso = 11 WHERE codturma ILIKE('ODO%');

UPDATE turma SET idcurso = 12 WHERE codturma ILIKE('PSI%');

UPDATE turma SET idcurso = 13 WHERE codturma ILIKE('SIN%');


-- simulação de reserva 
--tabela reserva
INSERT INTO reserva (matriculauser, codturma, datainicial, datafinal)
VALUES 
(94147, 'ADS02N1', '2025-08-11', '2025-11-30')
RETURNING idreserva;

--tabela reserva sala 
INSERT INTO reservasala (idreserva, idsala, turno, responsavel)
VALUES (2, 2, 'Noite', 'VICELENO') -- turno informado para consistência, mesmo sem períodos
RETURNING idreservasala;

--tabela periodo
INSERT INTO periodo (idreservasala, segundo, quarto)
VALUES (2, TRUE, TRUE)
RETURNING idperiodo;

--tabela diasemana
INSERT INTO diasemana (idreservasala, idperiodo, segunda, terca)
VALUES (2, 1, TRUE, TRUE);