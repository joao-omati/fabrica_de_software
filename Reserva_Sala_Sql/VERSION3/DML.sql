-- Active: 1750984295846@@127.0.0.1@5432@reserva


--inserindo direto
INSERT INTO diretor (cpf, nome, email, senha)
VALUES
('54298922111', 'Vitor', 'vitortest@unieuro.com.br', md5('123456'));

--Inserindo diretor como se outro diretor o cria-se
INSERT INTO diretor (cpf, copfdt, nome, email, senha)
VALUES
('36578686070','54298922111', 'guilherme', 'guitest@unieuro.com.br', '987654');

--update para testar delete logico
UPDATE diretor
SET status = FALSE
WHERE iddiretor = 2;

-- Inserindo algumas assessora

INSERT INTO assessora (cpfdt, nome, cpf, email, senha)
VALUES
('54298922111', 'viceleno', '43895804002', 'vicelenotest@unieuro.com.br', MD5('654321')),
('54298922111', 'shoji', '56415128000', 'shojitest@unieuro.com.br', MD5('789456'));


--insert de nti
insert into nti (cpfnti, nome, cpf, email, senha)
VALUES
(NULL, 'joão', '52312627060', 'joãotest@unieuro.com.br', md5('123456') ),
('52312627060', ' adriano', '94621393006' ,'joãotest@unieuro.com.br', '286422'),
('52312627060', ' gustavo', '21697117082' ,'joãotest@unieuro.com.br', '456789');

--Insert turmas 

INSERT INTO turma (cpfnti, codturma, periodoletivo)
VALUES
('94621393006', 'ADM06N1', '2025/1'),
(NULL, 'ADS01M1', '2025/1'),
('52312627060', 'ADS02M1', '2025/1'),
('94621393006', 'FIS04N1', '2025/1'),
('21697117082', 'FIS07M1', '2025/1'),
('52312627060', 'FIS10N1', '2025/1'),
(NULL, 'NUT03N1', '2025/1'),
('94621393006', 'ODO01I1', '2025/1'),
('21697117082', 'ODO01N1', '2025/1'),
(NULL, 'PSI08M1', '2025/1'),
('52312627060', 'PSI08N1', '2025/1'),
(NULL, 'PSI10M1', '2025/1'),
('52312627060', 'SIN05M1', '2025/1'),
(NULL, 'SIN06N1', '2025/1'),
('21697117082', 'SIN08N1', '2025/1');


-- Prenchimento da tabela salas
INSERT INTO sala (
    cpfnti, bloco, tvtamanho, datashow, capacidade, andar, numerosala, status
)
VALUES
('52312627060', 'C', NULL, TRUE, 80, '1ª andar', 102, TRUE),
('94621393006', 'B', 55, FALSE, 50, '2ª andar', 211, TRUE),
('94621393006', 'B', 55, FALSE, 50, '3ª andar', 307, TRUE),
('52312627060', 'C', 55, FALSE, 50, '2ª andar', 204, TRUE),
('21697117082', 'B', NULL, TRUE, 180, '1ª andar', 112, TRUE),
('94621393006', 'D', NULL, TRUE, 50, 'Térreo', 1, TRUE),
('52312627060', 'A', 55, TRUE, 50, 'Térreo', 2, TRUE),
('52312627060', 'B', NULL, TRUE, 180, 'Térreo', 100, TRUE),
('94621393006', 'C', NULL, TRUE, 50, '1º Andar', 101, TRUE),
('21697117082', 'E', 65, TRUE, 80, '2º Andar', 208, TRUE),
('21697117082', 'C', NULL, FALSE, 50, '3º Andar', 303, TRUE),
('52312627060', 'D', 55, TRUE, 50, '3º Andar', 312, TRUE),
('52312627060', 'F', 55, TRUE, 75, '1º Andar', 103, TRUE);


--insert tursala (obs: quando for testa e importante verificar os id que ta na sua tabela, pois o serial e continuo.)
INSERT INTO tusala (idsala,idturma)
VALUES
(1,5),
(10,11),
(8,6),
(13,3),
(5,15);

--Insert na tabela saladispo

INSERT INTO saladispo (idsala, periodo, turno)
VALUES
(1, 'Primeiro', 'Manhã'), (1, 'Primeiro', 'Tarde'), (1, 'Primeiro', 'Noite'),
(2, 'Primeiro', 'Manhã'), (2, 'Primeiro', 'Tarde'), (2, 'Primeiro', 'Noite'),
(3, 'Primeiro', 'Manhã'), (3, 'Primeiro', 'Tarde'), (3, 'Primeiro', 'Noite'),
(4, 'Primeiro', 'Manhã'), (4, 'Primeiro', 'Tarde'), (4, 'Primeiro', 'Noite'),
(5, 'Primeiro', 'Manhã'), (5, 'Primeiro', 'Tarde'), (5, 'Primeiro', 'Noite'),
(6, 'Primeiro', 'Manhã'), (6, 'Primeiro', 'Tarde'), (6, 'Primeiro', 'Noite'),
(7, 'Primeiro', 'Manhã'), (7, 'Primeiro', 'Tarde'), (7, 'Primeiro', 'Noite'),
(8, 'Primeiro', 'Manhã'), (8, 'Primeiro', 'Tarde'), (8, 'Primeiro', 'Noite'),
(9, 'Primeiro', 'Manhã'), (9, 'Primeiro', 'Tarde'), (9, 'Primeiro', 'Noite'),
(10, 'Primeiro', 'Manhã'), (10, 'Primeiro', 'Tarde'), (10, 'Primeiro', 'Noite');

