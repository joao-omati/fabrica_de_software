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


	
	


