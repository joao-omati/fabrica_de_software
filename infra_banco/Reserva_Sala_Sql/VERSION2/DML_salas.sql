-- Active: 1750871648690@@127.0.0.1@5432@reserva
INSERT INTO sala (cpfnti, bloco, tvtamanho, disponibilidade, capacidade, andar, numerosala, periodo, turno, status) VALUES
-- Bloco B – Térreo (salas 01 a 04 e Auditório)
-- Sala 01
('99900011122', 'B', NULL, TRUE, 50, 'Térreo', 1, NULL, 'matutino', TRUE),
('99900011122', 'B', NULL, TRUE, 50, 'Térreo', 1, NULL, 'vespertino', TRUE),
('99900011122', 'B', NULL, TRUE, 50, 'Térreo', 1, NULL, 'noturno', TRUE),
-- Sala 02 TV
('99900011122', 'B', 55, TRUE, 50, 'Térreo', 2, NULL, 'matutino', TRUE),
('99900011122', 'B', 55, TRUE, 50, 'Térreo', 2, NULL, 'vespertino', TRUE),
('99900011122', 'B', 55, TRUE, 50, 'Térreo', 2, NULL, 'noturno', TRUE),
-- Sala 03 TV
('99900011122', 'B', 55, TRUE, 50, 'Térreo', 3, NULL, 'matutino', TRUE),
('99900011122', 'B', 55, TRUE, 50, 'Térreo', 3, NULL, 'vespertino', TRUE),
('99900011122', 'B', 55, TRUE, 50, 'Térreo', 3, NULL, 'noturno', TRUE),
-- Sala 04 TV
('99900011122', 'B', 55, TRUE, 50, 'Térreo', 4, NULL, 'matutino', TRUE),
('99900011122', 'B', 55, TRUE, 50, 'Térreo', 4, NULL, 'vespertino', TRUE),
('99900011122', 'B', 55, TRUE, 50, 'Térreo', 4, NULL, 'noturno', TRUE),
-- Auditório (número 100)
('99900011122', 'B', NULL, TRUE, 180, 'Térreo', 100, NULL, 'matutino', TRUE),
('99900011122', 'B', NULL, TRUE, 180, 'Térreo', 100, NULL, 'vespertino', TRUE),
('99900011122', 'B', NULL, TRUE, 180, 'Térreo', 100, NULL, 'noturno', TRUE);
-- Exemplo triplicado (Sala 01 - Bloco B)

