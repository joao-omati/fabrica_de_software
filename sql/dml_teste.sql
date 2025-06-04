-- Se tiver alguma consulta comentada é para testes depois, ou para estudar

SELECT * FROM inscritoconvenio;
SELECT * FROM inscritocomunidade;

insert into inscritoconvenio (nomeinscrito,dtnascimento,testavpsico,tipoencaminhamento,
							  nomeresp,grauresp,cpfresp,estadocivilresp,tellcellresp,emailresp,
							  estadocivilinscrito,cpfinscrito,tellcellinscrito,contatourgencia,emailinscrito,
							  identidadegenero,etnia,religiao, confirmlgpd)
values (
	'João da silva',
	'2003-10-15',
	true,
	'CAPS',
	'Guilherme Braga Rios da Costa',
	'Pai',
	'12345678910',
	'Solteiro',
	'61993242321',
	'josep@gmail.com',
	'Casado',
	'12345678911',
	'61983746374',
	'61932745362',
	'iewquieuqwe@gmail.com',
	'Masculino',
	'Branca',
	'Outros',
	TRUE
);

insert into inscritoconvenio (nomeinscrito,dtnascimento,testavpsico,tipoencaminhamento,
							  nomeresp,grauresp,cpfresp,estadocivilresp,tellcellresp,emailresp,
							  estadocivilinscrito,cpfinscrito,tellcellinscrito,contatourgencia,emailinscrito,
							  identidadegenero,etnia,religiao, confirmlgpd)
values (
	'Pedro Alvares Cabral',
	'2003-10-15',
	true,
	'CREAS',
	'Josép Silva',
	'Irmão',
	'12345678912',
	'Solteiro',
	'61993242321',
	'josep@gmail.com',
	'Casado',
	'12345678913',
	'61983746374',
	'61932745362',
	'iewquieuqwe@gmail.com',
	'Masculino',
	'Branca',
	'Outros',
	TRUE
);

INSERT INTO inscritocomunidade ( nomeinscrito, dtnascimento, cpfinscrito, tellcellinscrito, contatourgencia, emailinscrito, 
								identidadegenero, etnia, religiao, confirmlgpd)
VALUES (
	'Camile de Souza',
	'2000-01-23',
	'12345678910',
	'(61)9 9923 3234',
	'61 99 33 22 11',
	'camile@gmail.com',
	'Feminino',
	'Amarela',
	'Evangélico',
	TRUE
);

INSERT INTO endereco (idfichaconvenio, idfichacomunidade, cidade, rua, uf, cep)
VALUES(
	NULL,
	2,
	'Brasília',
	'rua alvares cabral',
	'DF',
	'75023132'
);

-- Consulta de endereço de uma pessoa específica
SELECT i.nomeinscrito, e.cidade, e.rua, e.uf, e.cep
FROM inscritocomunidade as i
JOIN endereco as e ON e.idfichacomunidade = i.idfichacomunidade
WHERE i.nomeinscrito = 'Camile de Souza';

-- INSERT INTO endereco (idfichaconvenio, idfichacomunidade, cidade, rua, uf, cep)
-- SELECT 
--     NULL,  -- idfichaconvenio (se necessário, pode deixar NULL ou ajustar conforme o caso)
--     idinscrito,  -- Pega o idinscrito da tabela inscritocomunidade
--     'Brasília',  -- Insere diretamente o valor da cidade
--     'rua alvares cabral',  -- Insere diretamente o valor da rua
--     'DF',  -- Insere diretamente o valor do estado (UF)
--     '75023132'  -- Insere diretamente o valor do CEP
-- FROM 
--     inscritocomunidade
-- WHERE 
--     nomeinscrito = 'Camile de Souza';  -- Condição para selecionar Camile




