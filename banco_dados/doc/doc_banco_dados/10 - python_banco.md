# Objetivo
Este documento tem o objetivo de listar as bibliotecas necessárias para ajudar a equipe de Banco de Dados a trabalhar com simulações, transferências de dados, entre outras atividades. As bibliotecas apresentadas são para a linguagem de programação Python, por ser a mais utilizada na área de Ciência de Dados. Todas são gratuitas, de código aberto e possuem vasta documentação online.

## 1. Isolar o ambiente

a. Isolar o ambiente no computador pessoal e muito importante para evitar comflitos e problemas no seu computador e não ter que formatar ele depois.

A.1- Antes de instalar todas bilbiotecas direto no seu computador pessoal vai fazer um ambiente virtual venv para evitar os conflitos.

Passo a Passo:
1. verificar ser o python estar instalado e qual e a versão dele para isso ser vai usar o comando 

    python --version

2. Com a pasta do projeto selicioanada você dever fazer o seguinte comando para criar o ambiente virtual venv 
    
    python -m venv [nome_do_seu_ambiente]

Apos isso ser vai verifivar se foi criado uma pasta no diretorio com o nome que você colocou no seu ambiente virtual agora.

3. Agora para entrar no ambiente venv você fara o seguinte comando
Caso der erro no comando tente consulta o arquivo 11. que explicar erros que pode acontecer no processo e ele mostra as soluções.

    .\[nome_do_seu_ambiente]\Scripts\Activate.ps1

4. Apos isso quando você criar um arquivo .py no seu repositorio ele vai pergunta qual e o interprete que ser vai usar e apartir dele ser escolher o python com tem o nome do seu ambiente entre paratense logo em frente, Exemplo:
    Python 3.8.5 32-bit ('env'; [nome_do_seu_ambiente])

Após isso depende do eu computador vai pedir algumas instalações mais pode aparta para install com segurança nesses install:
após isso toda vez que ser entrar no projeto e rodar codigo nele vai automaticamente puxar ambiente virtual então não precisa se preocupar
agora para instalar lib nesse seu ambiente virtual basta no prorprio terminal do vscode ou codespace no ambiente escrever 
    pip install [nome_da_biblioteca].

tudo que foi explicado na situação A pode ser visto nesse link do youtube --> https://www.youtube.com/watch?v=m1TYpvIYm74

B. No caso de codespace principalmente na sua branch no Softhub não e obrigatorio a isolação pois ja um ambiente virtual para isso e voltada para esse projeto.

b.1 No caso do codespace se pode instalar direto nele ou instalar dentro do docker, como nesse ambiente vamos mexer com postgres e vai ser dentro do docker vai ter que sempre for instalar algo iniciar o container para toda a criação de um ambiente postgres bastar consultar os documentos 2 que eles vão mostrar como prepara todo o ambiente


## Bibliotecas

### Psycopg2

Comando para instalação:

    pip install psycopg2

Essa lib e um tradutor universal da linguagem python para linguagem do Postgresql mais serve para grande maioria pois ela traduz comandos sql.
Além disso ela ajudar no caminho ou seja durante todo o fluxo o de requisição e resposta garantindo que nunca fique uma ação pela metade ou vai ou não vai.
e garante uma conexão aberta e fechada limpa

Ela sempre vai ser essencial pois e ela que dar maior suporte a toda uma pesquisa de dados principalmente usando pandas e SQLAlchemy.
E considerado o padrão de fato para comunicação com o banco de dados postgresql. Que combinado com  garante tudo relacionado a banco de dados uma conexão segurar e limpa. 
toda e qualquer duvida existe uma ampla documentação na comunidade de como isar essa lib.

### SQLAlchemy

Comando para instalação:

    pip install sqlalchemy

Ele permite uma maior interpretação da linguagem SQL combinado com psycopg2, que permite usar comando sql como INSERTS E UPDATES no python para poder modificar o banco de dados isso ajudar muito para poder pegar dados e fazer analise deles no back-end depois retorna para o front ou até mesmo para o terminal.
Ajudar principalmente na comunicação com pandas. O ORM permite que desenvolvedores e analistas foquem na lógica de negócio em Python, em vez de ficarem constantemente escrevendo e depurando longas strings de SQL.  Quando for para produção, você pode trocar a "string de conexão" para um servidor PostgreSQL ou MySQL robusto, sem mudar uma única linha da sua lógica de negócio. Essa flexibilidade é crucial em ambientes corporativos.

### Pandas

Comando para instalação:

    pip install pandas

Pandas e um DataFrame para analise e manipulação de dados. funcionar como uma planilha excel ou uma tabela de banco de dados, tudo isso dentro do seu codigo python. permite uma estrutura por grande dentro do python com inhas colunas, nomes e indices.
Com esse formato eficiente permite fazemos tudo que faria numa tabela ou nun excel. E permite a leitura desses formatos como  tabelas excel (.csv  e .xlsx) e tabelas de bancos como (.json, .parquet). Trouxe opçoes de filtagrens na tabela como limpeza de dados garantindo integridade dos dados e e capaz de criar novas colunas apartir de outras ou da interação das outras como:
    lucro = venda - custo

Permite agrupações e ate mesmo JOINs do sql ou seja fazendo uma grande tabela de informações.
pandas não é apenas uma biblioteca, é o ambiente de trabalho para qualquer pessoa que manipula dados em Python. É o canivete suíço que usamos 90% do tempo, e a base sobre a qual todo o trabalho de análise e modelagem é construído.

### Faker

Comando para instalação:

    pip install Faker

Até agora foi bibliotecas foi para analisa dados, agora essa ja tem uma utilidade diferente e para testar tabelas ou seja banco de dados para saber se o banco tem integridade esse lib permite gerar dados fakes de varios tipos e varias linguas ou seja durante a fazer de criação de databases e test de capacidade e integridade essa bibliotecas permite fazer um prenchimento de forma incrivel.
Onde quando bem usado alem de gerar dados com loops e limitações poder fazer um banco de dados com "informações" apenas alguns loops e config na lib faz tudo isso.


## Dever aprender para ser um bom profissional (devo fazer uma documentação depois)

Docker -- E essencial para poder ter uma boa etica de trabalho e conseguir trabalhar de qualquer lugar.
git -- E essencial para ter boa convivencia com a equipe e garanti um bom versionamento de codigo.
pl/pgsql -- linguagem de programção dentro do banco de dados principalmente para triggers e functions.
linux -- E a vida muitas tecnologias foi feita por causa dele como VM , docker. tirando no mercado de desktops o linux dominar todo resto em supercoputadores , celulares.
VM -- Sistemas virtuais permite fazer estudos e softwares em virtual machine o que permite não inteferir no seu pessoal e também ajudar a trabalhar de qualquer lugar.
