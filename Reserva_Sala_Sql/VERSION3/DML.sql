-- Active: 1750966967560@@127.0.0.1@5432@reserva

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


--insert tursala

INSERT INTO tusala (idsala,idturma)
VALUES
(24,2),
(20,14),
(21,11),
(26,6),
(18,5);