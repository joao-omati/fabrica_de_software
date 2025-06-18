1. Contexto
    
    Esses documento tem o objetivo de lista todos comandos Docker úteis para cada grupo de desenvolvimento ele vai conter comandos para back-end, banco de dados e QA para facilitar
    no processo do trabalho e tentar diminuir o trabalho no processo.

2. Pré-requisitos

    Conta no GitHub com acesso a Codespaces.

    Utilizar 2 Núcles/Cores no codespace que é gratuito: limite de 60h por mês

        observação: Você pode criar um com 4 cores, mas aí é contigo kkkkk

    Docker instalado e configurado no Codespace (o Codespaces já vem com Docker instalado, mas é importante verificar).

    Permissões para executar comandos Docker dentro do Codespace.

    VS Code instalado localmente ou acesso ao editor via browser com Codespaces.
    
    3.Comandos para o back-end
        
        Para criar imagens docker para pyhton se usar

            docker build -t  minha-api-python
        
        Rodar o container para o app python

            Docker run -d -p 8000:8000 --name api-backend minha-api-python

            -d --> desaclopado, server para executar o container em segundo plano e os logs são exibidos no terminal.

            -p 8000:8000 --> e as portas onde o 1 número dita da onde vai puxar e o depois e onde vai rodar, ele direcionar a api-backend

            api-backend --> nomeia seu contêiner 

            minha-api-python --> e o nome da imagem que o docker usára para criar seu contêiner.

        Para debugar dentro do contêiner 

            docker exec -it api-backend bash

            -it --> para deixar mais interativo e alocar um pseudo-TTY, ter uma experiencia de terminal durante o processo de debugação

            api-backend --> nome do contêiner

            bash --> o comando executado dentro do contêiner, inicia um shell bash dando acesso a linha de comando

        Para rodas comando python dentro do contêiner 

            docker exec -it api-backend python manage.py migrate:
            entra no contêiner com modo interativorm, garante que os dados vão ta sempre atualizados.    

            docker exec -it api-backend python manage.py runserver 0.0.0.0:8000: inicia um servidor para o desenvolvimento da aplicação.

    4. Comandos para Banco de dados
        
        Para rodar o PostgreSQL

        docker run --name meu-postgres -e POSTGRES_PASSWORD=senha123 -e POSTGRES_USER=meuuser -e POSTGRES_DB=meubanco -p 5432:5432 -d postgres

        docker run: Comando para iniciar um novo contêiner.

        --name meu-postgres: Define o nome do contêiner como meu-postgres.

        -e POSTGRES_PASSWORD=senha123: Define a senha do usuário PostgreSQL como senha123.

        -e POSTGRES_USER=meuuser: Define o usuário do PostgreSQL como meuuser.

        -e POSTGRES_DB=meubanco: Cria um banco de dados inicial chamado meubanco.

        -p 5432:5432: Mapeia a porta 5432 da sua máquina para a porta 5432 do contêiner, permitindo a conexão externa.
        
        -d: Executa o contêiner em segundo plano (detached).

        postgres: A imagem Docker base a ser usada (PostgreSQL).


    






