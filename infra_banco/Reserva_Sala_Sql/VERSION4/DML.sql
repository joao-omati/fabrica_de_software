INSERT INTO usario (matricula, matriculauser, nome, emailinst, sexo, cargo, senha) 
VALUES
(94147, NULL, 'Vitor', 'vitor94147@unieuro.com.br', 'M', 'Diretor', 133122),
(99146, NULL, 'Viceleno', 'viceleno099146@unieuro.com.br', 'F', 'Assessora', 123789),
(12345, NULL, 'Arthur', 'arthur012345@unieuro.com.br', 'M', 'Coordenador', 987321),
(21253, NULL, 'ellen', 'ellen021253@unieuro.com.br', 'F', 'Secretaria', 987654),
(78982, NULL, 'João', 'joao078982@unieuro.com.br', 'M', 'NAPI', 789456),
(34879, NULL, 'Paulo', 'paulo034879@unieuro.com.br', 'M', 'NTI', 456789),
(41456, NULL, 'Corno', 'corno041456@unieuro.com.br', 'F', 'Manutenção', 123456);


INSERT INTO sala (
	bloco, andar, numerosala, capacidade, tvtamanho,datashow
)
VALUES
('A', '1º andar', 101, 50, ' 55" ' , FALSE),
('B', '2º andar', 201, 55, ' 55" ' , FALSE),
('C', '3º andar', 301, 60, ' 55" ' , FALSE),
('D', '4º andar', 401, 60, ' 0"  ' , TRUE );


INSERT INTO curso (nomecurso)
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


-- simulação de reserva 

--tabela reserva

INSERT INTO reserva (matriculauser, idcurso, codturma, datainicial, datafinal)
VALUES 
(94147, 1 ,'ADM02N1', '2025-08-11', '2025-11-30')
RETURNING idreserva;

--tabela reserva sala 
INSERT INTO reservasala (idreserva, idsala, turno, responsavel)
VALUES (1, 1, 'Manhã', 'Prof.pamonha') -- turno informado para consistência, mesmo sem períodos
RETURNING idreservasala;

--tabela periodo
INSERT INTO periodo (idreservasala, terceiro , quarto)
VALUES (1, TRUE, TRUE)
RETURNING idperiodo;

--tabela diasemana
INSERT INTO diasemana (idreservasala, idperiodo, segunda, terca)
VALUES (1, 1, TRUE, TRUE);

