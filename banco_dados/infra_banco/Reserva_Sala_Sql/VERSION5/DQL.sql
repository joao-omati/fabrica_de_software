-- Active: 1757350708892@@127.0.0.1@5432@scp

SELECT * FROM bloco;

SELECT * FROM turma LIMIT 300;

SELECT * FROM sala;

SELECT * FROM usuario;

SELECT * FROM bloco;

SELECT * FROM curso;

SELECT * FROM diasemana;

SELECT * FROM periodo;

SELECT * 
SELECT
    r.datainicial,
    r.datafinal,
    r.codturma,
    rs.turno,
    rs.responsavel,
    rs.statusreserva,
    s.numerosala,
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
RIGHT JOIN reservasala rs ON rs.idreserva = r.idreserva
RIGHT JOIN sala s ON rs.idsala = s.idsala
RIGHT JOIN diasemana d ON rs.idreservasala = d.idreservasala
RIGHT JOIN periodo p ON rs.idreservasala = p.idreservasala
WHERE rs.statusreserva = TRUE;

SELECT * FROM vendas;

WITH dias_marcados AS (
  SELECT idreservasala, 'segunda' AS dia FROM diasemana WHERE segunda = TRUE
  UNION
  SELECT idreservasala, 'terca' FROM diasemana WHERE terca = TRUE
  UNION
  SELECT idreservasala, 'quarta' FROM diasemana WHERE quarta = TRUE
  UNION
  SELECT idreservasala, 'quinta' FROM diasemana WHERE quinta = TRUE
  UNION
  SELECT idreservasala, 'sexta' FROM diasemana WHERE sexta = TRUE
  UNION
  SELECT idreservasala, 'sabado' FROM diasemana WHERE sabado = TRUE
  UNION
  SELECT idreservasala, 'domingo' FROM diasemana WHERE domingo = TRUE
),
periodos_marcados AS (
  SELECT idreservasala, 'primeiro' AS periodo FROM periodo WHERE primeiro = TRUE
  UNION
  SELECT idreservasala, 'segundo' FROM periodo WHERE segundo = TRUE
  UNION
  SELECT idreservasala, 'terceiro' FROM periodo WHERE terceiro = TRUE
  UNION
  SELECT idreservasala, 'quarto' FROM periodo WHERE quarto = TRUE
  UNION
  SELECT idreservasala, 'integral' FROM periodo WHERE integral = TRUE
)
SELECT
    dm.idreservasala,
    dm.dia,
    pm.periodo
FROM dias_marcados dm 
JOIN periodos_marcados pm ON dm.idreservasala = pm.idreservasala;





CREATE OR REPLACE VIEW vendas AS 
SELECT
    r.datainicial,
    r.datafinal,
    r.codturma,
    rs.turno,
    rs.responsavel,
    rs.statusreserva,
    s.numerosala,
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
RIGHT JOIN reservasala rs ON rs.idreserva = r.idreserva
RIGHT JOIN sala s ON rs.idsala = s.idsala
RIGHT JOIN diasemana d ON rs.idreservasala = d.idreservasala
RIGHT JOIN periodo p ON rs.idreservasala = p.idreservasala
WHERE rs.statusreserva = TRUE;


SELECT * FROM vendas;


