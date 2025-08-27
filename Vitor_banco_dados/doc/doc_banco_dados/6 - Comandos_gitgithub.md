Essa anotação visa explicar os comandos do git-github sem sem apronfundar
apenas uma revisão:


1 - CONFIGURAÇÃO BÁSICA PARA CONECTAR O GIT A SUA CONTA NO GITHUB, SEJA MÁQUINA PESSOAL OU PÚBLICA: 

    git config --global user.name "Seu Nome" -> Aqui você vai colocar o nome que tem no seu perfil do GitHub

    git config --global user.email "seu@email.com" -> Aqui você vai colocar o email que você cadastrou no GitHub

2 - VERIFICAR QUAL PERFIL QUE O GIT ESTÁ CONECTADO SEJA MÁQUINA PUBLICA OU GLOBAL:

    git config --global --unset user.name -> Ao usar esse comando irá retornar o nome da conta do github

    git config --global --unset user.email -> Ao usar esse comando irá retornar o email da conta do github

3 - REMOVER SEU GIT LOCAMENTE NA MÁQUINA PÚBLICA OU PESSOAL:

    - Use os comandos um depois o outro:

        git config --unset user.name 
        
        git config --unset user.email 
    

4 - DELETAR TOKENS SALVOS PELO VSCODE (CASO USE):

    No VSCode, abra Command Palette (Ctrl + Shift + P)

    Busque por: Git: Logout

    Confirme para sair

5 - REMOVER CHAVES SSH (CASO ESTEJE USANDO SSH):

    rd /s /q nome-da-pasta-clonada

6 - COMANDOS BÁSICOS DO GIT:

    git init -> Cria um reposiótio novo no GIT

    Exemplo prático:

        mkdir meu_projeto -> cria uma pasta para o seu projeto
        cd meu_projeto -> navegar até essa pasta 
        git init -> cria um novo repositório 

    git status -> Basicamente fornece informaçõe sobre o status do seu repositório no GIT

    git add . -> Adiciona todos os arquivos modificados ao seu repositório GIT

    git add <nome_arquivo> -> Adiciona um arquivo específico ao seu repositório GIT

    git commit -m "menssagem" -> cria um commit, que é um registro das mudanças feitas 
    nos arquivos adicionados ao staging area. A flag -m "msg" permite adicionar uma mensagem descritiva ao commit.


    git log -> Mostra o último commit feito e suas informações 
 
    git log online -> Mostra cada commit feito em linhas contendo informações r

    Opções úteis

        git log --graph  -  Mostra a estrutura do histórico visualmente.
        git log --author="Nome" - Filtra commits por autor.
        git log -n 5 - Exibe apenas os 5 commits mais recentes.
        git log --since="2 days ago"- Mostra commits dos últimos 2 dias


7 - Trabalhando com Branchs:

    git branch nome-da-branch  # criar uma nova branch

    git checkout nome-da-branch # Para alternar para uma branch existente

    git switch nome-da-branch # se estiver usando uma versão mais recente do Git

    git checkout -b nome-da-branch # pode criar e alternar para a branch ao mesmo tempo

    git switch -c nome-da-branch #  na versão mais recente do Git

    git branch # Para listar todas as branches locais, A branch ativa será marcada com *

    git branch -r # Ver branches remotas
 
    git branch -a # Para listar todas (locais + remotas):

8 - Fazendo merge entre as branchs

    git merge -> mescla alterações

    git merge nome-da-branch -> mescla alterações em uma branch específica

    ATENÇÃO: NUNCA FAÇA UM MERGE DE UMA BRANCH (SUB-BRANCH) PARA MAIN

    - Todo código precisa ser revisado e testado antes de entrar na main;

    ATENÇÃO: SE SEU CÓDIGO ESTIVER DESATUALIZDO EM RELAÇAO AO MAIN:
    FAÇA UM MERGE DA MAIN PARA A SUA BRACNH (SUB-BRANCH)

    Durante o desenvolvimento, traga as mudanças da main para sua feature branch para manter ela atualizada:

        git checkout minha-feature(branch)
        
        git fetch -> Baixa as mudanças sem aplicá-las. Você pode analisá-las antes de atualizar sua cópia local.
        
        git merge main

    Para concluir a tarefa, você deve fazer merge da sua feature branch para a main, mas nunca diretamente!. 
    Isso é feito via Pull Request (PR) ou revisão de código.

