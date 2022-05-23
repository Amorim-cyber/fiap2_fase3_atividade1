-- SELECT * FROM TBL_MORADOR
/* UPDATE TBL_MORADOR SET nm_morador = 'Agatha', telefone = '(021)49781-4026'
        WHERE id_morador = 1;*/
/* UPDATE TBL_USUARIO SET login = 'Agatha123', senha = '123'
        WHERE id_usuario = 1;*/
        
SET SERVEROUTPUT ON

DECLARE v_output_morador varchar(1000);
        v_resposta varchar(1000);
        
BEGIN
    -- Atualizar Morador
    /*sp_loginAccount('Agatha123','123','MORADOR',v_output_morador);
    DBMS_OUTPUT.PUT_LINE(v_output_morador);
    
    sp_atualizarmorador(1,'Agatha1234','1234','Agatha Christie'
                        ,'(011)49781-4026',v_resposta);
    DBMS_OUTPUT.PUT_LINE(v_resposta);
    DBMS_OUTPUT.PUT_LINE('');
    sp_loginAccount('Agatha1234','1234','MORADOR',v_output_morador);
    DBMS_OUTPUT.PUT_LINE(v_output_morador);*/
    
    -- ERRO : Morador não encontrado ou inválido
    /*sp_atualizarmorador(111,'Agatha1234','1234','Agatha Christie'
                        ,'(011)49781-4026',v_resposta);
    DBMS_OUTPUT.PUT_LINE(v_resposta);*/
    
    -- Atualiza morador V2
    
    /*sp_loginAccount('Ana123','123','MORADOR',v_output_morador);
    DBMS_OUTPUT.PUT_LINE(v_output_morador);
    
    SP_ATUALIZA_MORADOR(8, 'Ana Flor','(021)07012-42670','CASA',7,5);
    
    sp_loginAccount('Ana123','123','MORADOR',v_output_morador);
    DBMS_OUTPUT.PUT_LINE(v_output_morador);*/
    
    -- ERRO 2: ID morador digitado incorretamente
    
    -- SP_ATUALIZA_MORADOR(null, 'Ana Flor','(021)07012-42670','CASA',7,5);
    
END;
