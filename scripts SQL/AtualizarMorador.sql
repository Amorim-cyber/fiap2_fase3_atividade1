create or replace FUNCTION AtualizarMorador(
p_id_morador tbl_morador.id_morador%type,
p_login tbl_usuario.login%type,
p_senha tbl_usuario.senha%type,
p_nome tbl_morador.nm_morador%type,
p_telefone tbl_morador.telefone%type)
return VARCHAR2
AS
BEGIN

    DECLARE 
    v_id_usuario numeric;

    BEGIN
        SELECT id_usuario 
        INTO v_id_usuario
        FROM TBL_MORADOR WHERE id_morador = p_id_morador;

        UPDATE TBL_MORADOR SET nm_morador = p_nome, telefone = p_telefone
        WHERE id_morador = p_id_morador;

        UPDATE TBL_USUARIO SET login = p_login, senha = p_senha
        WHERE id_usuario = v_id_usuario;
        
        RETURN 'Morador atualizado com sucesso';

        EXCEPTION 
        WHEN NO_DATA_FOUND THEN 
            RETURN 'Morador inexistente ou usuário inválido';
    END;

END AtualizarMorador;