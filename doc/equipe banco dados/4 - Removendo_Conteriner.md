1 - Removendo um conteiner que já possui um  nome em uso no sistema

    O erro que você encontrou é porque já existe um container com o nome postgres-codespace
    em uso no seu sistema:

        docker: Error response from daemon: Conflict. The container name "/postgres-codespace" is already in use by container "37062ccbda773bb95784558a58fa1062325f62a239e1961e4a6d0f1af5538754".

    O Docker não permite que dois containers tenham o mesmo nome. Para resolver isso, você tem algumas opções:

        1.1 - Remover o container existente:

            Se você não precisa do container que está em uso, pode removê-lo com o comando:
    
                docker rm -f postgres-codespace

        1.2 - Renomear o container ao rodá-lo:

            Se você não quer remover o container existente, pode apenas alterar o nome do novo 
            container que está tentando rodar. Por exemplo, altere o nome de postgres-codespace 
            para algo como postgres-codespace-2:

                Isso cria um novo container com um nome diferente.
        
        
        1.3 - Verificar containers existentes

            Se você não souber qual container está usando o nome, pode listar todos os containers
            ativos e inativos com:

                docker ps -a

            Isso vai te mostrar todos os containers (mesmo os parados), para que você possa 
            decidir qual remover ou modificar.
