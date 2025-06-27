


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
    sd.disponibilidade
FROM 
    saladispo sd
JOIN 
    sala s ON sd.idsala = s.idsala
WHERE 
    sd.disponibilidade = TRUE;


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




