# Guia de Configuração: DBeaver com PostgreSQL

1. Objetivo
Este documento detalha o processo passo a passo para configurar uma nova conexão com um banco de dados PostgreSQL utilizando o cliente de banco de dados DBeaver. O objetivo é padronizar a conexão para todos os membros da equipe.

2. Pré-requisitos
Antes de começar, garanta que você tenha:

O DBeaver Community Edition instalado em sua máquina.
link para instalação --> https://dbeaver.io/download/

As credenciais de acesso ao banco de dados PostgreSQL. Foi definida durante o processo de instalação do postgresql.

Host: localhost
Porta: 5432
Nome da Base de Dados: nome_do_seu_banco_de_dados
Usuário: nome_de_usuario
Senha: senha_definida

OBS: Caso não tenha postgres instalado verificar a documentação 2.1 - Ambiente_Banco_dados_Padrão.md. Em pré-requisitos vai ter tudo necessario durante a instalação.

3. Passo a Passo da Configuração
Siga as etapas abaixo para criar e testar sua conexão.

Etapa 1: Abrir o Assistente de Nova Conexão
Abra o DBeaver. No canto superior esquerdo da interface, clique no ícone de uma tomada com um sinal de mais (+). Alternativamente, você pode ir ao menu Arquivo > Novo > Conexão com Banco de Dados.

(Descrição da imagem: Ícone de uma tomada com um sinal de mais para criar uma nova conexão).

Etapa 2: Selecionar o Banco de Dados (PostgreSQL)
Uma janela chamada "Conectar a um banco de dados" aparecerá com uma lista de todos os bancos de dados suportados.

Na caixa de busca, digite PostgreSQL.

Selecione o ícone do elefante do PostgreSQL.

Clique em Próximo.

Etapa 3: Download do Driver JDBC (Apenas na Primeira Vez)
Se esta for a primeira vez que você se conecta a um PostgreSQL, o DBeaver informará que os arquivos do driver não existem e perguntará se você deseja baixá-los.

Clique no botão Download.

O DBeaver fará o download e a instalação automática do "tradutor" (o driver JDBC) que permite que ele se comunique com o PostgreSQL. Aguarde a conclusão.

Etapa 4: Configurar os Detalhes da Conexão
Você será apresentado à tela principal de configuração. Preencha os seguintes campos na aba Principal:

Host: localhost

Porta: 5432 (geralmente já vem preenchido)

Base de Dados: clinica_db

Autenticação: Deixe como Nativa do banco de dados

Usuário: admin

Senha: admin

Você pode marcar a caixa Salvar senha (localmente) para não precisar digitá-la toda vez. Por segurança, faça isso apenas em sua máquina de desenvolvimento pessoal.

(Descrição da imagem: Tela de configuração de conexão do PostgreSQL no DBeaver com os campos Host, Porta, Base de Dados, Usuário e Senha).

Etapa 5: Testar a Conexão
Antes de salvar, é crucial verificar se todas as informações estão corretas.

No canto inferior esquerdo da janela, clique no botão Testar conexão....

Se tudo estiver correto, uma janela de confirmação aparecerá mostrando detalhes da conexão e a versão do PostgreSQL. Se ocorrer um erro, revise os dados preenchidos na Etapa 4 (o erro mais comum é senha ou nome do banco incorretos).

Etapa 6: Finalizar e Nomear a Conexão
Após o teste bem-sucedido:

Clique em OK na janela de teste.

Clique em Concluir na janela de configuração.

Dica Importante: Sua nova conexão aparecerá no painel "Navegador de Banco de Dados". Clique com o botão direito sobre ela e escolha Renomear. Dê um nome descritivo, como Postgres-Local-ClinicaDB, para facilitar a identificação.

4. Primeiros Passos Após Conectar
Com a conexão estabelecida, você pode começar a trabalhar:

Navegar no Banco: Expanda a árvore da sua nova conexão para visualizar Schemas > public > Tabelas e ver todas as tabelas existentes.

Abrir um Editor de SQL: Clique com o botão direito na sua conexão e selecione Editor SQL > Novo Editor de SQL.

Executar uma Query de Teste: No novo editor, digite SELECT version(); e pressione Ctrl + Enter para executar o comando e confirmar que tudo está funcionando.

5. Solução de Problemas Comuns
Erro "Connection Refused": Verifique se o seu contêiner Docker com o PostgreSQL está realmente rodando e se os valores de Host e Porta estão corretos.

Erro "FATAL: password authentication failed for user...": A senha ou o nome de usuário estão incorretos. Verifique as credenciais.