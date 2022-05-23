create or replace FUNCTION RetornaDadosPrestador(
p_login tbl_usuario.login%type,
p_senha tbl_usuario.senha%type)
return VARCHAR2
is
BEGIN
        DECLARE v_nome_prestador tbl_prestador.nm_prestador%type;
            v_tel_prestador tbl_prestador.telefone%type;
            txtNome VARCHAR2(100) default ' ';
            txtTelefone VARCHAR2(100) default ' ';
            txtServicos VARCHAR2(100) default '';
                CURSOR cursor_servicos IS
                        SELECT 
                            servico.nm_servico AS SERVICO
                        FROM tbl_usuario usuario
                        INNER JOIN tbl_prestador prestador 
                        ON prestador.id_usuario = usuario.id_usuario
                        INNER JOIN tbl_ocupacao ocupacao
                        ON ocupacao.id_prestador = prestador.id_prestador
                        INNER JOIN tbl_servico servico
                        ON servico.id_servico = ocupacao.id_servico
                        WHERE usuario.login = p_login 
                        AND usuario.senha = p_senha;

        BEGIN

                     SELECT DISTINCT
                            prestador.nm_prestador AS NOME,
                            prestador.telefone AS TELEFONE
                        INTO v_nome_prestador, v_tel_prestador
                        FROM tbl_usuario usuario
                        INNER JOIN tbl_prestador prestador 
                        ON prestador.id_usuario = usuario.id_usuario
                        INNER JOIN tbl_ocupacao ocupacao
                        ON ocupacao.id_prestador = prestador.id_prestador
                        INNER JOIN tbl_servico servico
                        ON servico.id_servico = ocupacao.id_servico
                        WHERE usuario.login = p_login 
                        AND usuario.senha = p_senha;

                    txtNome := 'Nome = '|| v_nome_prestador;
                    txtTelefone := 'Telefone = '|| v_tel_prestador;


             FOR servicos IN cursor_servicos LOOP
                txtServicos := txtServicos || ' ' || servicos.SERVICO;
             END LOOP;
             RETURN txtNome || chr(10) || txtTelefone || chr(10) 
             || 'Especialidades =' || txtServicos;
             
             EXCEPTION
                WHEN NO_DATA_FOUND THEN
                RETURN 'Login e/ou senha não encontrados';
        END;    
END RetornaDadosPrestador;