-- Active: 1751320881998@@127.0.0.1@5432@reserva 

-- Active: 1751309244752@@127.0.0.1@5432@reserva


-- REALIZANDO SELECTS EXPLORATÓRIOS
SELECT * FROM curso;

-- Realizando SELECT de 300 registros
SELECT * FROM turma
ORDER BY idturma ASC
LIMIT 300;

SELECT * FROM turma WHERE codturma LIKE('ADS%');

SELECT * FROM turma WHERE codturma LIKE('ADM%');


