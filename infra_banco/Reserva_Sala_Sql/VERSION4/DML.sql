-- Active: 1751392827437@@127.0.0.1@5432@reserva
-- Active: 1751320881998@@127.0.0.1@5432@reserva 

-- Active: 1751320626488@@127.0.0.1@5432@reserva
-- Active: 1751309244752@@127.0.0.1@5432@reserva

-- USER UM CÓDIGO EM PYTHON PARA INSERIR TODAS AS TURMAS DE UM ARQUIVO.EXEL NESTE CAMINHO: "C:\fabrica_de_software\Reserva_Sala_Sql\VERSION4\importar_dados.py"

-- Active: 1751309244752@@127.0.0.1@5432@reserva 

-- INSERINDO REGISTROS NA ENTIDADE CURSO

INSERT INTO public.curso (nomecurso)
VALUES
('ADMINISTRAÇÃO'),
('ANÁLISE E DESENVOLVIMENTO DE SISTEMAS'),
('ARQUITETURA E URBANISMO'),
('BIOMEDICINA'),
('DIREITO'),
('EDUCAÇÃO FÍSICA'),
('ENFERMAGEM'),
('FARMÁCIA'),
('FISIOTERAPIA'),
('NUTRIÇÃO'),
('ODONTOLOGIA'),
('PSICOLOGIA'),
('SISTEMAS DE INFORMAÇÃO');


-- FAZENDO O RELACIONAMENTO ENTRE CURSO E TURMA

-- ANALISE DE DESENVOLVIMENTO DE SISTEMAS ADS para os códigos de turmas que começa com ADM
UPDATE turma SET idcurso = 1 WHERE codturma ILIKE('ADM%');

-- ANALISE DE DESENVOLVIMENTO DE SISTEMAS ADS para os códigos de turmas que começa com ADS
UPDATE turma SET idcurso = 2 WHERE codturma ILIKE('ADS%');

UPDATE turma SET idcurso = 3 WHERE codturma ILIKE('AUR%');

UPDATE turma SET idcurso = 4 WHERE codturma ILIKE('BIO%');

UPDATE turma SET idcurso = 5 WHERE codturma ILIKE('DIR%');

UPDATE turma SET idcurso = 6 WHERE codturma ILIKE('EFB%');

UPDATE turma SET idcurso = 7 WHERE codturma ILIKE('ENF%');

UPDATE turma SET idcurso = 8 WHERE codturma ILIKE('FAR%');

UPDATE turma SET idcurso = 9 WHERE codturma ILIKE('FIS%');

UPDATE turma SET idcurso = 10 WHERE codturma ILIKE('NUT%');

UPDATE turma SET idcurso = 11 WHERE codturma ILIKE('ODO%');

UPDATE turma SET idcurso = 12 WHERE codturma ILIKE('PSI%');

UPDATE turma SET idcurso = 13 WHERE codturma ILIKE('SIN%');


-- DELETANDO TODOS OS DADOS DA TABELA TURMA PARA RESETAR O ID
TRUNCATE TABLE turma RESTART IDENTITY CASCADE;

--Insert na tabela usuario
INSERT INTO public.usuario (matricula,nome,emailinst,sexo,cargo,senha)
VALUES(
    82744,
    'Carla Souza',
    'carla.souza82744@unieuro.com.br',
    'F',
    'Diretor',
    '1234567'   
);

INSERT INTO public.usuario (matricula,nome,emailinst,sexo,cargo,senha)
VALUES(
    876546,
    'Pedro Durães',
    'pedro87654@unieuro.com.br',
    'M',
    'Diretor',
   MD5 ('fefererefe')   
);

INSERT INTO public.usuario (matricula,nome,emailinst,sexo,cargo,senha)
VALUES(
    123456,
    'Daniela Braga',
    'dani123456@unieuro.com.br',
    'F',
    'Assessora',
   MD5 ('DANI5647')   
);

INSERT INTO public.usuario (matricula,nome,emailinst,sexo,cargo,senha)
VALUES(
    98765,
    'Rafaela Oliveira',
    'rafaela98765@unieuro.com.br',
    'F',
    'Assessora',
   MD5 ('rafagatinha')   
);

INSERT INTO public.usuario (matricula,nome,emailinst,sexo,cargo,senha)
VALUES(
    82205,
    'Luna Stella',
    'luna082205@unieuro.com.br',
    'F',
    'Coordenador',
   MD5 ('jhonsnow')   
);

INSERT INTO public.usuario (matricula,nome,emailinst,sexo,cargo,senha)
VALUES(
    050809,
    'Davi Cabral',
    'davi050809@unieuro.com.br',
    'M',
    'Coordenador',
   MD5 ('davizinmlk')   
);

INSERT INTO public.usuario (matricula,nome,emailinst,sexo,cargo,senha)
VALUES(
    050902,
    'Victoria Rebecca',
    'vic050902@unieuro.com.br',
    'F',
    'NAPI',
   MD5 ('victrg')   
);

INSERT INTO public.usuario (matricula,nome,emailinst,sexo,cargo,senha)
VALUES(
    456789,
    'Vinicius Caetano',
    'vinicius456789@unieuro.com.br',
    'M',
    'NAPI',
   MD5 ('asssiscaetano')   
);

INSERT INTO public.usuario (matricula,nome,emailinst,sexo,cargo,senha)
VALUES(
   220590,
    'Mateus Cardoso',
    'mateus220590unieuro.com.br',
    'M',
    'Manutenção',
   MD5 ('mateusmenor')   
);

INSERT INTO public.usuario (matricula,nome,emailinst,sexo,cargo,senha)
VALUES(
   2202202,
    'Gabriel Rangel',
    'gabriel2202202unieuro.com.br',
    'M',
    'Manutenção',
   MD5 ('rangelzindelaas')   
);

INSERT INTO public.usuario (matricula,nome,emailinst,sexo,cargo,senha)
VALUES(
   876790,
    'Stevan Gutemberg',
    'stevan876790unieuro.com.br',
    'M',
    'NTI',
   MD5 ('negodoce')   
);

INSERT INTO public.usuario (matricula,nome,emailinst,sexo,cargo,senha)
VALUES(
   181217,
    'Duda Maria',
    'maria181217unieuro.com.br',
    'F',
    'NTI',
   MD5 ('valepbo')   
);

INSERT INTO sala (bloco,tvtamanho,capacidade,andar,numerosala)
VALUES(
    'B',
    50,
    40,
    '2',
    316
)

INSERT INTO sala (bloco, tvtamanho, capacidade, andar, numerosala)
VALUES
('A', 42, 30, 1, 101),
('C', 65, 60, 3, 305),
('D', 55, 50, 2, 210),
('E', 32, 25, 1, 110),
('A', 75, 80, 4, 401);

INSERT INTO sala (bloco, tvtamanho, capacidade, andar, numerosala, datashow)
VALUES ('F', 60, 45, 2, 215, true);


