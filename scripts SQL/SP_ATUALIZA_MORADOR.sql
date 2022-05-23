create or replace PROCEDURE "SP_ATUALIZA_MORADOR" (
  vID_MORADOR  NUMBER,
  vNM_MORADOR  VARCHAR2,
  vTELEFONE  VARCHAR2,
  vTIPO_MORADA   VARCHAR2,
  vNR_MORADA   NUMBER,
  vID_CONDOMINIO NUMBER)
AS BEGIN
    DECLARE
        vID_MORADAnew NUMBER;  
        vEXCEPTION EXCEPTION;
    BEGIN 
        IF(vID_MORADOR is null OR vID_MORADOR = 0) THEN
            RAISE vEXCEPTION;
        END IF;

        if(vTIPO_MORADA is not null AND 
            vNR_MORADA is not null AND
            vID_CONDOMINIO is not null) THEN
            INSERT INTO TBL_MORADA (id_morada,nr_morada , tipo_morada,id_condominio)
            VALUES (TBL_MORADA_SEQ.nextval,vNR_MORADA, vTIPO_MORADA,vID_CONDOMINIO)
            RETURNING ID_MORADA INTO vID_MORADAnew;
        END IF;

        UPDATE TBL_MORADOR SET
        NM_MORADOR = vNM_MORADOR,
        TELEFONE = vTELEFONE
        WHERE ID_MORADOR = vID_MORADOR;

        IF (vID_MORADAnew is not null AND vID_MORADAnew > 0) THEN
            DELETE FROM TBL_REGISTRO_MORADA WHERE ID_MORADOR = vID_MORADOR;
            INSERT INTO TBL_REGISTRO_MORADA VALUES (vID_MORADOR,vID_MORADAnew);
        END IF;

        EXCEPTION
            WHEN vEXCEPTION THEN
            RAISE_APPLICATION_ERROR(-20999,'ATENÇÃO! Parâmetro vID_MORADOR é obrigatório', FALSE);
    END;
END;