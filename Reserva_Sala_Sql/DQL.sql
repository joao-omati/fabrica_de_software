-- SELECT PADRÃO 

SELECT * FROM assessora;
SELECT * FROM public.nti;
SELECT * FROM turma LIMIT 200;
SELECT * FROM public.sala;
SELECT * FROM public.tursala;
SELECT * FROM public.reserva;


-- SELECT COM INNER JOIN

SELECT 
    sl.andar AS "Andar Sala",
    sl.numerosala AS "Número da Sala",
    tm.codturma AS "Código da Turma",
    tm.periodoletivo AS "Período Letivo da Turma",
    sl.situacao AS "Situação"
FROM 
    public.sala AS sl
INNER JOIN 
    public.tursala ON tursala.idsala = sl.idsala
INNER JOIN 
    public.turma AS tm ON tm.idturma = tursala.idturma;