9 - REMOÇÃO DE BRANCH:

    git branch -d nome-da-branch # Excluir uma branch local

    git branch -D nome-da-branch # Forçar a exclusão

    git push origin --delete nome-da-branch # Excluir uma branch remota

10 - COMANDOS BÁSICOS DO GITHUB:

    git remote add origin <url> -> Conecta ao GitHub na url específica, ou na sua própria url
    
    git clone  <url>  -> clona um repositório GitHub no seu repositório local do Git

    git pull -> Baixa alterações feitas na brach ou naquele repositório específico, é um padrão de projeto (boa prática )
    sempre fazer um git pull para adquirir as atualizações feitas por outros membros que estão trabalhando na mesma branch 

    git fetch -> Busca atualizações do repositório remoto, mas não aplica essas mudanças automaticamente ao seu repositório local. 
    Ele é útil para ver o que mudou no remoto antes de atualizar sua cópia local.
   
    ATENÇÃO: NÃO FAÇA GIT PUSH DIRETAMENTE NA MAIN, A NÃO SER QUE SEJA UM PROJETO PESSOAL

    git push -u origin <nome_da_sua_branch> -> Envia Branch para GitHub, é uma boa prática sempre fazer assim que terminou de trabalhar no projeto.
     


11 - COMO PEGAR PASTAS, ARQUIVOS OU DOCUMENTOS DE OUTRAS BRANCHS NO REPOSITÓRIO DO GIT GITHUB UTILIZANDO O GIT?

    Siga o passo a passo abaixo:

        1. Garanta que você tem todas as branches atualizadas
        
            Se a branch de origem está no GitHub (remota), rode:

                git fetch origin

        2. Verifique o nome da branch de onde você quer pegar o conteúdo

            Exemplo: pegar o arquivo da branch main

        3. Use o comando git checkout para pegar o arquivo

            Você pode pegar um arquivo específico com:

                git checkout origin/main -- caminho/para/o/arquivo.ext
        
                    Ou uma pasta inteira com:
        
                git checkout origin/main -- caminho/para/pasta/

        4. Adicione e confirme as mudanças

            git add caminho/para/o/arquivo.ext

            git commit -m "Adicionado arquivo da branch main"



12 - COMO AVANÇADOS:

    git stash  -> Salva alterações permite guardar alterações temporariamente sem fazer um commit. 
    Isso é útil quando você precisa alternar de branch ou trabalhar em outra tarefa sem perder seu progresso atual.

    git stash list -. Isso exibe uma lista de alterações salvas. 

    git stash drop stash@{n} -> Onde n é o índice do stash na lista

    git stash pop -> Restaure as alterações salvas no stash e remova esse stash da lista. Isso recupera a última alteração salva no stash.
    
    git stash apply stash@{n} -> Se quiser aplicar um stash específico sem removê-lo da lista, use
    
    git rebase -> permite reorganizar commits ao aplicar mudanças de um branch sobre outro. É útil para manter um histórico limpo.
    
    git cherry-pick <hash> -> Esse comando permite copiar um commit de um branch para outro sem trazer todos os commits da sequência
    
    git revert <hash> -> Diferente do git reset, git revert cria um novo commit que inverte as alterações de um commit anterior.

    git reset --hard <hash> -> Reverte seu repositório completamente para um estado anterior, apagando todas as mudanças posteriores. 

    exemplo: git reset --hard a1b2c3d

    Isso descarta todas as alterações e redefine o histórico para o commit a1b2c3. 
    Cuidado: As alterações serão perdidas se não forem salvas antes!
