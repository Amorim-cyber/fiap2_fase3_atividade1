-- SELECT * FROM TBL_USUARIO;
-- SELECT * FROM TBL_MORADOR;
-- SELECT * FROM TBL_CONDOMINIO;
-- DELETE FROM TBL_CONDOMINIO WHERE id_condominio = 11;
-- SELECT * FROM TBL_MORADA WHERE id_condominio = 11;
-- DELETE FROM TBL_MORADA WHERE id_condominio = 11;
-- SELECT * FROM TBL_REGISTRO_MORADA WHERE id_morada = 47;
-- DELETE FROM TBL_REGISTRO_MORADA WHERE id_morada = 47;

SET SERVEROUTPUT ON

DECLARE v_output_morador varchar(1000);
        v_resposta varchar(1000);
        
BEGIN
    -- Adição morada
    sp_loginAccount('Cody123','123','MORADOR',v_output_morador);
    DBMS_OUTPUT.PUT_LINE(v_output_morador);
    
    sp_novamorada('Cody123','123',78,'APARTAMENTO','Condominio Ibiza',
                    90,'Rua Ocean Drive', '66631-210',v_resposta);
    DBMS_OUTPUT.PUT_LINE(v_resposta);
    DBMS_OUTPUT.PUT_LINE('');
    sp_loginAccount('Cody123','123','MORADOR',v_output_morador);
    DBMS_OUTPUT.PUT_LINE(v_output_morador);
    
    -- Erro 1: Usuário não existente
    /*sp_novamorada('Benedita123','123',78,'APARTAMENTO','Condominio Ibiza',
                    90,'Rua Ocean Drive', '66631-210',v_resposta);
    DBMS_OUTPUT.PUT_LINE(v_resposta);*/
    
    -- Erro 2: Morada já registrada no banco de dados
    /*sp_novamorada('Agatha123','123',78,'APARTAMENTO','Condominio Ibiza',
                    90,'Rua Ocean Drive', '66631-210',v_resposta);
    DBMS_OUTPUT.PUT_LINE(v_resposta);*/
    
    -- Erro 3: Usuário inválido
    /*sp_novamorada('Julia123','123',78,'CASA','Condominio Monaco',
                    97,'Rua Perdizes', '66631-212',v_resposta);
    DBMS_OUTPUT.PUT_LINE(v_resposta);*/
    
END;
