1 - Acessar o PostgreSQL no terminal

    psql -h localhost -U postgres -d nomedobanco


2 - TABELA DE COMANDOS NO SERVIDOR DO POSTGRE

    +------------------------------+------------------------------------------------------+
    |         COMANDO             |                     DESCRIÇÃO                        |
    +------------------------------+------------------------------------------------------+
    | \q                           | Sair do psql                                         |
    | \l                           | Listar todos os bancos de dados                     |
    | \c nome_banco                | Conectar a outro banco de dados                     |
    | \dt                          | Listar tabelas do schema atual                      |
    | \dt nome_schema.*            | Listar tabelas de um schema específico              |
    | \d nome_tabela               | Exibir estrutura da tabela                          |
    | \dn                          | Listar schemas existentes                           |
    | \du                          | Listar usuários (roles)                             |
    | \password nome_usuario       | Alterar senha do usuário                            |
    | \conninfo                    | Mostrar info da conexão atual                       |
    | \x                           | Ativar/desativar modo expandido (tabelas largas)   |
    +------------------------------+------------------------------------------------------+

3 - COMANDOS SQL - DDL (DATA DEFINITION LANGUAGE )

    +-------------------------------------------+--------------------------------------------+
    |                  COMANDO                  |                 DESCRIÇÃO                  |
    +-------------------------------------------+--------------------------------------------+
    | CREATE DATABASE nome;                     | Cria um novo banco de dados                |
    | CREATE SCHEMA nome;                       | Cria um novo schema                        |
    | CREATE TABLE nome (...);                  | Cria uma nova tabela                       |
    | ALTER TABLE nome ADD coluna tipo;         | Adiciona coluna a uma tabela               |
    | ALTER TABLE nome RENAME TO novo_nome;     | Renomeia a tabela                          |
    | DROP TABLE nome;                          | Exclui a tabela                            |
    | DROP DATABASE nome;                       | Exclui o banco de dados                    |
    | DROP SCHEMA nome CASCADE;                 | Exclui schema e tudo dentro dele           |
    | CREATE INDEX idx_nome ON tabela(coluna);  | Cria índice em uma coluna                  |
    +-------------------------------------------+--------------------------------------------+


4 - COMANDOS SQL – DML (DATA MANIPULATION LANGUAGE )

    +-----------------------------------------------+--------------------------------------------+
    |                  COMANDO                      |                 DESCRIÇÃO                  |
    +-----------------------------------------------+--------------------------------------------+
    | SELECT * FROM tabela;                         | Consulta todos os dados da tabela          |
    | SELECT coluna1, coluna2 FROM tabela;          | Consulta colunas específicas               |
    | INSERT INTO tabela (coluna1, coluna2)         | Insere um novo registro                    |
    |   VALUES ('valor1', 'valor2');                |                                            |
    | UPDATE tabela SET coluna='valor'              | Atualiza registros                         |
    |   WHERE condição;                             |                                            |
    | DELETE FROM tabela WHERE condição;            | Exclui registros com base na condição      |
    | TRUNCATE TABLE tabela;                        | Exclui todos os registros (sem WHERE)      |
    +-----------------------------------------------+--------------------------------------------+


5 - COMANDOS DE USUÁRIO E PERMISSÃO

    +---------------------------------------------+--------------------------------------------+
    |                  COMANDO                    |                 DESCRIÇÃO                  |
    +---------------------------------------------+--------------------------------------------+
    | CREATE USER nome WITH PASSWORD 'senha';     | Cria novo usuário (role)                   |
    | ALTER USER nome WITH PASSWORD 'nova_senha'; | Altera senha de usuário                    |
    | GRANT ALL PRIVILEGES ON DATABASE nome TO u; | Concede permissões                         |
    | REVOKE ALL ON DATABASE nome FROM usuario;   | Revoga permissões                          |
    | GRANT SELECT, INSERT ON tabela TO usuario;  | Permissões específicas na tabela           |
    +---------------------------------------------+--------------------------------------------+


6 - COMANDOS ÚTEIS ADICIONAIS

    +---------------------------------------------+--------------------------------------------+
    |                  COMANDO                    |                 DESCRIÇÃO                  |
    +---------------------------------------------+--------------------------------------------+
    | SET search_path TO schema;                  | Define schema padrão da sessão             |
    | SHOW search_path;                           | Mostra o schema atual                      |
    | SELECT current_database();                  | Nome do banco conectado                    |
    | SELECT current_user;                        | Nome do usuário atual                      |
    | SELECT * FROM pg_stat_activity;             | Ver conexões ativas                        |
    +---------------------------------------------+--------------------------------------------+