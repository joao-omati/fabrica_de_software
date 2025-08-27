1 - Contexto

    Ao tentar conectar ao banco PostgreSQL usando:


        psql -h localhost -U postgres -d laudinho

    Recebe o erro:

        psql: error: could not connect to server: Connection refused
        Is the server running on host "localhost" (::1) and accepting
        TCP/IP connections on port 5432?

    E comandos como sudo service postgresql start falham com unrecognized service ou unknown user: postgres.

    1.1 - Causas:

        No Codespace, o cliente psql pode estar instalado, mas o servidor PostgreSQL não está ativo,
        pois o serviço não está rodando ou nem foi instalado.

2 - Soluções: 


    1 Solução: Usar ou ativar um container inativo

        Passo 1: Verificar containers inativos (parados)

            Primeiro, para ver todos os containers — incluindo os parados — use o comando:

                docker ps -a

            A saída vai listar todos os containers, com um status que indica se estão ativos ou parados.
            Exemplo de saída:


                CONTAINER ID   IMAGE      COMMAND                  CREATED         STATUS                     PORTS                    NAMES
                37062ccbda77   postgres   "docker-entrypoint.s…"   2 hours ago     Exited (0) 5 minutes ago    0.0.0.0:5432->5432/tcp   postgres-codespace

            No exemplo acima, o container postgres-codespace está parado (status Exited).
                
        Passo 2: Reativar (iniciar) um container inativo:

            Para iniciar um container que está parado, use o comando:

                docker start <container_name_or_id>

            Por exemplo, se você quiser iniciar o container postgres-codespace, basta rodar:

                docker start postgres-codespace

            Esse comando vai iniciar o container novamente, mas não abre uma sessão interativa nele.
        
        Passo 3:  Conectar ao container (abrir uma sessão)

            Para entrar no container e executar comandos diretamente nele, você pode usar o docker exec ou docker attach:

                Usando docker exec (mais recomendado para interagir com o container):

                    Para executar comandos dentro do container, como abrir um shell psql ou bash:

                        docker exec -it postgres-codespace psql -U postgres -d laudinho
                
                Ou, se você quiser uma shell bash:

                    docker exec -it postgres-codespace bash

            Usando docker attach (menos comum para containers com shells):

                docker attach postgres-codespace
            
            Para sair de um container sem matá-lo, pressione Ctrl + P + Q.
        
        
        Passo 4: Verificar logs do container (se necessário):

            Se você está tendo problemas com o container e quer ver mais detalhes, use:

                docker logs <container_name_or_id>

            Exemplo:

                docker logs postgres-codespace

            Isso te mostra os logs do container, o que pode ajudar a diagnosticar
            se algo deu errado durante a inicialização.
            

    2 Solução: Rodar PostgreSQL dentro de um container Docker


        Passo 1: Rodar o container PostgreSQL

            docker run --name postgres-codespace \
            -e POSTGRES_USER=postgres \
            -e POSTGRES_PASSWORD=123456 \
            -e POSTGRES_DB=laudinho \
            -p 5432:5432 \
            -d postgres

            Este comando:

                Cria um banco chamado laudo

                Define usuário postgres com senha postgres

                Expõe a porta 5432 para conexões
        
    Passo 2: Verificar se o container está rodando

        use o comando: docker ps

        Verifique que o container postgres-laudo está ativo e escutando na porta 5432.


    Passo 3: Conectar ao banco PostgreSQL

        psql -h localhost -U postgres -d laudo

        Quando solicitado, informe a senha:

        exemplo: 123456

    Passo 4 (Opcional): Acessar o shell do PostgreSQL dentro do container


        Para abrir o prompt do banco diretamente dentro do container, execute:

            docker exec -it postgres-laudo psql -U postgres -d laudo



    NOTAS ADICIONAIS:

        Se preferir, crie um arquivo docker-compose.yml para orquestrar o container de forma fácil.

        Lembre-se de iniciar o container toda vez que o Codespace for reiniciado, pois o ambiente é temporário.

        Caso queira persistência dos dados, monte um volume Docker para o diretório de dados do PostgreSQL.

        EXEMPLO DE UM ARQUIVO DOCKER  COMPOSER: 

                version: '3.8'
                services:
                db:
                    image: postgres
                    container_name: postgres-laudo
                    environment:
                    POSTGRES_USER: postgres
                    POSTGRES_PASSWORD: postgres
                    POSTGRES_DB: laudo
                    ports:
                    - "5432:5432"
                    volumes:
                    - pgdata:/var/lib/postgresql/data

                volumes:
                pgdata:

        execute:

            docker-compose up -d

3 - Conclusão:

    Com essa configuração, seu PostgreSQL estará rodando isoladamente no container e sua aplicação
    no Codespace poderá se conectar sem problemas.