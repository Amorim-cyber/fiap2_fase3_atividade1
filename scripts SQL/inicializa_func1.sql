-- SELECT * FROM TBL_MORADOR;
-- SELECT * FROM TBL_PRESTADOR;
SET SERVEROUTPUT ON

DECLARE v_resposta varchar(1000);

BEGIN
    -- Caso prestador
     sp_loginAccount('Julia123','123','PRESTADOR',v_resposta);
     DBMS_OUTPUT.PUT_LINE(v_resposta);
    
    -- Caso morador
    -- sp_loginAccount('Agatha1234','1234','MORADOR',v_resposta);
    -- DBMS_OUTPUT.PUT_LINE(v_resposta);
    
    -- ERRO1: Tipo de usuário inválido
    -- sp_loginAccount('Agatha1234','1234','LOCATÁRIO',v_resposta);
    -- DBMS_OUTPUT.PUT_LINE(v_resposta);
    
    -- ERRO2: login e/ou senha inválidos morador
    -- sp_loginAccount('Agatha123','123','MORADOR',v_resposta);
    -- DBMS_OUTPUT.PUT_LINE(v_resposta);
     
     -- ERRO3: login e/ou senha inválidos prestador
     -- sp_loginAccount('Julia1234','1234','PRESTADOR',v_resposta);
     -- DBMS_OUTPUT.PUT_LINE(v_resposta);
    
END;