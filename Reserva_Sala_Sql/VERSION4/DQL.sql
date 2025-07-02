-- Active: 1751474481388@@127.0.0.1@5432@reserva
-- Active: 1751309244752@@127.0.0.1@5432@reserva

-- Selecionando os usuarios

SELECT * FROM usuario;

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

--Realizando o select das salas

SELECT * FROM sala;

-- Seleciona tabela saladispo
SELECT * FROM saladispo;

-- Seleciona tabela diasemana
SELECT * FROM diasemana;

--Seleciona tabela reserva
SELECT * FROM reserva;



-- Retorno para saber salas reservadas
SELECT
  r.datainicial,
  r.datafinal,
  sd.turno,
  sd.idsaladispo,
  s.bloco,
  s.numerosala,
  s.andar,
  t.codturma,
  t.periodoletivo,
  p.primeiro,
  p.segundo,
  p.terceiro,
  p.quarto,
  p.integral,
  d.segunda,
  d.terca,
  d.quarta,
  d.quinta,
  d.sexta,
  d.sabado,
  d.domingo
FROM reserva r
LEFT JOIN saladispo sd ON r.idsaladispo = sd.idsaladispo
LEFT JOIN sala s ON sd.idsala = s.idsala
LEFT JOIN turma t ON r.idturma = t.idturma
LEFT JOIN periodo p ON sd.idsaladispo = p.idsaladispo
LEFT JOIN diasemana d ON r.idreserva = d.idreserva
WHERE r.status = TRUE AND r.situacao = TRUE;



