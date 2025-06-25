-- Active: 1750797472150@@127.0.0.1@5432@reserva

-- SELECT GERAL PARA EXPLORAR
SELECT * FROM public.turma;

SELECT * FROM public.assessora;

SELECT * FROM public.nti;

SELECT * FROM public.sala;



-- SELECT ESPECÍFICO PARA MAPEAMENTO DE RESERVAS COM SUAS RESPECTIVAS SALAS, HORAS E PERÍODO

SELECT 
  s.idsala,
  s.numerosala,
  s.bloco,
  s.andar,
  s.capacidade,
  s.periodo AS periodo_sala,
  s.turno AS turno_sala,
  s.disponibilidade,
  r.idreserva,
  r.diasemana,
  r.datainicial,
  r.datafinal,
  r.codturma,
  r.responsavel AS responsavel_reserva,
  r.descrição,
  a.nome AS nome_assessora,
  n.nome AS nome_nti
FROM sala s
LEFT JOIN reserva r ON s.idsala = r.idsala AND r.status = TRUE
LEFT JOIN assessora a ON r.cpfass = a.cpf
LEFT JOIN nti n ON r.cpfnti = n.cpf
ORDER BY s.idsala, r.datainicial;

-- FAZENDO UM SELECT PARA DESCOBRIR A SALA QUE FOI ATUALIZADA
SELECT *
FROM sala
WHERE numerosala = 101
  AND bloco = 'A'
  AND periodo = 'Tarde'  -- novo valor após update
  AND turno = 'Tarde'    -- novo valor após update
  AND status = TRUE;

