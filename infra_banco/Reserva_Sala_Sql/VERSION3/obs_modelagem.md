# OBSERVAÇÕES


## FOI PROPOSTO COLOCAR NA TABELA SALASDISPO: 

CONSTRAINT saladispo_unica_por_turno_periodo UNIQUE (idsala, periodo, turno)

e 

-- INDEX PARCIAL (também precisa ser evitado nesse caso)
CREATE UNIQUE INDEX saladispo_unica_ativa 
ON saladispo (idsala, periodo, turno) 
WHERE status = TRUE;


### PORQUE: 

    A CONSTRAINT uniq_saladispo_idsala_periodo_turno_status UNIQUE (idsala, periodo, turno, status)

    -- Esta constraint garante que cada sala tenha no máximo uma disponibilidade ativa registrada
    
    -- por combinação de período e turno, evitando duplicações que causariam conflitos na reserva.
    
    -- IMPORTANTE: Para suportar delete lógico corretamente e permitir registros inativos com as mesmas chaves,
    
    -- recomenda-se criar um índice único parcial que considere somente os registros ativos (ex: WHERE status = TRUE).
    
    -- Assim, múltiplos registros duplicados são permitidos apenas quando estão inativos (status = FALSE),
    
    -- garantindo integridade dos dados ativos e flexibilidade para manter histórico.
    CREATE UNIQUE INDEX saladispo_unica_ativa 
    ON saladispo (idsala, periodo, turno) 
    WHERE status = TRUE;


- COM CONSTRINT:

    +-------------+--------+----------+--------+-----------------+--------+
    | idsaladispo | idsala | periodo  | turno  | disponibilidade | status |
    +-------------+--------+----------+--------+-----------------+--------+
    |      1      |   1    | Primeiro | Manhã  |      TRUE       |  TRUE  |
    |      2      |   1    | Segundo  | Tarde  |      TRUE       |  TRUE  |
    |      3      |   2    | Ambos    |  NULL  |      TRUE       |  TRUE  |
    |      4      |   3    | Primeiro | Manhã  |      TRUE       |  TRUE  |
    |      5      |   1    | Primeiro | Manhã  |      TRUE       | FALSE  |  <-- duplicado inativo permitido
    |      6      |   1    | Primeiro | Manhã  |      TRUE       | FALSE  |  <-- duplicado inativo permitido
    +-------------+--------+----------+--------+-----------------+--------+


- SEM CONSTRINT:

        +-------------+--------+----------+--------+-----------------+--------+
        | idsaladispo | idsala | periodo  | turno  | disponibilidade | status |
        +-------------+--------+----------+--------+-----------------+--------+
        |      1      |   1    | Primeiro | Manhã  |      TRUE       |  TRUE  |
        |      2      |   1    | Segundo  | Tarde  |      TRUE       |  TRUE  |
        |      3      |   2    | Ambos    |  NULL  |      TRUE       |  TRUE  |
        |      4      |   3    | Primeiro | Manhã  |      TRUE       |  TRUE  |
        |      5      |   1    | Primeiro | Manhã  |      TRUE       |  TRUE  |  <-- duplicado ativo permitido (problema)
        |      6      |   1    | Primeiro | Manhã  |      TRUE       | FALSE  |  <-- duplicado inativo permitido
        +-------------+--------+----------+--------+-----------------+--------+

- Resumo: 

    -- Resumo da constraint com índice único parcial:
    -- Garante que não existam duas entradas ativas (status = TRUE) com a mesma combinação de idsala, período e turno.
    -- Permite múltiplos registros duplicados desde que estejam inativos (status = FALSE), facilitando o delete lógico.
    -- Evita conflitos na reserva garantindo integridade dos dados ativos.
    -- Mantém histórico de registros desativados sem bloquear inserções.
    -- Ideal para cenários onde o delete lógico é usado em tabelas de disponibilidade.


## PORÉM EU GUILHERME HENRIQUE LIDER TÉCNICO DE BANCO DE DADOS TIREI ESSA CONSTRINT PORQUE: 

### 🧑‍💼 Na tela de reserva, o usuário informa:

- Código da turma

- Turno

- Período

- Dias da semana (ex: Segunda, Terça etc.)

- Data inicial

- Data final

- Responsável

### 🧠 Regra de negócio:

Uma sala pode receber mais de uma turma ao mesmo tempo, no mesmo turno, período e dia da semana.
O controle de conflito de uso não depende apenas de turno e período, mas também:
dos dias da semana
do período de tempo (data inicial / final)
e da turma envolvida.

### ⚠️ Efeito da Constraint (ou índice único parcial)

CREATE UNIQUE INDEX saladispo_unica_ativa 
ON saladispo (idsala, periodo, turno) 
WHERE status = TRUE;

### ❌ Problemas com ela no seu cenário:

Impede mais de uma disponibilidade ativa com a mesma combinação sala + turno + período, mesmo que seja para finalidades diferentes (ex: dias distintos).
Isso quebra sua regra de negócio, pois impede reservar uma sala no mesmo turno para duas turmas diferentes, mesmo que isso faça sentido (por exemplo, se for em dias alternados ou horários divididos).
O usuário verá erro de duplicidade, mesmo que esteja tentando fazer algo permitido pela regra de negócio.

### ✅ Conclusão: Faz sentido manter a constraint?

Sua regra de negócio exige flexibilidade?	✅ Sim

A disponibilidade pode se repetir por turma, dia e data?	✅ Sim

A constraint impediria inserções válidas?	✅ Sim

Então faz sentido manter a constraint?	❌ Não

✅ Recomendação final
Não use a constraint nem o índice único parcial.

Controle conflitos de uso via lógica no backend (ex: validar sobreposição de datas, turnos e dias no momento do cadastro).

Isso permite:

✅ Maior flexibilidade

✅ Evitar falhas no cadastro de reservas válidas

✅ Garantir aderência total à experiência do front-end

