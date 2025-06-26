### data: 25/06/2025

# INTRODUÇÃO

O objetivo dessa documentação é trazer soluções ao problema apresentado
na primeira versão do banco de dados 

## Problema mostrado:

- Segundo a lider da equipe de documentação os dados, campos a serem passados na tela de reserva são:

TELA CADASTRAR RESERVA

| Responsável      | Código da Turma | Turno  | Período  | Data Início | Data Fim   | Dia Semana  |
|------------------|------------------|--------|----------|-------------|------------|------------|
| Professor Paulo  | AJBS123          | Manhã  | 1º       | 01/08/2025  | 15/12/2025 | Quinta     | 


Na hora de consultar salas, nossa cliente que saber dos seguintes dados:

TELA SALAS 

| Andar     | Bloco | Número da Sala | Capacidade | Tamanho TV | Disponibilidade |
|-----------|--------|----------------|------------|------------|-----------------|
| 1º andar  | A      | 201            | 50         | 55"        | Sim             |


Na primeira modelagem a situação ('disponibilidade') da turma ficava na entidade sala, com isso ao modificar a situação dela
mudava para todos os horários reservados e de todos os turnos, e a nossa cliente não quer isso. Ela que poder saber quais turmas 
estavam reservadas para o periodo ou segundo periodo daquele turno, naquela exemplo:

TELA SALAS RESERVADAS: 

andar,bloco, numero sala, codturma, periodo, responsavel

| Andar     | Bloco | Número da Sala | Cód. Turma | Período   | Responsável      | Situação   |
|-----------|--------|----------------|------------|-----------|------------------|------------|
| 1º andar  | A      | 201            | AJBS123    | Primeiro  | Professor Paulo  | Reservado  |


## Solução realizada: 

Foi feito uma Remodelagem do banco de dados os seguintes dados são aramzenados na entidade sala:

disponibilidade,
periodo
turno 

Os dados que ficaram na entidade reservas são:

idturma = NULLABLE, APENAS PUXAR TURMAS CADASTRADAS POSTERIORMENTE, PORÉM AGORA NÃO É OBRIGATÓRIO
cordturma = informativo
diasemana
data inicial 
data final  
responsavel
descricao = NULLABLE NÃO É OBRIGATÓRIO COLOCAR UMA DESCRIÇÃO
situação = Acrescentado, boolean, true = Reservado, false = Livre