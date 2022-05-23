create or replace FUNCTION CriarMorador(
p_login tbl_usuario.login%type,
p_senha tbl_usuario.senha%type,
p_nome tbl_morador.nm_morador%type,
p_telefone tbl_morador.telefone%type,
p_num_morada tbl_morada.nr_morada%type,
p_tipo_morada tbl_morada.tipo_morada%type,
p_nome_condominio tbl_condominio.nm_condominio%type,
p_num_condominio tbl_condominio.nr_condominio%type,
p_endereco tbl_condominio.endereco%type,
p_cep tbl_condominio.cep%type)
return VARCHAR2
AS

BEGIN

    DECLARE 
    v_id_usuario numeric;
    v_id_condominio numeric;
    v_id_morada numeric;
    v_id_morador numeric;

    BEGIN

        v_id_usuario := INSERIRUSUARIO(p_login,p_senha);

        IF(v_id_usuario = 0) THEN
            RETURN 'Já existe uma conta com esse acesso';
        END IF;

        v_id_condominio := CHECKCONDOMINIO(p_num_condominio, p_nome_condominio,
                        p_endereco,p_cep);

        v_id_morada := CHECKMORADA(v_id_condominio,p_num_morada);

        IF(v_id_morada = 0) THEN
            RETURN 'Morada já registrada no banco de dados';
        END IF;
        
        v_id_morador := tbl_morador_seq.NEXTVAL;
        
        INSERT INTO tbl_usuario (id_usuario,login , senha) 
        VALUES (v_id_usuario,p_login,p_senha);
        
        INSERT INTO tbl_morada (id_morada,nr_morada , tipo_morada,id_condominio)
        VALUES (v_id_morada,p_num_morada,p_tipo_morada,v_id_condominio);

        INSERT INTO tbl_morador (id_morador,nm_morador, telefone, id_usuario) 
        VALUES (v_id_morador,p_nome,p_telefone,v_id_usuario);
    
        INSERT INTO tbl_registro_morada (id_morador,id_morada) 
        VALUES (v_id_morador,v_id_morada);
        
        RETURN 'Morador registrado com sucesso!';

    END;
    
END CriarMorador;