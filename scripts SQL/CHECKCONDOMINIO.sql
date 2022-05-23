create or replace FUNCTION CHECKCONDOMINIO(
p_num_condominio tbl_condominio.nr_condominio%type,
p_nome_condominio tbl_condominio.nm_condominio%type,
p_endereco tbl_condominio.endereco%type,
p_cep tbl_condominio.cep%type)
RETURN tbl_condominio.id_condominio%type
AS
BEGIN
    DECLARE 
    v_id_condominio numeric(20) DEFAULT 0;

    BEGIN
        SELECT id_condominio 
        INTO v_id_condominio
        FROM tbl_condominio 
        WHERE nr_condominio = p_num_condominio AND cep = p_cep;

        RETURN v_id_condominio;

        EXCEPTION 
        WHEN NO_DATA_FOUND THEN 
            v_id_condominio := tbl_condominio_seq.NEXTVAL;
            
            INSERT INTO tbl_condominio (id_condominio,nm_condominio, 
                                    endereco,nr_condominio,cep) 
            VALUES (v_id_condominio,p_nome_condominio,
                p_endereco,p_num_condominio,p_cep);
            
            RETURN v_id_condominio;

    END;

END CHECKCONDOMINIO;