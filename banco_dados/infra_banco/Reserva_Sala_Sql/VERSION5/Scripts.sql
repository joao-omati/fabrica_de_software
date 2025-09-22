CREATE OR REPLACE FUNCTION inserir_reserva02(
    p_matriculauser INTEGER,
    p_codturma VARCHAR(255),
    p_datainicial DATE,
    p_datafinal DATE,
    p_numerosala INTEGER,
    p_nomebloco CHAR(1),
    p_turno VARCHAR(25),
    p_responsavel VARCHAR(255),
    p_periodos BOOLEAN[], -- Array com 5 posições: [primeiro, segundo, terceiro, quarto, integral]. Foi escolhido array para nao ter uma permutacao na insert
    p_diasemana BOOLEAN[] -- Array com 7 posições: [segunda, terca, quarta, quinta, sexta, sabado, domingo]
) --todos entre parentese sao dados de entradas e cada um vai ser tratado e depois levado a sua tabela correspondente.
RETURNS INTEGER AS $$
DECLARE
    v_idreserva INTEGER;
    v_idreservasala INTEGER;
    v_idperiodo INTEGER;
    v_idsala INTEGER;
    -- esses variaveis , serve para armazenar temporariamente os ID para facilitar a insercao deles nas outras tabelas(coisa necessarias pois uma reserva preencher varias tabelas de uma so vez).
BEGIN
    -- Validações iniciais
    IF p_matriculauser IS NULL THEN
        RAISE EXCEPTION 'matriculauser não pode ser NULL.';
    END IF;
    IF p_codturma IS NULL THEN
        RAISE EXCEPTION 'codturma não pode ser NULL.';
    END IF;
    IF p_nomebloco IS NULL THEN
        RAISE EXCEPTION 'Em qual bloco se encontrar a sala? Nao pode ser NULL';
    END IF;
    IF p_numerosala IS NULL THEN
        RAISE EXCEPTION 'O numero da sala não pode ser NULL';
    END IF;
    IF p_turno NOT IN ('Manhã', 'Tarde', 'Noite') THEN
        RAISE EXCEPTION 'turno deve ser Manhã, Tarde ou Noite.';
    END IF;
    IF p_responsavel IS NULL THEN
        RAISE EXCEPTION 'responsavel não pode ser NULL.';
    END IF;
    IF p_periodos IS NULL OR array_length(p_periodos, 1) != 5 THEN
        RAISE EXCEPTION 'periodos deve ser um array com 5 elementos (primeiro, segundo, terceiro, quarto, integral).';
    END IF;
    IF p_diasemana IS NULL OR array_length(p_diasemana, 1) != 7 THEN
        RAISE EXCEPTION 'diasemana deve ser um array com 7 elementos (segunda, terca, quarta, quinta, sexta, sabado, domingo).';
    END IF;

    --buscar do idsala usando o bloco e numero sala
        SELECT idsala INTO v_idsala
        FROM sala
        WHERE nomebloco = p_nomebloco -- compara nomebloco para verificar e o bloco certo (principalmente que numero sala pode se repetir mais em blocos diferentes).
        AND numerosala = p_numerosala --compara numerosala para achar ela
        AND statusdelete = FALSE --verificar se a sala ta disponivel.
        AND ativo = TRUE;
    --confirma se a sala foi encontrada
    IF v_idsala IS NULL THEN
        RAISE EXCEPTION 'Sala do bloco % de numero % nao foi encontrada no banco de dados', p_nomebloco, p_numerosala;
    END IF;
    
    -- Insere na tabela reserva
    INSERT INTO reserva (matriculauser, codturma, datainicial, datafinal, dthinsert, statusdelete)
    VALUES (p_matriculauser, p_codturma, p_datainicial, p_datafinal, NOW(), FALSE)
    RETURNING idreserva INTO v_idreserva;

    -- Insere na tabela reservasala
    INSERT INTO reservasala (idreserva, idsala, turno, responsavel, dthinsert, statusdelete)
    VALUES (v_idreserva, v_idsala, p_turno, p_responsavel, NOW(), FALSE)
    RETURNING idreservasala INTO v_idreservasala;

    -- Insere na tabela periodo
    INSERT INTO periodo (idreservasala, primeiro, segundo, terceiro, quarto, integral, dthinsert, statusdelete)
    VALUES (v_idreservasala, p_periodos[1], p_periodos[2], p_periodos[3], p_periodos[4], p_periodos[5], NOW(), FALSE)
    RETURNING idperiodo INTO v_idperiodo;

    -- Insere na tabela diasemana
    INSERT INTO diasemana (idreservasala, idperiodo, segunda, terca, quarta, quinta, sexta, sabado, domingo, dthinsert, statusdelete)
    VALUES (
        v_idreservasala,
        v_idperiodo,
        p_diasemana[1],
        p_diasemana[2],
        p_diasemana[3],
        p_diasemana[4],
        p_diasemana[5],
        p_diasemana[6],
        p_diasemana[7],
        NOW(),
        FALSE
    );

    -- Retorna o idreserva
    RETURN v_idreserva;
EXCEPTION
    WHEN OTHERS THEN
        RAISE EXCEPTION 'Erro ao inserir reserva: %', SQLERRM;
END;
$$ LANGUAGE plpgsql;




--Testando a function que vai fazer reservas , para facilitar as reservas e nao criar varias functions
SELECT inserir_reserva02(
    94147,                           
    'ADS02M1'::VARCHAR,              
    '2025-04-11'::DATE,              
    '2025-11-26'::DATE,               
    102,                              
    'C'::CHAR(1),                     
    'Manhã'::VARCHAR,                 
    'Viceleno'::VARCHAR,            
    ARRAY[TRUE, TRUE, FALSE, TRUE, FALSE]::BOOLEAN[],
    ARRAY[TRUE, FALSE, FALSE, TRUE, TRUE, FALSE, FALSE]::BOOLEAN[]
);