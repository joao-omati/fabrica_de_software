--Consultando as Tabelas
SELECT * FROM inscritoconvenio;
SELECT * FROM inscritocomunidade;
SELECT * FROM endereco;
SELECT * FROM medicamento;
SELECT * FROM tipoterapia;
SELECT * FROM pcdsnd;
SELECT * FROM doencafisica;
SELECT * FROM disponibilidade;
SELECT * FROM coordenador;
SELECT * FROM supervisor;
SELECT * FROM secretaria;
SELECT * FROM resptec;
SELECT * FROM estagiario;
SELECT * FROM escolheins;
SELECT * FROM sala;
SELECT * FROM agendamento;
SELECT * FROM salaagendamento;
SELECT * FROM prontuario;
SELECT * FROM folhaevo;
SELECT * FROM fichafreqest;
SELECT * FROM anamnese;
SELECT * FROM laudomed;
SELECT * FROM arqinscrito;
SELECT * FROM arquivamento;
SELECT * FROM soliarquivamento;
SELECT * FROM htocorrencia;	

SELECT i.nomeinscrito, e.cidade, e.rua, e.uf, e.cep
FROM inscritocomunidade as i
JOIN endereco as e ON e.idfichacomunidade = i.idfichacomunidade
WHERE i.nomeinscrito = 'Leonardo Barreto Cordeiro';

Select ic.nomeinscrito, ic.nomeresp, ic.tellcellresp, ic.cpfinscrito, e.cidade, e.rua, e.uf, e.cep
FROM inscritocomunidade as ic 
JOIN endereco as e ON e.idfichacomunidade = ic.idfichacomunidade
WHERE ic.cpfresp = '12345678901';

--Fazendo uma consulta buscando dados na tabela inscritocomunidade com a tabela tipoterapia, onde o tipo terapia vai ter a coluna "familia", "casal" ou "indiviualadt" como TRUE.
SELECT ic.nomeinscrito, ic.dtnascimento, ic.identidadegenero, ic.religiao, 
ic.dthinscricao, t.familia, t.casal, t.individualadt 
FROM inscritocomunidade AS ic 
JOIN tipoterapia AS t ON ic.idfichacomunidade = t.idfichacomunidade
WHERE
	t.casal = TRUE OR
	t.familia = TRUE OR
	t.individualadt = TRUE;

-- Fazendo uma consulta na tabela de pcdsnd
SELECT ic.nomeinscrito, ic.emailinscrito, ic.etnia, ic.status, p.tea, p.dfa
FROM inscritocomunidade AS ic
JOIN pcdsnd AS p ON ic.idfichacomunidade = p.idfichacomunidade
WHERE 
	p.tea = TRUE OR
	p.dfa = TRUE;
