-- Active: 1751320881998@@127.0.0.1@5432@reserva 

-- Active: 1751309244752@@127.0.0.1@5432@reserva


-- USER UM CÓDIGO EM PYTHON PARA INSERIR TODAS AS TURMAS DE UM ARQUIVO.EXEL NESTE CAMINHO: "C:\fabrica_de_software\Reserva_Sala_Sql\VERSION4\importar_dados.py"

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