INSERT INTO saladispo (idsala, periodo, turno)
VALUES
(1, 'Segundo', 'Manhã'), (1, 'Segundo', 'Tarde'), (1, 'Segundo', 'Noite'),
(2, 'Segundo', 'Manhã'), (2, 'Segundo', 'Tarde'), (2, 'Segundo', 'Noite'),
(3, 'Segundo', 'Manhã'), (3, 'Segundo', 'Tarde'), (3, 'Segundo', 'Noite'),
(4, 'Segundo', 'Manhã'), (4, 'Segundo', 'Tarde'), (4, 'Segundo', 'Noite'),
(5, 'Segundo', 'Manhã'), (5, 'Segundo', 'Tarde'), (5, 'Segundo', 'Noite'),
(6, 'Segundo', 'Manhã'), (6, 'Segundo', 'Tarde'), (6, 'Segundo', 'Noite'),
(7, 'Segundo', 'Manhã'), (7, 'Segundo', 'Tarde'), (7, 'Segundo', 'Noite'),
(8, 'Segundo', 'Manhã'), (8, 'Segundo', 'Tarde'), (8, 'Segundo', 'Noite'),
(9, 'Segundo', 'Manhã'), (9, 'Segundo', 'Tarde'), (9, 'Segundo', 'Noite'),
(10, 'Segundo', 'Manhã'), (10, 'Segundo', 'Tarde'), (10, 'Segundo', 'Noite');

INSERT INTO saladispo (idsala, periodo, turno)
VALUES
(1, 'ambos', 'Manhã'), (1, 'ambos', 'Tarde'), (1, 'ambos', 'Noite'),
(2, 'ambos', 'Manhã'), (2, 'ambos', 'Tarde'), (2, 'ambos', 'Noite'),
(3, 'ambos', 'Manhã'), (3, 'ambos', 'Tarde'), (3, 'ambos', 'Noite'),
(4, 'ambos', 'Manhã'), (4, 'ambos', 'Tarde'), (4, 'ambos', 'Noite'),
(5, 'ambos', 'Manhã'), (5, 'ambos', 'Tarde'), (5, 'ambos', 'Noite'),
(6, 'ambos', 'Manhã'), (6, 'ambos', 'Tarde'), (6, 'ambos', 'Noite'),
(7, 'ambos', 'Manhã'), (7, 'ambos', 'Tarde'), (7, 'ambos', 'Noite'),
(8, 'ambos', 'Manhã'), (8, 'ambos', 'Tarde'), (8, 'ambos', 'Noite'),
(9, 'ambos', 'Manhã'), (9, 'ambos', 'Tarde'), (9, 'ambos', 'Noite'),
(10, 'ambos', 'Manhã'), (10, 'ambos', 'Tarde'), (10, 'ambos', 'Noite');



--fazendo reservas 

INSERT INTO reserva(cpfnti, idsaladispo, codturma, diasemana, datainicial, datafinal, responsavel)
VALUES
('21697117082', 1,'ADS07M1', 'seg,ter,quarta', '02-02-2025', '05-05-2025', 'vitor'),
('21697117082', 31,'ADS02M1', 'seg,quarta,sexta', '02-03-2025', '02-05-2025','guilherme'),
('21697117082', 5,'PSI08M1', 'ter,quin,sexta', '12-02-2025', '12-05-2025','viceleno'),
('21697117082', 45,'PSI10M1', 'seg,quin,sexta', '19-02-2025','19-05-2025','athur'),
('21697117082', 6, 'SIN05M1', 'seg,ter,quart' , '12-03-2025', '12-05-2025','paulo'),
('21697117082', 7, 'FIS04N1','semanha toda', '11-03-2025', '11-05-2025','mario');--quando for null e para ambos os periodos a reserva



INSERT INTO reserva(cpfnti, idsaladispo, codturma, diasemana, datainicial, datafinal, responsavel)
VALUES
('21697117082', 19,'ADS06M1', 'seg,ter,quarta', '06-02-2025', '05-06-2025', 'vitor'),
('21697117082', 49,'ADS03M1', 'seg,quarta,sexta', '12-03-2025', '02-05-2025','guilherme');


49,19
UPDATE saladispo
SET disponibilidade = FALSE
WHERE idsaladispo in (1,31,5,45,5,7,10,13,15,9,6,42,17,41,48,59,60,64,61,62);



