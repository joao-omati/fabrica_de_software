-- Nível intermediário, agregações e condicionais --
-- Quantos inscrito vieram de cada tipo de encaminhamento?
SELECT tipoencaminhamento,
COUNT(idfichaconvenio) AS total_de_inscritos -- Esta é uma função de agregação. Ela conta o número de linhas para cada grupo. Usar a chave primária (idfichaconvenio) é uma boa prática para garantir a contagem correta.
FROM inscritoconvenio
GROUP BY tipoencaminhamento
ORDER BY total_de_inscritos DESC;

-- Qual supervisor é responsável por quantos estagiários?
SELECT s.nome AS nome_supervisor, s.crp, COUNT(e.idestagiario) AS quantidade_estagiarios
FROM supervisor s
LEFT JOIN estagiario e ON s.crp = e.crpsup
GROUP BY s.idsupervisor, s.nome, s.crp
ORDER BY quantidade_estagiarios DESC;

-- Quais religiões tem 2 ou mais inscritos na comunidade?
SELECT religiao, COUNT(idfichacomunidade) AS total_inscritos
FROM inscritocomunidade
GROUP BY religiao
HAVING COUNT(idfichacomunidade) >= 2 -- Este é o ponto principal. O HAVING é usado para filtrar os grupos que foram criados pelo GROUP BY. Ele é aplicado depois da agregação.
A condição COUNT(idfichacomunidade) >= 2 diz: "Depois de contar os inscritos em cada grupo de religião, mostre-me apenas os grupos onde essa contagem foi 2 ou maior".
ORDER BYtotal_inscritos DESC;

-- WHERE vs HAVING
-- WHERE filtra LINHAS INDIVIDUAIS antes de qualquer agrupamento.
-- Ex: WHERE status = TRUE (remove linhas individuais que não atendem à condição).

-- HAVING filtra GRUPOS INTEIROS depois do agrupamento e da função de agregação.
-- Ex: HAVING COUNT(nomecoluna) > 1 (remove grupos inteiros que não atendem à condição).

-- Nível avançado, Subconsultas e múltiplos Joins --
-- Qual o nome de inscritos da comunidade que têm depressão e também fazem terapia indiivual adulta?

SELECT i.nomeinscrito
FROM inscritocomunidade AS i
JOIN motivoacompanhamento AS ma ON i.idfichacomunidade = ma.idfichacomunidade
JOIN tipoterapia AS tt ON i.idfichacomunidade = tt.idfichacomunidade
WHERE
    ma.depressao = TRUE AND tt.individualadt = TRUE;

-- Quais estagiários estão vinculados a inscritos diagnosticados com TEA?
SELECT DISTINCT -- DISTINCT para não repetir o nome do estagiário (se esse estagiário estiver vinculado a mais de um caso de paciente com TEA, iria aparecer mais vezes sem DISTINCT)
    e.nome AS nome_estagiario,
    e.ra
FROM estagiario AS e
JOIN escolheins AS ei ON e.idestagiario = ei.idestagiario
JOIN pcdsnd AS p ON ei.idfichacomunidade = p.idfichacomunidade
WHERE
    p.dfa = TRUE;

--Consulta buscando dados da tabela inscritocomunidade com a tabela endereco, onde o nome do inscrito é Lucas Martins Lima
SELECT i.nomeinscrito, e.cidade, e.rua, e.uf, e.cep
FROM inscritocomunidade AS i
JOIN endereco AS e ON e.idfichacomunidade = i.idfichacomunidade
WHERE i.nomeinscrito = 'Leonardo Barreto Cordeiro';

--Fazendo uma consulta buscando dados na tabela inscritocomunidade com a tabela tipoterapia, onde o tipo terapia vai ter a coluna "familia", "casal" ou "indiviualadt" como TRUE.
SELECT ic.nomeinscrito, ic.dtnascimento, ic.identidadegenero, ic.religiao, 
ic.dthinscricao, t.familia, t.casal, t.individualadt 
FROM inscritocomunidade AS ic 
JOIN tipoterapia AS t ON ic.idfichacomunidade = t.idfichacomunidade
WHERE
	t.casal = TRUE OR
	t.familia = TRUE OR
	t.individualadt = TRUE;

-- Fazendo uma consulta na tabela de pcdsnd com tablea de inscritocomunidade, se a pessoa tiver tea ou dfa com TRUE, ela aparecerá
SELECT ic.nomeinscrito, ic.emailinscrito, ic.etnia, ic.status, p.tea, p.dfa
FROM inscritocomunidade AS ic
JOIN pcdsnd AS p ON ic.idfichacomunidade = p.idfichacomunidade
WHERE 
	p.tea = TRUE OR
	p.dfa = TRUE;

-- Fazendo uma consulta na tabela de inscritocomunidade com a tabela motivo acompanhmento, onde todoas as colunas em WHERE precisam ser TRUE
SELECT i.nomeinscrito, i.religiao, i.estadocivilinscrito, i.etnia, ma.tristeza, ma.chorofc, ma.depressao
FROM inscritocomunidade AS i
JOIN motivoacompanhamento AS ma ON ma.idfichacomunidade = i.idfichacomunidade
WHERE 
	ma.tristeza = TRUE AND
	ma.chorofc = TRUE AND
	ma.depressao = TRUE;

-- Uma consulta parecida com a de cima, mas com 4 tabelas. A diferença é que agora tem mais duas tabelas envolvidas, então ao invés de trazer os mesmos dados, é necessário que o registro esteja também nas outras duas tabelas adicionas 'tipoterapia' e 'pcdsnr'
SELECT i.nomeinscrito, i.religiao, i.estadocivilinscrito, i.etnia, ma.tristeza, ma.chorofc, tt.familia, tt.individualadt, pcd.dfa 
FROM inscritocomunidade AS i
JOIN motivoacompanhamento AS ma ON ma.idfichacomunidade = i.idfichacomunidade
JOIN tipoterapia AS tt ON tt.idfichacomunidade = i.idfichacomunidade
JOIN pcdsnd AS pcd ON pcd.idfichacomunidade = i.idfichacomunidade
WHERE 
	(ma.tristeza = TRUE OR ma.chorofc = TRUE)
	OR  
	(pcd.dfa = TRUE OR tt.familia = TRUE OR tt.individualadt = TRUE);

-- Dados dos inscritos da comunidade que moram em Samambaia ou Ceilândia
SELECT i.nomeinscrito, i.emailinscrito, e.cidade
FROM inscritocomunidade AS i
JOIN endereco AS e ON i.idfichacomunidade=e.idfichacomunidade
WHERE
    i.idfichacomunidade IN (
        SELECT idfichacomunidade
        FROM endereco
        WHERE cidade IN ('Samambaia', 'Ceilândia')
    );


	


	
	


