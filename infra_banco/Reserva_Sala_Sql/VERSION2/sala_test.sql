-- Active: 1750871648690@@127.0.0.1@5432@reserva
SELECT * FROM public.sala; --Para verificar se o insert deu certo
 
 SELECT * FROM sala LIMIT 10000;

-- Select para poder mostra somente o que vai mostra na tela da secretaria

SELECT bloco, tvtamanho, disponibilidade, capacidade, numerosala, andar, status
FROM sala;

-- Com cpfnti nulo, para fazer o update do cpf.

INSERT INTO sala (bloco, tvtamanho, disponibilidade, capacidade, andar, numerosala, periodo, turno, status) VALUES
('A', 50, TRUE, 30, '1º Andar', 101, 'Primeiro', 'manhã', TRUE),
('A', 55, TRUE, 40, '1º Andar', 102, 'Segundo', 'tarde', TRUE),
('B', 60, TRUE, 35, '2º Andar', 201, 'Primeiro', 'tarde', TRUE),
('B', 50, TRUE, 25, '2º Andar', 202, 'Segundo', 'noturno', TRUE),
('C', 55, TRUE, 45, '3º Andar', 301, 'Primeiro', 'manhã', TRUE),
('C', 60, TRUE, 30, '3º Andar', 302, 'Segundo', 'noturno', TRUE),
('D', 50, TRUE, 20, '4º Andar', 401, 'Primeiro', 'noturno', TRUE),
('D', 55, TRUE, 50, '4º Andar', 402, 'Segundo', 'manhã', TRUE),
('E', 60, TRUE, 35, '5º Andar', 501, 'Primeiro', 'tarde', TRUE),
('E', 50, TRUE, 40, '5º Andar', 502, 'Segundo', 'tarde', TRUE),
('F', 65, TRUE, 30, '6º Andar', 601, 'Primeiro', 'manhã', TRUE),
('F', 55, TRUE, 35, '6º Andar', 602, 'Segundo', 'tarde', TRUE),
('G', 70, TRUE, 45, '7º Andar', 701, 'Primeiro', 'noturno', TRUE),
('G', 60, TRUE, 20, '7º Andar', 702, 'Segundo', 'manhã', TRUE),
('H', 55, TRUE, 50, '8º Andar', 801, 'Primeiro', 'tarde', TRUE),
('H', 65, TRUE, 25, '8º Andar', 802, 'Segundo', 'noturno', TRUE),
('I', 50, TRUE, 30, '9º Andar', 901, 'Primeiro', 'manhã', TRUE),
('I', 60, TRUE, 40, '9º Andar', 902, 'Segundo', 'tarde', TRUE),
('J', 75, TRUE, 55, '10º Andar', 1001, 'Primeiro', 'noturno', TRUE),
('J', 65, TRUE, 35, '10º Andar', 1002, 'Segundo', 'manhã', TRUE);

-- insert cpf em algumas salas que foi inserido sem cpfnti.

UPDATE sala
SET cpfnti = '99900011122'
WHERE idsala IN (22, 28, 25, 24);

--inserindo com cpfnti 

INSERT INTO sala 
(cpfnti, bloco, tvtamanho, disponibilidade, capacidade, andar, numerosala, periodo, turno, status) 
VALUES
('11122233344', 'A', 50, TRUE, 30, '1º Andar', 101, 'Primeiro', 'manhã', TRUE),
('22233344455', 'A', 55, TRUE, 40, '1º Andar', 101, 'Segundo', 'tarde', TRUE),
('33344455566', 'B', 60, TRUE, 35, '2º Andar', 201, 'Primeiro', 'tarde', TRUE),
('44455566677', 'B', 50, TRUE, 25, '2º Andar', 201, 'Segundo', 'noturno', TRUE),
('55566677788', 'C', 55, TRUE, 45, '3º Andar', 301, 'Primeiro', 'manhã', TRUE),
('66677788899', 'C', 60, TRUE, 30, '3º Andar', 301, 'Segundo', 'noturno', TRUE),
('77788899900', 'D', 50, TRUE, 20, '4º Andar', 401, 'Primeiro', 'noturno', TRUE),
('88899900011', 'D', 55, TRUE, 50, '4º Andar', 401, 'Segundo', 'manhã', TRUE),
('99900011122', 'E', 60, TRUE, 35, '5º Andar', 501, 'Primeiro', 'tarde', TRUE),
('00011122233', 'E', 50, TRUE, 40, '5º Andar', 501, 'Segundo', 'tarde', TRUE);

--fazendo update 

INSERT INTO sala
(cpfnti, bloco, disponibilidade, capacidade, andar, numerosala, periodo, turno, status)
VALUES
('11122233344', 'B', TRUE , 50, '3º Anadar', 213, 'Primeiro', 'noturno', TRUE),
('22233344455', 'C', TRUE , 35, '2º Andar', 214, 'Segundo', 'manhã', TRUE),
('33344455566', 'A', TRUE, 60, '1º Andar', 101, 'Primeiro', 'tarde', TRUE),
('44455566677', 'D', TRUE , 45, '4º Andar', 301, 'Primeiro', 'tarde', TRUE),
('55566677788', 'B', TRUE, 25, 'Térreo', 105, 'Segundo',   'manhã', TRUE);

-- update para colocar tv em agulmas salas

UPDATE sala
SET tvtamanho = 55
WHERE idsala IN (55,57,54,53,3,16,17);

--update para trocar de tv para data show
UPDATE sala
set tvtamanho = 'Data Show'
WHERE idsala in (7,12,18,20,37,40); -- atenção vai precisa deixar que tvtamanho possa inserir data show.

-- deixando salas ocupadas com update de disponibilidade para false

UPDATE sala
set disponibilidade = FALSE
WHERE idsala IN (4,9,18,20,22,24,25,32,33);




