create or replace FUNCTION RetornaDadosMorador(
p_login tbl_usuario.login%type,
p_senha tbl_usuario.senha%type)
return VARCHAR2
is
BEGIN
        DECLARE v_nome_morador tbl_morador.nm_morador%type;
            v_tel_morador tbl_morador.telefone%type;
            txtNome VARCHAR2(100) default ' ';
            txtTelefone VARCHAR2(100) default ' ';
            txtMoradas VARCHAR2(2000) default '';
            i numeric default 1;
                CURSOR cursor_moradas IS
                        SELECT 
                            morada.nr_morada AS NUM_MORADA,
                            morada.tipo_morada AS TIPO,
                            condominio.nm_condominio AS CONDOMINIO,
                            condominio.nr_condominio AS NUM_CONDOMINIO,
                            condominio.endereco AS ENDERECO,
                            condominio.cep AS CEP
                        FROM tbl_usuario usuario
                        INNER JOIN tbl_morador morador 
                        ON morador.id_usuario = usuario.id_usuario
                        INNER JOIN tbl_registro_morada registro
                        ON registro.id_morador = morador.id_morador
                        INNER JOIN tbl_morada morada
                        ON morada.id_morada = registro.id_morada
                        INNER JOIN tbl_condominio condominio
                        ON condominio.id_condominio = morada.id_condominio
                        WHERE usuario.login = p_login 
                        AND usuario.senha = p_senha;
                       
        BEGIN

                     SELECT DISTINCT
                            morador.nm_morador AS NOME,
                            morador.telefone AS TELEFONE
                        INTO v_nome_morador, v_tel_morador
                        FROM tbl_usuario usuario
                        INNER JOIN tbl_morador morador 
                        ON morador.id_usuario = usuario.id_usuario
                        WHERE usuario.login = p_login 
                        AND usuario.senha = p_senha;

                    txtNome := 'Nome = '|| v_nome_morador;
                    txtTelefone := 'Telefone = '|| v_tel_morador;


             FOR moradas IN cursor_moradas LOOP
             
                txtMoradas := txtMoradas ||'(' || i || ')'
                ||'Numero Morada = ' || moradas.NUM_MORADA || chr(10)
                || 'Tipo Morada = ' || moradas.TIPO || chr(10)
                || 'Condomínio Morada = ' || moradas.CONDOMINIO || chr(10)
                || 'Número Condomínio Morada = ' || moradas.NUM_CONDOMINIO || chr(10)
                || 'Endereço Morada = ' || moradas.ENDERECO || chr(10)
                || 'CEP = ' || moradas.CEP || chr(10) || chr(10);
                i := i + 1;
             END LOOP;
             RETURN txtNome || chr(10) || txtTelefone || chr(10) 
             || 'Moradas:' || chr(10) || chr(10) ||txtMoradas;
             
             EXCEPTION
                WHEN NO_DATA_FOUND THEN
                RETURN 'Login e/ou senha não encontrados';
        END;    
END RetornaDadosMorador;