-- Active: 1751320626488@@127.0.0.1@5432@reserva
-- Active: 1751309244752@@127.0.0.1@5432@reserva


-- REALIZANDO SELECTS EXPLORATÓRIOS
SELECT * FROM curso;

-- Realizando SELECT de 300 registros
SELECT * FROM turma
ORDER BY idturma ASC
LIMIT 300;

SELECT * FROM turma WHERE codturma LIKE('ADS%');

SELECT * FROM turma WHERE codturma LIKE('ADM%');

--Select onde seleciona a turma que esta cursando e todas as turmas desse curso

SELECT
    t.dthinsert AS data_inserção_turma,
    t.periodoletivo,
    t.codturma,
    c.nomecurso,
    c.dthinsert AS data_inserção_curso
FROM 
    turma t
JOIN 
    curso c ON t.idcurso = c.idcurso;


