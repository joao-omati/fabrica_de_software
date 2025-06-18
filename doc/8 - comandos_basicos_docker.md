#Comandos básios de Docker 

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
    
3. Comandos 

    Abra o terminal do Codespace (integrado no VS Code ou via interface web) e execute
    o comando para verificar a instalação do Docker:

        docker --version

    Resultado esperado:

        Exemplo: Docker version 20.10.17, build 100c701

    Para exporta uma images se usa:

        Docker pull [image]
    
    Para listar todas as images se usar:

        Docker image 

    Uns dos comandos mais imporatantes e o run ele e usado para criação de novos containers baseado em images que você quer:

        Docker docker run [opções] [imagem] [comando]: Este é um dos comandos mais importantes. Ele cria e inicia um novo contêiner a partir de uma imagem.

            -d: Roda o contêiner em segundo plano (detached mode).
            -p [porta_host]:[porta_container]: Mapeia uma porta do seu Codespace para uma porta dentro do contêiner, permitindo que você acesse o serviço rodando no contêiner.
            --name [nome_contêiner]: Atribui um nome ao seu contêiner para facilitar a identificação.

            Exemplo: docker run -d -p 8080:80 --name meu-nginx nginx
    
    Comando para listar todos os contêines:

            Docker ps

            -a incluir os contêines que foram parados
    
    Comando para um contêiner em execução.

        docker stop [ID_contêiner_ou_nome]: 
        Exemplo: docker stop meu-nginx ou docker stop [ID_do_contêiner]

    Comando inicia um contêiner que foi parado.

        docker start [ID_contêiner_ou_nome]:
        Exemplo: docker start meu-nginx

    Comando reinicia um contêiner.

        docker restart [ID_contêiner_ou_nome]:
        Exemplo: docker restart meu-nginx
    
    Comando remove um contêiner parado. Você não pode remover um contêiner em execução, primeiro pare-o.
    
        docker rm [ID_contêiner_ou_nome]:
        Exemplo: docker rm meu-nginx

    Comando remove uma imagem Docker. Certifique-se de que nenhum contêiner esteja usando a imagem antes de tentar removê-la.

        docker rmi [ID_imagem_ou_nome]:
        Exemplo: docker rmi nginx
    
    Comando exibe os logs de um contêiner. Útil para depurar problemas.

        docker logs [ID_contêiner_ou_nome]: Exibe os logs de um contêiner. Útil para depurar problemas.
        Exemplo: docker logs meu-nginx

    Comando executa um comando dentro de um contêiner em execução.

        docker exec -it [ID_contêiner_ou_nome] [comando]: 
        -it: Permite uma sessão interativa (como um terminal).
        Exemplo: docker exec -it meu-nginx bash (abre um terminal Bash dentro do contêiner Nginx)
    
    Comando constrói uma imagem Docker a partir de um Dockerfile no diretório atual (.).

        docker build -t [nome_da_imagem] .: 
        Exemplo: Se você tiver um Dockerfile no seu projeto, navegue até o diretório e use: docker build -t meu-app-customizado.


