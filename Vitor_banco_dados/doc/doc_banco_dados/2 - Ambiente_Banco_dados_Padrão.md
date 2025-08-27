# Documentação de Ambiente – Banco de Dados

1. Contexto
    
    Este documento tem como objetivo registrar as ferramentas e configurações necessárias para a construção
    e manutenção do ambiente de banco de dados utilizado nos projetos da equipe. A padronização do ambiente
    garante consistência entre desenvolvedores e facilita o onboarding de novos membros.

2. Pré-Requisitos
    
    Antes de iniciar a configuração do ambiente, verifique se todas as ferramentas listadas abaixo estão instaladas na sua máquina:

    # PostgreSQL – Versão 14 ou superior
        
        Função: SGBD principal do ambiente.

        Download oficial: https://www.postgresql.org/download/

        Verificação:

            psql --version

        Resultado esperado: psql (PostgreSQL) 14.x ou superior.

    # PgAdmin (interface gráfica para PostgreSQL)
        
        Função: Interface web amigável para gerenciar o banco de dados.

        Download oficial: https://www.pgadmin.org/download/

        Verificação:

            Basta abrir o aplicativo e acessar via navegador.

            A versão pode ser verificada no canto inferior da página inicial.

    # Git – Versão 2.44.0.windows.1 ou superior

        Função: Controle de versão e sincronização com repositórios no GitHub.

        Download oficial: https://git-scm.com/downloads

        Verificação:

            git --version
        
        Resultado esperado: git version 2.44.0.windows.1 ou superior.

    # Conta no GitHub
        
        Função: Acesso aos repositórios de código e gerenciamento de versionamento.


3 - Ação necessária:

    Criar uma conta em https://github.com caso ainda não tenha.

    Configurar o Git com suas credenciais:

        git config --global user.name "Seu Nome"
        git config --global user.email "seu@email.com"


4 - Instalar a extensão PostgreSQL no VS Code (OPCIONAL PORÉM INTERESSANTE)

    Para facilitar a gestão do banco, use a extensão oficial do PostgreSQL para VS Code.

    Passos:
        
        No VS Code (seja local ou no Codespace), clique no ícone de Extensões (lado esquerdo, ícone de quadrados empilhados).

        Na barra de busca, digite PostgreSQL.

        Encontre a extensão oficial, normalmente identificada pelo ícone do elefante azul e desenvolvida pela Microsoft ou ms-ossdata.

        Clique em Instalar.

        Após instalação, a extensão estará disponível no painel lateral esquerdo.

5. Conectar ao banco PostgreSQL via extensão no VS Code
    
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