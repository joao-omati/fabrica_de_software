-- Active: 1751377694609@@127.0.0.1@5432@reserva
-- Active: 1751309244752@@127.0.0.1@5432@reserva

-- USER UM CÓDIGO EM PYTHON PARA INSERIR TODAS AS TURMAS DE UM ARQUIVO.EXEL NESTE CAMINHO: "C:\fabrica_de_software\Reserva_Sala_Sql\VERSION4\importar_dados.py"

-- Active: 1751309244752@@127.0.0.1@5432@reserva 

-- INSERINDO REGISTROS NA ENTIDADE CURSO

INSERT INTO public.curso (nomecurso)
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


-- FAZENDO O RELACIONAMENTO ENTRE CURSO E TURMA

-- ANALISE DE DESENVOLVIMENTO DE SISTEMAS ADS para os códigos de turmas que começa com ADM
UPDATE turma SET idcurso = 1 WHERE codturma ILIKE('ADM%');

-- ANALISE DE DESENVOLVIMENTO DE SISTEMAS ADS para os códigos de turmas que começa com ADS
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


-- DELETANDO TODOS OS DADOS DA TABELA TURMA PARA RESETAR O ID
TRUNCATE TABLE turma RESTART IDENTITY CASCADE;

--Insert na tabela sala, obs: como tvtamanho não permitir null e quando tem datashow não tem tv coloquei tvtamanho como zero e true em datashow 

INSERT INTO sala (
    bloco, tvtamanho, datashow, capacidade, andar, numerosala, status
)
VALUES
( 'C', 0, TRUE, 80, '1ª andar', 102, TRUE),
( 'B', 55, FALSE, 50, '2ª andar', 211, TRUE),
( 'B', 55, FALSE, 50, '3ª andar', 307, TRUE),
( 'C', 55, FALSE, 50, '2ª andar', 204, TRUE),
( 'B', 0, TRUE, 180, '1ª andar', 112, TRUE),
( 'D', 0, TRUE, 50, 'Térreo', 1, TRUE),
( 'A', 55, TRUE, 50, 'Térreo', 2, TRUE),
( 'B', 0, TRUE, 180, 'Térreo', 100, TRUE),
( 'C', 0, TRUE, 50, '1º Andar', 101, TRUE),
( 'E', 65, TRUE, 80, '2º Andar', 208, TRUE),
( 'C', 0, FALSE, 50, '3º Andar', 303, TRUE),
( 'D', 55, TRUE, 50, '3º Andar', 312, TRUE),
( 'F', 55, TRUE, 75, '1º Andar', 103, TRUE),
( 'C', 65, TRUE, 90, '3º Andar', 316, TRUE),
( 'D', 55, TRUE, 50, '3º Andar', 301, TRUE),
( 'D', 55, TRUE, 50, '3º Andar', 303, TRUE),
( 'D', 65, TRUE, 110, '3º Andar', 304, TRUE),
( 'D', 55, TRUE, 50, '3º Andar', 305, TRUE);



