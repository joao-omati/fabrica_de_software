
## Dados importantes que devem ser retornados 

A cliente precisa saber, por turno, período, dia da semana, data de início e fim, quais salas estão ocupadas e quais estão livres, após a reserva ser criada.

✅ Objetivo da modelagem
Permitir monitoramento automatizado da disponibilidade das salas;

Garantir que após a reserva ser criada, a sala se torne indisponível;

Permitir saber quais dias/turnos/horários estão livres para novas reservas;

Manter histórico e flexibilidade sem comprometer o modelo lógico


| idsala | numerosala | andar | bloco | turno | período  | dias\_semana           | turma | data\_inicial | data\_final | status  |
| ------ | ---------- | ----- | ----- | ----- | -------- | ---------------------- | ----- | ------------- | ----------- | ------- |
| 1      | 101        | 1     | A     | Manhã | Primeiro | Segunda, Terça         | FIO02 | 2025-07-01    | 2025-07-31  | Ocupada |
| 2      | 102        | 1     | A     | Manhã | Primeiro | Segunda                | -     | -             | -           | Livre   |
| 3      | 201        | 2     | B     | Manhã | Primeiro | Segunda, Quarta        | ADS01 | 2025-07-01    | 2025-07-31  | Ocupada |
| 4      | 202        | 2     | B     | Manhã | Primeiro | Segunda, Quinta, Sexta | -     | -             | -           | Livre   |
| 5      | 301        | 3     | C     | Manhã | Primeiro | Segunda                | FIO01 | 2025-07-10    | 2025-07-20  | Ocupada |
| 6      | 302        | 3     | C     | Manhã | Primeiro | Segunda, Terça, Quarta | -     | -             | -           | Livre   |
| 7      | 401        | 4     | D     | Manhã | Primeiro | Segunda                | MEC03 | 2025-07-05    | 2025-07-25  | Ocupada |
| 8      | 402        | 4     | D     | Manhã | Primeiro | Segunda, Quinta        | -     | -             | -           | Livre   |
| 9      | 501        | 5     | E     | Manhã | Primeiro | Segunda                | FIO02 | 2025-07-01    | 2025-07-31  | Ocupada |
| 10     | 502        | 5     | E     | Manhã | Primeiro | Segunda                | -     | -             | -           | Livre   |
