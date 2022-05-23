create or replace PROCEDURE sp_novousuario ( 
    p_login IN tbl_usuario.login%type,
    p_senha IN tbl_usuario.senha%type,
    p_nome IN varchar2,
    p_telefone IN varchar2,
    p_tipo IN varchar2,
    p_servico IN tbl_servico.nm_servico%type DEFAULT '',
    p_num_morada IN tbl_morada.nr_morada%type DEFAULT 0,
    p_tipo_morada IN tbl_morada.tipo_morada%type DEFAULT '',
    p_nome_condominio IN tbl_condominio.nm_condominio%type DEFAULT '',
    p_num_condominio IN tbl_condominio.nr_condominio%type DEFAULT 0,
    p_endereco IN tbl_condominio.endereco%type DEFAULT '',
    p_cep IN tbl_condominio.cep%type DEFAULT '',
    v_text_value out varchar2)
    IS
    BEGIN

        IF (p_tipo = 'PRESTADOR') THEN

            v_text_value := CRIARPRESTADOR(
                    p_login,
                    p_senha,
                    p_nome,
                    p_telefone,
                    p_servico
                );

        ELSIF (p_tipo = 'MORADOR') then

           v_text_value := CRIARMORADOR(
                    p_login,
                    p_senha,
                    p_nome,
                    p_telefone,
                    p_num_morada,
                    p_tipo_morada,
                    p_nome_condominio,
                    p_num_condominio,
                    p_endereco,
                    p_cep);

        ELSE
            v_text_value := 'Tipo de usuário inválido!';

        END IF;

    END sp_novousuario;