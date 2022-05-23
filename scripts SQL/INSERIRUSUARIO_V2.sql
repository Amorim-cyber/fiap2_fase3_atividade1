create or replace FUNCTION INSERIRUSUARIO_V2(
p_login tbl_usuario.login%type,
p_senha tbl_usuario.senha%type)
RETURN tbl_usuario.id_usuario%type
AS
BEGIN
    DECLARE 
    v_id_usuario tbl_usuario.id_usuario%type;

    BEGIN
        SELECT id_usuario 
        INTO v_id_usuario
        FROM tbl_usuario 
        WHERE login = p_login AND senha = p_senha;

        RETURN v_id_usuario;

        EXCEPTION 
        WHEN NO_DATA_FOUND THEN 
            v_id_usuario := 0;
            RETURN v_id_usuario;

    END;

END INSERIRUSUARIO_V2;