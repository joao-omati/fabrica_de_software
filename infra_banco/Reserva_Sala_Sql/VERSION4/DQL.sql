-- Active: 1751474481388@@127.0.0.1@5432@reserva 

-- Active: 1751320626488@@127.0.0.1@5432@reserva
-- Active: 1751309244752@@127.0.0.1@5432@reserva


--Realizando o select das salas

SELECT * FROM sala;

-- Seleciona tabela saladispo
SELECT * FROM saladispo;

-- Seleciona tabela diasemana
SELECT * FROM diasemana;

--Seleciona tabela reserva
SELECT * FROM reserva;

-- REALIZANDO SELECTS EXPLORATÓRIOS

SELECT * FROM curso;

-- Realizando SELECT de 300 registros

SELECT * FROM turma
ORDER BY idturma ASC
LIMIT 500;


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
FROM reserva r -- dita que e R um apelido de reserva
LEFT JOIN saladispo sd ON r.idsaladispo = sd.idsaladispo -- dita que sd representa que SD e apelido de saladispo
LEFT JOIN sala s ON sd.idsala = s.idsala -- dita que S e um apelido para SERIALIZABLE
LEFT JOIN turma t ON r.idturma = t.idturma -- dita que T e um apelido de turma
LEFT JOIN periodo p ON sd.idsaladispo = p.idsaladispo -- dita que P e apelido da tabela periodo
LEFT JOIN diasemana d ON r.idreserva = d.idreserva -- dita que D e apelido da tabela diasemana
WHERE r.status = TRUE AND r.situacao = TRUE;


-- Seleciona as salas dispo mostra os dias da semana que ela está livre , e em qual periodo
SELECT * FROM reserva_sala;


























/*WITH combinacoes AS (
  SELECT
    s.idsala,
    s.bloco,
    s.numerosala,
    sd.idsaladispo,
    p.idperiodo,
    p.primeiro,
    p.segundo,
    p.terceiro,
    p.quarto,
    p.integral,
    d.iddiasemana,
    d.segunda,
    d.terca,
    d.quarta,
    d.quinta,
    d.sexta,
    d.sabado,
    d.domingo
  FROM sala s
  JOIN saladispo sd ON s.idsala = sd.idsala
  JOIN periodo p ON p.idsaladispo = sd.idsaladispo
  JOIN reserva r ON r.idsaladispo = sd.idsaladispo AND r.status = TRUE AND r.situacao = TRUE
  JOIN diasemana d ON d.idreserva = r.idreserva
)
SELECT
  c.idsala,
  c.bloco,
  c.numerosala,
  c.idperiodo,
  unnest(ARRAY[
    CASE WHEN c.segunda = FALSE THEN 'Segunda' ELSE NULL END,
    CASE WHEN c.terca = FALSE THEN 'Terça' ELSE NULL END,
    CASE WHEN c.quarta = FALSE THEN 'Quarta' ELSE NULL END,
    CASE WHEN c.quinta = FALSE THEN 'Quinta' ELSE NULL END,
    CASE WHEN c.sexta = FALSE THEN 'Sexta' ELSE NULL END,
    CASE WHEN c.sabado = FALSE THEN 'Sábado' ELSE NULL END,
    CASE WHEN c.domingo = FALSE THEN 'Domingo' ELSE NULL END
  ]) AS dia_livre
FROM combinacoes c
WHERE (
    NOT c.segunda OR NOT c.terca OR NOT c.quarta OR
    NOT c.quinta OR NOT c.sexta OR NOT c.sabado OR
    NOT c.domingo
)
ORDER BY c.idsala, c.idperiodo, dia_livre;*/
