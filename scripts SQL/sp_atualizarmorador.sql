create or replace PROCEDURE sp_atualizarmorador (
    p_id_morador IN tbl_morador.id_morador%type,
    p_login IN tbl_usuario.login%type,
    p_senha IN tbl_usuario.senha%type,
    p_nome IN tbl_morador.nm_morador%type,
    p_telefone IN tbl_morador.telefone%type,
    v_text_value out varchar2)
    IS
    BEGIN

    v_text_value := AtualizarMorador(
                    p_id_morador,
                    p_login,
                    p_senha,
                    p_nome,
                    p_telefone);

    END sp_atualizarmorador;