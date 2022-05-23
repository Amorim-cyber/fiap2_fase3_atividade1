create or replace FUNCTION CHECKSERVICO(
p_nome_servico tbl_servico.nm_servico%type)
RETURN tbl_servico.id_servico%type
AS
BEGIN
    DECLARE 
    v_id_servico numeric(20) DEFAULT 0;

    BEGIN
        SELECT id_servico 
        INTO v_id_servico
        FROM tbl_servico 
        WHERE nm_servico = p_nome_servico;

        RETURN v_id_servico;

        EXCEPTION 
        WHEN NO_DATA_FOUND THEN 
            v_id_servico := 0;
            RETURN v_id_servico;

    END;

END CHECKSERVICO;