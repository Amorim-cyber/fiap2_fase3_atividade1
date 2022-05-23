create or replace FUNCTION CriarPrestador(
p_login tbl_usuario.login%type,
p_senha tbl_usuario.senha%type,
p_nome tbl_prestador.nm_prestador%type,
p_telefone tbl_prestador.telefone%type,
p_nome_servico tbl_servico.nm_servico%type)
return VARCHAR2
IS
BEGIN
    DECLARE 
    v_id_usuario numeric;
    v_id_servico numeric;
    v_id_prestador numeric;

    BEGIN
    
        v_id_usuario := INSERIRUSUARIO(p_login,p_senha);

        IF(v_id_usuario = 0) THEN
            RETURN 'Já existe uma conta com esse acesso';
        END IF;
    
        v_id_servico := CHECKSERVICO(p_nome_servico);

        IF(v_id_servico = 0) THEN
            RETURN 'Tipo de serviço não foi encontrado no banco de dados';
        END IF;
        
        v_id_prestador := tbl_prestador_seq.NEXTVAL;
        
        INSERT INTO tbl_usuario (id_usuario,login , senha) 
        VALUES (v_id_usuario,p_login,p_senha);

        INSERT INTO tbl_prestador (id_prestador,nm_prestador, telefone, id_usuario) 
        VALUES (v_id_prestador,p_nome,p_telefone,v_id_usuario);
    
        INSERT INTO tbl_ocupacao (id_prestador,id_servico) 
        VALUES (v_id_prestador,v_id_servico);
        
        RETURN 'Prestador registrado com sucesso!';

    END;
    
END CriarPrestador;