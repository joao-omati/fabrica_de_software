# Documentação de Ambiente – Banco de Dados PostgreSQL no Codespace com Docker

1. Contexto
    
    Este documento tem como objetivo guiar a configuração de um ambiente de banco de dados PostgreSQL
    rodando dentro de um container Docker no GitHub Codespaces. A intenção é facilitar o desenvolvimento
    e testes locais utilizando um banco configurado, sem precisar instalar PostgreSQL diretamente na máquina local.

2. Pré-requisitos

    Conta no GitHub com acesso a Codespaces.

    Utilizar 2 Núcles/Cores no codespace que é gratuito: limite de 60h por mês

        observação: Você pode criar um com 4 cores, mas aí é contigo kkkkk

    Docker instalado e configurado no Codespace (o Codespaces já vem com Docker instalado, mas é importante verificar).

    Permissões para executar comandos Docker dentro do Codespace.

    VS Code instalado localmente ou acesso ao editor via browser com Codespaces.

3. Verificar se o Docker está instalado no Codespace

    Abra o terminal do Codespace (integrado no VS Code ou via interface web) e execute
    o comando para verificar a instalação do Docker:

        docker --version

    Resultado esperado:

        Exemplo: Docker version 20.10.17, build 100c701

    Se esse comando retornar a versão do Docker, significa que o Docker está instalado e funcionando no Codespace.

    Se não estiver instalado:

        No Codespace padrão, Docker já está disponível. Caso não esteja, verifique as configurações do ambiente 
        ou informe o administrador do repositório.

4. Criar e rodar o container PostgreSQL

    Para iniciar o PostgreSQL em um container Docker dentro do Codespace, execute o comando abaixo:


    docker run --name postgres-codespace -e POSTGRES_PASSWORD=sua_senha -e POSTGRES_DB=nome_seu_banco -p 5432:5432 -d postgres

    Explicação dos parâmetros:
        
        --name postgres-codespace: nome do container para facilitar o gerenciamento.

        -e POSTGRES_PASSWORD = suasenha: variável de ambiente que define a senha do usuário padrão postgres.
        Substitua suasenha por uma senha forte e segura.

        -e POSTGRES_DB = scp : variável que cria automaticamente um banco de dados chamado laudinho ao iniciar o container.

        -p 5432:5432: mapeia a porta 5432 do container para a porta 5432 do Codespace, permitindo conexão externa.

        -d postgres: especifica a imagem oficial do PostgreSQL e roda o container em modo "detach" (em segundo plano).

5. Confirmar se o container está rodando

    Verifique se o container foi iniciado corretamente com:

        docker ps

    Esse comando lista todos os containers ativos. Você deve ver uma linha parecida com:


    CONTAINER ID   IMAGE      COMMAND                  CREATED        STATUS       PORTS                    NAMES
    abcd1234efgh   postgres   "docker-entrypoint.s…"   2 minutes ago  Up 2 minutes 0.0.0.0:5432->5432/tcp   postgres-codespace

    Se o container aparecer listado e com status Up, seu PostgreSQL está rodando.

6. Conectar ao PostgreSQL via terminal dentro do Codespace

    Para interagir com o banco via terminal, você pode usar o cliente psql. Caso não tenha o cliente instalado, execute:


    sudo apt update
    sudo apt install -y postgresql-client

    Depois, conecte-se ao banco com o comando:

        psql -h localhost -U postgres -d scp

    -h localhost: host onde o banco está rodando (localhost, pois está dentro do Codespace).

    -U postgres: usuário padrão do PostgreSQL.

    -d laudinho: banco de dados que foi criado no container.

    Ao executar, será solicitada a senha (aquela que você definiu em POSTGRES_PASSWORD). Digite a senha e pressione Enter.

    Se conectar com sucesso, verá o prompt do PostgreSQL, por exemplo:

        psql (14.2 (Ubuntu 14.2-1.pgdg22.04+1))
    
        nome_seu_banco=#    

    Digite "help" para ajuda.

7. Instalar a extensão PostgreSQL no VS Code

    Para facilitar a gestão do banco, use a extensão oficial do PostgreSQL para VS Code.

    Passos:
        
        No VS Code (seja local ou no Codespace), clique no ícone de Extensões (lado esquerdo, ícone de quadrados empilhados).

        Na barra de busca, digite PostgreSQL.

        Encontre a extensão oficial, normalmente identificada pelo ícone do elefante azul e desenvolvida pela Microsoft ou ms-ossdata.

        Clique em Instalar.

        Após instalação, a extensão estará disponível no painel lateral esquerdo.

8. Conectar ao banco PostgreSQL via extensão no VS Code
    
    Após instalar a extensão:

        Clique no ícone do banco de dados (🗄️) que aparece na barra lateral esquerda.

        Clique em Adicionar nova conexão (geralmente um botão “+” ou “Nova Conexão”).

    Preencha os dados da conexão:

        +---------+------------+----------------------------------------------+
        | Campo   | Valor      | Observações                                  |
        +---------+------------+----------------------------------------------+
        | Host    | localhost  | Como o container mapeia localhost no Codespace |
        | Porta   | 5432       | Porta padrão do PostgreSQL                   |
        | Usuário | postgres   | Usuário padrão                               |
        | Senha   | sua senha  | A mesma definida no POSTGRES_PASSWORD        |
        | Banco   | seu banco  | Banco criado no container                    |
        +---------+------------+----------------------------------------------+

    SALVER A CONEXÃO E CLIQUE EM CONNECT.

    Teste a conexão e, se tudo estiver correto, você poderá navegar pelas tabelas, 
    executar queries e gerenciar o banco direto pelo VS Code.

9. Comandos úteis para gerenciamento do container

    Parar o container:

        docker stop postgres-codespace

    Iniciar o container parado:

        docker start postgres-codespace

    Acessar o terminal dentro do container (shell):

        docker exec -it postgres-codespace bash

    Remover o container (apaga dados se não estiver em volume persistente):


        docker rm -f postgres-codespace

10. Observações finais

    Persistência de dados: Por padrão, o banco dentro do container perde os dados quando o container é removido. 
    Para evitar isso, configure um volume Docker para persistência, exemplo:


        docker run --name postgres-codespace \
        -e POSTGRES_PASSWORD=suasenha \
        -e POSTGRES_DB=laudinho \
        -p 5432:5432 \
        -v pgdata:/var/lib/postgresql/data \
        -d postgres

    Segurança: Evite usar senhas fracas ou padrão em ambientes de produção.

    Performance: Codespaces é um ambiente em nuvem e pode ter limitações de performance comparado a uma instalação local.