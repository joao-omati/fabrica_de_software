# Objetivo
Nesse documento vai mostrar as soluções necessarias para problemas que pode surgir durante a criação do ambiente virtual venv

## 1. Limitações por ser usuario windows

Caso esse erro apareça:

                .\test\Scripts\Activate.ps1 : O arquivo C:\Users\aluno\Desktop\Vitor_banco_dados\test\Scripts\Activate.ps1 não pode ser carregado porque a execução de scripts foi desabilitada neste sistema. Para obter mais informações, 
                consulte about_Execution_Policies em https://go.microsoft.com/fwlink/?LinkID=135170.
                No linha:1 caractere:1
                + .\test\Scripts\Activate.ps1
                + ~~~~~~~~~~~~~~~~~~~~~~~~~~~
                    + CategoryInfo          : ErrodeSegurança: (:) [], PSSecurityException
                    + FullyQualifiedErrorId : UnauthorizedAccess


Quando você usar o windows o power shell vem com algumas limitações de uso no terminal, e um deles e relacionado ao ambiente virtual do python e para resolver isso ser vai fazer alguns comando como administrado no seu windows com objetivo de liberar as funções necessarias para você rodar o comando.

Logo abaixo vai ter um script que ser deve rodar ele no power shell (no modo admin):

        Set-ExecutionPolicy -Scope CurrentUser -ExecutionPolicy RemoteSigned

Set-ExecutionPolicy: 
Este é o cmdlet (comando) do PowerShell usado para alterar as políticas de execução de scripts no Windows.

-Scope CurrentUser: 
Esta é a parte mais importante para a segurança e praticidade. Ela define que a nova política de execução se aplicará apenas ao seu usuário atual. 

Isso é excelente porque:
Não requer privilégios de Administrador: Você pode rodar este comando em um terminal PowerShell normal.

É mais seguro: 
Você não está alterando as configurações de segurança para todos os usuários da máquina, apenas para a sua conta.

-ExecutionPolicy RemoteSigned: 
Esta é a política que você está definindo. RemoteSigned significa o seguinte:

Scripts que você mesmo criou no seu computador (como o Activate.ps1, que foi criado pelo módulo venv) podem ser executados.

Scripts baixados da internet só poderão ser executados se forem assinados digitalmente por um editor confiável.

