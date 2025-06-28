# Anotações sobre a versão 4 do banco de dados Reserva de sala


## Tabela usuario
Vai ser mais de 3 usuarios como o previsto agora serão 7 e cada um com obrigações diferentes.
Dever conter a matricula de funcionario em cada um. e unico e obrigatorio 

## Tabela sala
O idsala vai ser com INTEGER (numero tipo inteiro usados em identificadores únicos),

Não vai ser o cpf do usario para corresponder a quem criou a sala e sim sua matricula de funcionario.

## Tabela saladispo
Vai ter o idsala para sabe qual salar se refere a disposição.

Matricula so vai ser prenchida ser a sala tive em disponibilidade FALSE para saber qual o motivo da sala ta indisponivel e qual funcionario ta fazendo "uso da sala".

motivo inativo para saber ser por causa de manutenção, uso administrativo e etc.

quando disponibilidade for false e obrigatorio que motivoinativo e obrigatorio ta preenchido, adjecente a isso a matricula do usario também deve ta preenchida.
    CHECK (disponibilidade = TRUE OR motivoinativo IS NOT NULL),
    CHECK (disponibilidade = TRUE OR matricula IS NOT NULL),

## Tabela periodo
Tabela multivalorado para poder atribuir os horarios que as salas disponiveis tão liberada e não criar duplicação

## Tabela curso
Para saber quais cursos estão exitentes na unieuro, para poder ter uso de salas.

## Tabela turma
Vai ser listado todas as turmas que se tem na unieuro. tem que ter as informações de perido , quantos alunos e a codigo da turma(padrão que a unieuro fornce).

## Tabela tursala 
Para facilitar a relação da turma com as salas, tem ideia que uma sala pode ter varias turma e turma pode ter varias sala ou seja uma ligação de muitos para muitos

## Tabela reserva 
E obrigatorios saber o autor da reserva.

    datainicial DATE DEFAULT CURRENT_DATE,
    datafinal DATE CHECK(datafinal >= datainicial OR datafinal IS NULL),
Dever sempre ter a data de inicio de fim de uma reserva.
O responsavel sala durante esse periodo da reserva.
situação vai fazer com que a sala se torna ocupada quando for feita uma reserva.

## Tabela diasemana
Vai ser uma tabela multivalorada para garantir que não faça uma grande permutação na criação de sala e na reserva. assim ele sera um "atributo".



