create or replace PROCEDURE sp_novamorada (
    p_login IN tbl_usuario.login%type,
    p_senha IN tbl_usuario.senha%type,
    p_num_morada IN tbl_morada.nr_morada%type,
    p_tipo_morada IN tbl_morada.tipo_morada%type,
    p_nome_condominio IN tbl_condominio.nm_condominio%type,
    p_num_condominio IN tbl_condominio.nr_condominio%type,
    p_endereco IN tbl_condominio.endereco%type,
    p_cep IN tbl_condominio.cep%type,
    v_text_value out varchar2)
    IS
    BEGIN

    v_text_value := INCLUIRMORADA(
                    p_login,
                    p_senha,
                    p_num_morada,
                    p_tipo_morada,
                    p_nome_condominio,
                    p_num_condominio,
                    p_endereco,
                    p_cep);

    END sp_novamorada;