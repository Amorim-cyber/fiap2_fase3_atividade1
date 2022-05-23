create or replace PROCEDURE sp_loginAccount ( 
    p_login IN tbl_usuario.login%type,
    p_senha IN tbl_usuario.senha%type,
    p_tipo IN varchar2,
    v_text_value out varchar2)
    IS
    BEGIN
        
        IF (p_tipo = 'PRESTADOR') THEN

            v_text_value := RetornaDadosPrestador(p_login,p_senha);

        ELSIF (p_tipo = 'MORADOR') then

            v_text_value := RetornaDadosMorador(p_login,p_senha);

        ELSE
            v_text_value := 'Tipo de usuário inválido!';
            
        END IF;

    END sp_loginAccount;