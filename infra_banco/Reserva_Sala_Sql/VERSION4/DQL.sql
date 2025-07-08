SELECT * FROM turma;

SELECT * FROM usuario;

SELECT * FROM sala;

SELECT * FROM curso;

SELECT * FROM reserva;

SELECT * FROM reservasala;

SELECT * FROM periodo;

SELECT * FROM diasemana;

SELECT * FROM periodo;




-- Select para verificar dados de reserva
SELECT
  r.datainicial,
  r.datafinal,
  r.codturma,
  rs.turno,
  rs.responsavel,
  rs.statusreserva,
  s.numerosala,
  s.bloco,
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
LEFT JOIN reservasala rs ON rs.idreserva = r.idreserva
LEFT JOIN sala s ON rs.idsala = s.idsala
LEFT JOIN diasemana d ON rs.idreservasala = d.idreservasala
LEFT JOIN periodo p ON rs.idreservasala = p.idreservasala
WHERE rs.statusreserva = TRUE;


-- Select dos periodos reservados
SELECT idreservasala, 'segunda' AS periodo FROM periodo WHERE primeiro = TRUE
UNION
SELECT idreservasala, 'terca' FROM periodo WHERE segundo = TRUE
UNION
SELECT idreservasala, 'quarta' FROM periodo WHERE terceiro = TRUE
UNION
SELECT idreservasala, 'quinta' FROM periodo WHERE quarto = TRUE
UNION
SELECT idreservasala, 'sexta' FROM periodo WHERE integral = TRUE

-- Select nos dias da semana reservado

SELECT idreservasala, 'segunda' AS dia FROM diasemana WHERE segunda = FALSE
UNION
SELECT idreservasala, 'terca' FROM diasemana WHERE terca = FALSE
UNION
SELECT idreservasala, 'quarta' FROM diasemana WHERE quarta = FALSE
UNION
SELECT idreservasala, 'quinta' FROM diasemana WHERE quinta = FALSE
UNION
SELECT idreservasala, 'sexta' FROM diasemana WHERE sexta = FALSE
UNION
SELECT idreservasala, 'sabado' FROM diasemana WHERE sabado = FALSE
UNION
SELECT idreservasala, 'domingo' FROM diasemana WHERE domingo = FALSE;
*/




-- CTEs para extrair dias e períodos marcados
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

-- Consulta principal unindo tudo
SELECT
  r.datainicial,
  r.datafinal,
  r.codturma,
  rs.turno,
  rs.responsavel,
  rs.statusreserva,
  s.numerosala,
  s.bloco,
  d.dia,
  p.periodo
FROM reserva r 
LEFT JOIN reservasala rs ON rs.idreserva = r.idreserva
LEFT JOIN sala s ON rs.idsala = s.idsala
LEFT JOIN dias_marcados d ON rs.idreservasala = d.idreservasala
LEFT JOIN periodos_marcados p ON rs.idreservasala = p.idreservasala
WHERE rs.statusreserva = TRUE;


