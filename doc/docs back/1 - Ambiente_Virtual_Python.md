# INTRODUÇÃO
O objetivo deste documento registrar como criar um ambinete virtual com python


## Para quer serve o venv (Ambiente Virtual do python?)

O venv (Virtual Environment) serve para criar um ambiente isolado de Python dentro de um projeto. Ele resolve problemas comuns de dependências entre projetos e ajuda a manter tudo organizado.

## Por que usar venv?

1. Isolamento de dependências
Cada projeto pode ter suas próprias bibliotecas, versões específicas de pacotes, sem interferir em outros projetos.

Exemplo: Um projeto pode usar Django 4.2 e outro pode usar Django 3.2, sem conflito.

2. Organização
As bibliotecas instaladas via pip ficam dentro da pasta .venv/ e não poluem o sistema global.

3. Reprodutibilidade
Você pode usar requirements.txt para salvar as versões exatas dos pacotes, garantindo que qualquer desenvolvedor use o mesmo ambiente.

4. Segurança
Evita problemas ao instalar pacotes de forma global (especialmente em servidores ou containers).

## Como funciona? 

Quando você roda:

python -m venv .venv

### Ele cria a seguinte estrutura:

.venv/
├── bin/           # Scripts de ativação (Linux/macOS)
├── Scripts/       # (no Windows)
├── lib/           # Bibliotecas Python instaladas via pip
├── pyvenv.cfg     # Configuração do venv

Depois de ativar com source .venv/bin/activate, qualquer pip install será restrito a esse ambiente.

## Instanciando o nosso venv para criar o ambiente virtual:

- python3 -m venv venv  ou python -m venv venv 

obs.: se você estiver o python 3 instalado na sua máquina não precisa específicar com python3

## Ativando o nosso ambiente virtual 

- No Windows:

comando: .\venv\Scripts\activate.bat

- No linux ou MacOS: 

comando: source .venv/bin/activate

## Instalando as nossas libs específicas para esse ambiente virtul:
dentro da pasta onde tem o arquico requirements.txt use o comando:

pip install -r requirements.txt

ou manualmente com:

pip install nome_biblioteca

## desinstalando pacotes com pip no nosso ambiente virtual

use o comando: pip unistall nome_biblioteca

## saindo do ambiente virtul:
deactivate


