


SELECT * FROM diretor;

SELECT * FROM assessora;

SELECT * FROM nti;

SELECT * FROM turma;

SELECT * FROM sala;

SELECT * FROM tusala;

SELECT * FROM saladispo;

SELECT * FROM reserva;


-- filtro de salas disponiveis
SELECT * FROM saladispo
WHERE disponibilidade = TRUE;


-- filtro de salas indisponiveis
SELECT * FROM saladispo
WHERE disponibilidade = FALSE;

--Mostrando as turmas que estão nessa sala

SELECT 
    s.andar,
    s.bloco,
    s.numerosala,
    s.capacidade,
    s.tvtamanho,
    t.codturma
FROM saladispo AS sd
JOIN sala AS s ON sd.idsala = s.idsala
JOIN reserva AS r ON r.idsaladispo = sd.idsaladispo
JOIN turma AS t ON r.idturma = t.idturma;


--Mostrando as salas que não estão disponiveis e as informações necessarias para reserva-la
SELECT 
    s.andar,
    s.bloco,
    s.numerosala,
    s.capacidade,
    s.tvtamanho,
    sd.disponibilidade
FROM 
    saladispo sd
JOIN 
    sala s ON sd.idsala = s.idsala
WHERE 
    sd.disponibilidade = TRUE; -- apenas salas disponíveis



-- olhando quais turmas estão em uma sala especifica
SELECT * FROM reserva
WHERE idsaladispo = 1;

--Mostrando salas que e que tem mais de uma turma

--não consegui fazer o 4 desafio --> Obs tem que salas com turmas do mesmo curso no mesmo turno mais em período diferentes.


-- FAZENDO SELECT DE DUAS TURMAS NO MESMO PERIODO NA MESMA SALA 
SELECT
    s.numerosala AS "Numero da Sala",
    t.codturma AS "Codigo da Turma",
    r.diasemana AS "Dia da Semana",
    sd.periodo AS "Periodo",
    sd.turno AS "Turno"
FROM
    reserva r
INNER JOIN
    saladispo sd ON r.idsaladispo = sd.idsaladispo
INNER JOIN
    sala s ON sd.idsala = s.idsala
LEFT JOIN
    turma t ON r.idturma = t.idturma
WHERE numerosala = 102 AND periodo = 'Primeiro' AND diasemana = 'Terça' LIMIT 2;



-- Simulação obtebdo salas que estão reservadas 

SELECT 
    s.bloco,
    s.numerosala,
    s.capacidade,
    s.tvtamanho,
    s.datashow,
    s.andar,
    r.responsavel,
    r.situacao
FROM reserva r
INNER JOIN saladispo sd ON r.idsaladispo = sd.idsaladispo
INNER JOIN sala s ON sd.idsala = s.idsala;
