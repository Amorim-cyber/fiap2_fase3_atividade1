create or replace FUNCTION CHECKMORADA(
p_id_condominio tbl_condominio.id_condominio%type,
p_num_morada tbl_morada.nr_morada%type)
RETURN tbl_morada.id_morada%type
AS
BEGIN
    DECLARE 
    v_id_morada numeric(20) DEFAULT 0;

    BEGIN
        SELECT id_morada 
        INTO v_id_morada
        FROM tbl_morada 
        WHERE id_condominio = p_id_condominio AND nr_morada = p_num_morada;

        v_id_morada:=0;

        RETURN v_id_morada;

        EXCEPTION 
        WHEN NO_DATA_FOUND THEN 
            v_id_morada := tbl_morada_seq.NEXTVAL;
            RETURN v_id_morada;

    END;

END CHECKMORADA;