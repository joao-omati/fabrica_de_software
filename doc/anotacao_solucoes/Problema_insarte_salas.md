### data: 25/06/2025

# INTRODUÇÃO

O objetivo dessa documentação é trazer soluções ao encontrar problemas
na segunda versão do banco de dados: 2.0 

## Problema

A equipe de banco de dados encontrou um um possível problema que ao inserir dados null able que são específicos para reserva
que foram transferidos na entidade sala.

Imagine o seguinte:

a sala 201 foi cadastrada porém, lembre-se que ela possui três turnos: Manhã, tarde, Noite e dois periodos: Primeiro e Segundo
se fizermos uma permutação simples, para o banco de dados funcionar adequamente a sala deve ser inserida 6 vezes para turnos e periodos diferentes, exemplo:

| Nº Sala | Andar      | Bloco | Capacidade | TV (") | Período  | Turno   | Disponível |
|---------|------------|--------|------------|--------|-----------|---------|-------------|
| 101     | 1º Andar   | A      | 40         | 55     | Primeiro  | Manhã   | Sim         |
| 101     | 1º Andar   | A      | 40         | 55     | Segundo   | Manhã   | Sim         |
| 101     | 1º Andar   | A      | 40         | 55     | Primeiro  | Tarde   | Sim         |
| 101     | 1º Andar   | A      | 40         | 55     | Segundo   | Tarde   | Sim         |
| 101     | 1º Andar   | A      | 40         | 55     | Primeiro  | Noite   | Sim         |
| 101     | 1º Andar   | A      | 40         | 55     | Segundo   | Noite   | Sim         |
| 102     | 1º Andar   | A      | 40         | 55     | Primeiro  | Manhã   | Sim         |
| 102     | 1º Andar   | A      | 40         | 55     | Segundo   | Manhã   | Sim         |
| 102     | 1º Andar   | A      | 40         | 55     | Primeiro  | Tarde   | Sim         |
| 102     | 1º Andar   | A      | 40         | 55     | Segundo   | Tarde   | Sim         |
| 102     | 1º Andar   | A      | 40         | 55     | Primeiro  | Noite   | Sim         |
| 102     | 1º Andar   | A      | 40         | 55     | Segundo   | Noite   | Sim         |
| 103     | 1º Andar   | A      | 40         | 55     | Primeiro  | Manhã   | Sim         |
| 103     | 1º Andar   | A      | 40         | 55     | Segundo   | Manhã   | Sim         |
| 103     | 1º Andar   | A      | 40         | 55     | Primeiro  | Tarde   | Sim         |
| 103     | 1º Andar   | A      | 40         | 55     | Segundo   | Tarde   | Sim         |
| 103     | 1º Andar   | A      | 40         | 55     | Primeiro  | Noite   | Sim         |
| 103     | 1º Andar   | A      | 40         | 55     | Segundo   | Noite   | Sim         |


VEJA QUE PARA APLICAÇÃO FUNCIONAR DIREITO TEREMOS UM COMBINAÇÃO SIMPLES DE 6 POSSIBILIDADES PARA CADA ELEMENTO

## SOLUÇÃO 

Na aplicação na hora de cadastro de reservas colocar métodos para inserir tanto os dados das salas já retornados apartir do seu primeiro cadasto como os novos dados envidos pela tela reserva simultaneamente! É inviável fazer isso com UPDATE a não ser que seja para atualização de dados esepecícos 

CASO AS SALAS JA TENHA SIDO CADASTRADAS, FAZER UMA REGRA OU LOGICA QUE AO INVES DE INSERIR ATUALIZE DADOS ESPECÍFICOS NAQUELA SALA CADASTRADA