INSERT INTO sala (cpfnti, bloco, tvtamanho, disponibilidade, capacidade, andar, numerosala, periodo, turno, status) VALUES
('99900011122', 'B', NULL, TRUE, 50, 'Térreo', 1, NULL, 'matutino', TRUE),
('99900011122', 'B', NULL, TRUE, 50, 'Térreo', 1, NULL, 'vespertino', TRUE),
('99900011122', 'B', NULL, TRUE, 50, 'Térreo', 1, NULL, 'noturno', TRUE),
('99900011122', 'B', 55, TRUE, 50, 'Térreo', 2, NULL, 'matutino', TRUE),
('99900011122', 'B', 55, TRUE, 50, 'Térreo', 2, NULL, 'vespertino', TRUE),
('99900011122', 'B', 55, TRUE, 50, 'Térreo', 2, NULL, 'noturno', TRUE),
-- Auditório
('99900011122', 'B', NULL, TRUE, 180, 'Térreo', 100, NULL, 'matutino', TRUE),
('99900011122', 'B', NULL, TRUE, 180, 'Térreo', 100, NULL, 'vespertino', TRUE),
('99900011122', 'B', NULL, TRUE, 180, 'Térreo', 100, NULL, 'noturno', TRUE),
-- Bloco C - Sala 101
('99900011122', 'C', NULL, TRUE, 50, '1º Andar', 101, NULL, 'matutino', TRUE),
('99900011122', 'C', NULL, TRUE, 50, '1º Andar', 101, NULL, 'vespertino', TRUE),
('99900011122', 'C', NULL, TRUE, 50, '1º Andar', 101, NULL, 'noturno', TRUE),
-- Bloco C - Sala 208 (80 pessoas, TV 65")
('99900011122', 'C', 65, TRUE, 80, '2º Andar', 208, NULL, 'matutino', TRUE),
('99900011122', 'C', 65, TRUE, 80, '2º Andar', 208, NULL, 'vespertino', TRUE),
('99900011122', 'C', 65, TRUE, 80, '2º Andar', 208, NULL, 'noturno', TRUE),
-- Bloco C - Sala 303 (Data Show = 55)
('99900011122', 'C', 55, TRUE, 50, '3º Andar', 303, NULL, 'matutino', TRUE),
('99900011122', 'C', 55, TRUE, 50, '3º Andar', 303, NULL, 'vespertino', TRUE),
('99900011122', 'C', 55, TRUE, 50, '3º Andar', 303, NULL, 'noturno', TRUE),
-- Sala especial (Sala Alvorada como número 1 no Bloco D)
('99900011122', 'D', 55, TRUE, 50, '3º Andar', 1, NULL, 'matutino', TRUE),
('99900011122', 'D', 55, TRUE, 50, '3º Andar', 1, NULL, 'vespertino', TRUE),
('99900011122', 'D', 55, TRUE, 50, '3º Andar', 1, NULL, 'noturno', TRUE),
-- Bloco F - Sala 103 (Data Show, capacidade 75)
('99900011122', 'F', 55, TRUE, 75, '1º Andar', 103, NULL, 'matutino', TRUE),
('99900011122', 'F', 55, TRUE, 75, '1º Andar', 103, NULL, 'vespertino', TRUE),
('99900011122', 'F', 55, TRUE, 75, '1º Andar', 103, NULL, 'noturno', TRUE);


-- Bloco C – 1º Andar
-- Sala 101
INSERT INTO sala (cpfnti, bloco, tvtamanho, disponibilidade, capacidade, andar, numerosala, periodo, turno, status) VALUES
('99900011122', 'C', NULL, TRUE, 50, '1º Andar', 101, NULL, 'matutino', TRUE),
('99900011122', 'C', NULL, TRUE, 50, '1º Andar', 101, NULL, 'vespertino', TRUE),
('99900011122', 'C', NULL, TRUE, 50, '1º Andar', 101, NULL, 'noturno', TRUE),
-- Sala 103
('99900011122', 'C', NULL, TRUE, 50, '1º Andar', 103, NULL, 'matutino', TRUE),
('99900011122', 'C', NULL, TRUE, 50, '1º Andar', 103, NULL, 'vespertino', TRUE),
('99900011122', 'C', NULL, TRUE, 50, '1º Andar', 103, NULL, 'noturno', TRUE),
-- Sala 104
('99900011122', 'C', NULL, TRUE, 50, '1º Andar', 104, NULL, 'matutino', TRUE),
('99900011122', 'C', NULL, TRUE, 50, '1º Andar', 104, NULL, 'vespertino', TRUE),
('99900011122', 'C', NULL, TRUE, 50, '1º Andar', 104, NULL, 'noturno', TRUE),
-- Sala 105
('99900011122', 'C', NULL, TRUE, 50, '1º Andar', 105, NULL, 'matutino', TRUE),
('99900011122', 'C', NULL, TRUE, 50, '1º Andar', 105, NULL, 'vespertino', TRUE),
('99900011122', 'C', NULL, TRUE, 50, '1º Andar', 105, NULL, 'noturno', TRUE),
-- Sala 106
('99900011122', 'C', NULL, TRUE, 50, '1º Andar', 106, NULL, 'matutino', TRUE),
('99900011122', 'C', NULL, TRUE, 50, '1º Andar', 106, NULL, 'vespertino', TRUE),
('99900011122', 'C', NULL, TRUE, 50, '1º Andar', 106, NULL, 'noturno', TRUE);


INSERT INTO sala (cpfnti, bloco, tvtamanho, disponibilidade, capacidade, andar, numerosala, periodo, turno, status) VALUES
-- Bloco C – 2º Andar (salas com TV 55", exceto 208 e 212 que têm 65" e capacidade especial)
-- Sala 201
('99900011122', 'C', 55, TRUE, 50, '2º Andar', 201, NULL, 'matutino', TRUE),
('99900011122', 'C', 55, TRUE, 50, '2º Andar', 201, NULL, 'vespertino', TRUE),
('99900011122', 'C', 55, TRUE, 50, '2º Andar', 201, NULL, 'noturno', TRUE),
-- Sala 203
('99900011122', 'C', 55, TRUE, 50, '2º Andar', 203, NULL, 'matutino', TRUE),
('99900011122', 'C', 55, TRUE, 50, '2º Andar', 203, NULL, 'vespertino', TRUE),
('99900011122', 'C', 55, TRUE, 50, '2º Andar', 203, NULL, 'noturno', TRUE),
-- Sala 204
('99900011122', 'C', 55, TRUE, 50, '2º Andar', 204, NULL, 'matutino', TRUE),
('99900011122', 'C', 55, TRUE, 50, '2º Andar', 204, NULL, 'vespertino', TRUE),
('99900011122', 'C', 55, TRUE, 50, '2º Andar', 204, NULL, 'noturno', TRUE),
-- Sala 205
('99900011122', 'C', 55, TRUE, 50, '2º Andar', 205, NULL, 'matutino', TRUE),
('99900011122', 'C', 55, TRUE, 50, '2º Andar', 205, NULL, 'vespertino', TRUE),
('99900011122', 'C', 55, TRUE, 50, '2º Andar', 205, NULL, 'noturno', TRUE),
-- Sala 208 (TV 65”, capacidade 80)
('99900011122', 'C', 65, TRUE, 80, '2º Andar', 208, NULL, 'matutino', TRUE),
('99900011122', 'C', 65, TRUE, 80, '2º Andar', 208, NULL, 'vespertino', TRUE),
('99900011122', 'C', 65, TRUE, 80, '2º Andar', 208, NULL, 'noturno', TRUE),
-- Bloco C – 2º Andar (continuação)
-- Sala 209
('99900011122', 'C', 55, TRUE, 50, '2º Andar', 209, NULL, 'matutino', TRUE),
('99900011122', 'C', 55, TRUE, 50, '2º Andar', 209, NULL, 'vespertino', TRUE),
('99900011122', 'C', 55, TRUE, 50, '2º Andar', 209, NULL, 'noturno', TRUE),
-- Sala 211
('99900011122', 'C', 55, TRUE, 50, '2º Andar', 211, NULL, 'matutino', TRUE),
('99900011122', 'C', 55, TRUE, 50, '2º Andar', 211, NULL, 'vespertino', TRUE),
('99900011122', 'C', 55, TRUE, 50, '2º Andar', 211, NULL, 'noturno', TRUE),
-- Sala 212 (Capacidade 75, TV 65”)
('99900011122', 'C', 65, TRUE, 75, '2º Andar', 212, NULL, 'matutino', TRUE),
('99900011122', 'C', 65, TRUE, 75, '2º Andar', 212, NULL, 'vespertino', TRUE),
('99900011122', 'C', 65, TRUE, 75, '2º Andar', 212, NULL, 'noturno', TRUE),
-- Sala 214
('99900011122', 'C', 55, TRUE, 50, '2º Andar', 214, NULL, 'matutino', TRUE),
('99900011122', 'C', 55, TRUE, 50, '2º Andar', 214, NULL, 'vespertino', TRUE),
('99900011122', 'C', 55, TRUE, 50, '2º Andar', 214, NULL, 'noturno', TRUE),
-- Sala 216
('99900011122', 'C', 55, TRUE, 50, '2º Andar', 216, NULL, 'matutino', TRUE),
('99900011122', 'C', 55, TRUE, 50, '2º Andar', 216, NULL, 'vespertino', TRUE),
('99900011122', 'C', 55, TRUE, 50, '2º Andar', 216, NULL, 'noturno', TRUE),
-- Bloco C – 3º Andar (início)
-- Sala 301
('99900011122', 'C', NULL, TRUE, 50, '3º Andar', 301, NULL, 'matutino', TRUE),
('99900011122', 'C', NULL, TRUE, 50, '3º Andar', 301, NULL, 'vespertino', TRUE),
('99900011122', 'C', NULL, TRUE, 50, '3º Andar', 301, NULL, 'noturno', TRUE),
-- Sala 303 (Data Show = 55)
('99900011122', 'C', 55, TRUE, 50, '3º Andar', 303, NULL, 'matutino', TRUE),
('99900011122', 'C', 55, TRUE, 50, '3º Andar', 303, NULL, 'vespertino', TRUE),
('99900011122', 'C', 55, TRUE, 50, '3º Andar', 303, NULL, 'noturno', TRUE),
-- Sala 304 (Data Show = 55)
('99900011122', 'C', 55, TRUE, 50, '3º Andar', 304, NULL, 'matutino', TRUE),
('99900011122', 'C', 55, TRUE, 50, '3º Andar', 304, NULL, 'vespertino', TRUE),
('99900011122', 'C', 55, TRUE, 50, '3º Andar', 304, NULL, 'noturno', TRUE),
-- Sala 305 (Data Show = 55)
('99900011122', 'C', 55, TRUE, 50, '3º Andar', 305, NULL, 'matutino', TRUE),
('99900011122', 'C', 55, TRUE, 50, '3º Andar', 305, NULL, 'vespertino', TRUE),
('99900011122', 'C', 55, TRUE, 50, '3º Andar', 305, NULL, 'noturno', TRUE),
-- Bloco C – 3º Andar (continuação)
-- Sala 306 (Data Show)
('99900011122', 'C', 55, TRUE, 50, '3º Andar', 306, NULL, 'matutino', TRUE),
('99900011122', 'C', 55, TRUE, 50, '3º Andar', 306, NULL, 'vespertino', TRUE),
('99900011122', 'C', 55, TRUE, 50, '3º Andar', 306, NULL, 'noturno', TRUE),
-- Sala 307/309 (TV 65”, capacidade 20) → menor número: 307
('99900011122', 'C', 65, TRUE, 20, '3º Andar', 307, NULL, 'matutino', TRUE),
('99900011122', 'C', 65, TRUE, 20, '3º Andar', 307, NULL, 'vespertino', TRUE),
('99900011122', 'C', 65, TRUE, 20, '3º Andar', 307, NULL, 'noturno', TRUE),
-- Sala 308 (Data Show)
('99900011122', 'C', 55, TRUE, 50, '3º Andar', 308, NULL, 'matutino', TRUE),
('99900011122', 'C', 55, TRUE, 50, '3º Andar', 308, NULL, 'vespertino', TRUE),
('99900011122', 'C', 55, TRUE, 50, '3º Andar', 308, NULL, 'noturno', TRUE),
-- Sala 311/313 (TV 65”, capacidade 90) → menor número: 311
('99900011122', 'C', 65, TRUE, 90, '3º Andar', 311, NULL, 'matutino', TRUE),
('99900011122', 'C', 65, TRUE, 90, '3º Andar', 311, NULL, 'vespertino', TRUE),
('99900011122', 'C', 65, TRUE, 90, '3º Andar', 311, NULL, 'noturno', TRUE),
-- Sala 312/314 (TV 75”, capacidade 125) → menor número: 312
('99900011122', 'C', 75, TRUE, 125, '3º Andar', 312, NULL, 'matutino', TRUE),
('99900011122', 'C', 75, TRUE, 125, '3º Andar', 312, NULL, 'vespertino', TRUE),
('99900011122', 'C', 75, TRUE, 125, '3º Andar', 312, NULL, 'noturno', TRUE),
-- Sala 316/318 (TV 65”, capacidade 90) → menor número: 316
('99900011122', 'C', 65, TRUE, 90, '3º Andar', 316, NULL, 'matutino', TRUE),
('99900011122', 'C', 65, TRUE, 90, '3º Andar', 316, NULL, 'vespertino', TRUE),
('99900011122', 'C', 65, TRUE, 90, '3º Andar', 316, NULL, 'noturno', TRUE),
-- Bloco D – 3º Andar
-- Sala 301 (TV 55")
('99900011122', 'D', 55, TRUE, 50, '3º Andar', 301, NULL, 'matutino', TRUE),
('99900011122', 'D', 55, TRUE, 50, '3º Andar', 301, NULL, 'vespertino', TRUE),
('99900011122', 'D', 55, TRUE, 50, '3º Andar', 301, NULL, 'noturno', TRUE),
-- Sala 303 (TV 55")
('99900011122', 'D', 55, TRUE, 50, '3º Andar', 303, NULL, 'matutino', TRUE),
('99900011122', 'D', 55, TRUE, 50, '3º Andar', 303, NULL, 'vespertino', TRUE),
('99900011122', 'D', 55, TRUE, 50, '3º Andar', 303, NULL, 'noturno', TRUE),
-- Sala 304/306 (TV 65", capacidade 110) → 304
('99900011122', 'D', 65, TRUE, 110, '3º Andar', 304, NULL, 'matutino', TRUE),
('99900011122', 'D', 65, TRUE, 110, '3º Andar', 304, NULL, 'vespertino', TRUE),
('99900011122', 'D', 65, TRUE, 110, '3º Andar', 304, NULL, 'noturno', TRUE),
-- Sala 305 (TV 55")
('99900011122', 'D', 55, TRUE, 50, '3º Andar', 305, NULL, 'matutino', TRUE),
('99900011122', 'D', 55, TRUE, 50, '3º Andar', 305, NULL, 'vespertino', TRUE),
('99900011122', 'D', 55, TRUE, 50, '3º Andar', 305, NULL, 'noturno', TRUE),
-- Sala Alvorada (TV 55”) → especial 01
('99900011122', 'D', 55, TRUE, 50, '3º Andar', 1, NULL, 'matutino', TRUE),
('99900011122', 'D', 55, TRUE, 50, '3º Andar', 1, NULL, 'vespertino', TRUE),
('99900011122', 'D', 55, TRUE, 50, '3º Andar', 1, NULL, 'noturno', TRUE),
-- Sala 308 (TV 55")
('99900011122', 'D', 55, TRUE, 50, '3º Andar', 308, NULL, 'matutino', TRUE),
('99900011122', 'D', 55, TRUE, 50, '3º Andar', 308, NULL, 'vespertino', TRUE),
('99900011122', 'D', 55, TRUE, 50, '3º Andar', 308, NULL, 'noturno', TRUE),
-- Sala 309 (TV 55")
('99900011122', 'D', 55, TRUE, 50, '3º Andar', 309, NULL, 'matutino', TRUE),
('99900011122', 'D', 55, TRUE, 50, '3º Andar', 309, NULL, 'vespertino', TRUE),
('99900011122', 'D', 55, TRUE, 50, '3º Andar', 309, NULL, 'noturno', TRUE),
-- Sala 310/312 (TV 65”, capacidade 65) → 310
('99900011122', 'D', 65, TRUE, 65, '3º Andar', 310, NULL, 'matutino', TRUE),
('99900011122', 'D', 65, TRUE, 65, '3º Andar', 310, NULL, 'vespertino', TRUE),
('99900011122', 'D', 65, TRUE, 65, '3º Andar', 310, NULL, 'noturno', TRUE),
-- Sala 311 (TV 65”, capacidade 65)
('99900011122', 'D', 65, TRUE, 65, '3º Andar', 311, NULL, 'matutino', TRUE),
('99900011122', 'D', 65, TRUE, 65, '3º Andar', 311, NULL, 'vespertino', TRUE),
('99900011122', 'D', 65, TRUE, 65, '3º Andar', 311, NULL, 'noturno', TRUE),
-- Sala 313/315 (sem info específica) → 313
('99900011122', 'D', NULL, TRUE, 50, '3º Andar', 313, NULL, 'matutino', TRUE),
('99900011122', 'D', NULL, TRUE, 50, '3º Andar', 313, NULL, 'vespertino', TRUE),
('99900011122', 'D', NULL, TRUE, 50, '3º Andar', 313, NULL, 'noturno', TRUE),
-- Sala 314 (TV 65”, capacidade 65)
('99900011122', 'D', 65, TRUE, 65, '3º Andar', 314, NULL, 'matutino', TRUE),
('99900011122', 'D', 65, TRUE, 65, '3º Andar', 314, NULL, 'vespertino', TRUE),
('99900011122', 'D', 65, TRUE, 65, '3º Andar', 314, NULL, 'noturno', TRUE);
-- Bloco F – 1º Andar

INSERT INTO sala (cpfnti, bloco, tvtamanho, disponibilidade, capacidade, andar, numerosala, periodo, turno, status) VALUES
-- Sala 101 (Data Show)
('99900011122', 'F', 55, TRUE, 50, '1º Andar', 101, NULL, 'matutino', TRUE),
('99900011122', 'F', 55, TRUE, 50, '1º Andar', 101, NULL, 'vespertino', TRUE),
('99900011122', 'F', 55, TRUE, 50, '1º Andar', 101, NULL, 'noturno', TRUE),
-- Sala 102 (Data Show)
('99900011122', 'F', 55, TRUE, 50, '1º Andar', 102, NULL, 'matutino', TRUE),
('99900011122', 'F', 55, TRUE, 50, '1º Andar', 102, NULL, 'vespertino', TRUE),
('99900011122', 'F', 55, TRUE, 50, '1º Andar', 102, NULL, 'noturno', TRUE),
-- Sala 103–106 (Data Show, capacidade 75)
('99900011122', 'F', 55, TRUE, 75, '1º Andar', 103, NULL, 'matutino', TRUE),
('99900011122', 'F', 55, TRUE, 75, '1º Andar', 103, NULL, 'vespertino', TRUE),
('99900011122', 'F', 55, TRUE, 75, '1º Andar', 103, NULL, 'noturno', TRUE),
('99900011122', 'F', 55, TRUE, 75, '1º Andar', 104, NULL, 'matutino', TRUE),
('99900011122', 'F', 55, TRUE, 75, '1º Andar', 104, NULL, 'vespertino', TRUE),
('99900011122', 'F', 55, TRUE, 75, '1º Andar', 104, NULL, 'noturno', TRUE),
('99900011122', 'F', 55, TRUE, 75, '1º Andar', 105, NULL, 'matutino', TRUE),
('99900011122', 'F', 55, TRUE, 75, '1º Andar', 105, NULL, 'vespertino', TRUE),
('99900011122', 'F', 55, TRUE, 75, '1º Andar', 105, NULL, 'noturno', TRUE),
('99900011122', 'F', 55, TRUE, 75, '1º Andar', 106, NULL, 'matutino', TRUE),
('99900011122', 'F', 55, TRUE, 75, '1º Andar', 106, NULL, 'vespertino', TRUE),
('99900011122', 'F', 55, TRUE, 75, '1º Andar', 106, NULL, 'noturno', TRUE),
-- Bloco F – 2º Andar
-- Sala 201/203 → usa 201, capacidade 110
('99900011122', 'F', 55, TRUE, 110, '2º Andar', 201, NULL, 'matutino', TRUE),
('99900011122', 'F', 55, TRUE, 110, '2º Andar', 201, NULL, 'vespertino', TRUE),
('99900011122', 'F', 55, TRUE, 110, '2º Andar', 201, NULL, 'noturno', TRUE),
-- Salas 202–208 (Data Show)
('99900011122', 'F', 55, TRUE, 50, '2º Andar', 202, NULL, 'matutino', TRUE),
('99900011122', 'F', 55, TRUE, 50, '2º Andar', 202, NULL, 'vespertino', TRUE),
('99900011122', 'F', 55, TRUE, 50, '2º Andar', 202, NULL, 'noturno', TRUE),

('99900011122', 'F', 55, TRUE, 50, '2º Andar', 204, NULL, 'matutino', TRUE),
('99900011122', 'F', 55, TRUE, 50, '2º Andar', 204, NULL, 'vespertino', TRUE),
('99900011122', 'F', 55, TRUE, 50, '2º Andar', 204, NULL, 'noturno', TRUE),
('99900011122', 'F', 55, TRUE, 50, '2º Andar', 205, NULL, 'matutino', TRUE),
('99900011122', 'F', 55, TRUE, 50, '2º Andar', 205, NULL, 'vespertino', TRUE),
('99900011122', 'F', 55, TRUE, 50, '2º Andar', 205, NULL, 'noturno', TRUE),
('99900011122', 'F', 55, TRUE, 50, '2º Andar', 206, NULL, 'matutino', TRUE),
('99900011122', 'F', 55, TRUE, 50, '2º Andar', 206, NULL, 'vespertino', TRUE),
('99900011122', 'F', 55, TRUE, 50, '2º Andar', 206, NULL, 'noturno', TRUE),
('99900011122', 'F', 55, TRUE, 50, '2º Andar', 207, NULL, 'matutino', TRUE),
('99900011122', 'F', 55, TRUE, 50, '2º Andar', 207, NULL, 'vespertino', TRUE),
('99900011122', 'F', 55, TRUE, 50, '2º Andar', 207, NULL, 'noturno', TRUE),

('99900011122', 'F', 55, TRUE, 50, '2º Andar', 208, NULL, 'matutino', TRUE),
('99900011122', 'F', 55, TRUE, 50, '2º Andar', 208, NULL, 'vespertino', TRUE),
('99900011122', 'F', 55, TRUE, 50, '2º Andar', 208, NULL, 'noturno', TRUE),
-- Bloco F – 3º Andar (sem especificações, assume capacidade padrão e sem TV)
('99900011122', 'F', NULL, TRUE, 50, '3º Andar', 301, NULL, 'matutino', TRUE),
('99900011122', 'F', NULL, TRUE, 50, '3º Andar', 301, NULL, 'vespertino', TRUE),
('99900011122', 'F', NULL, TRUE, 50, '3º Andar', 301, NULL, 'noturno', TRUE),

('99900011122', 'F', NULL, TRUE, 50, '3º Andar', 302, NULL, 'matutino', TRUE),
('99900011122', 'F', NULL, TRUE, 50, '3º Andar', 302, NULL, 'vespertino', TRUE),
('99900011122', 'F', NULL, TRUE, 50, '3º Andar', 302, NULL, 'noturno', TRUE),

('99900011122', 'F', NULL, TRUE, 50, '3º Andar', 303, NULL, 'matutino', TRUE),
('99900011122', 'F', NULL, TRUE, 50, '3º Andar', 303, NULL, 'vespertino', TRUE),
('99900011122', 'F', NULL, TRUE, 50, '3º Andar', 303, NULL, 'noturno', TRUE),

('99900011122', 'F', NULL, TRUE, 50, '3º Andar', 304, NULL, 'matutino', TRUE),
('99900011122', 'F', NULL, TRUE, 50, '3º Andar', 304, NULL, 'vespertino', TRUE),
('99900011122', 'F', NULL, TRUE, 50, '3º Andar', 304, NULL, 'noturno', TRUE),

('99900011122', 'F', NULL, TRUE, 50, '3º Andar', 305, NULL, 'matutino', TRUE),
('99900011122', 'F', NULL, TRUE, 50, '3º Andar', 305, NULL, 'vespertino', TRUE),
('99900011122', 'F', NULL, TRUE, 50,  '3º Andar', 305, NULL, 'noturno', TRUE);