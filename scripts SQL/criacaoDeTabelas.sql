-- drop table tbl_registro_morada; x
-- drop table tbl_registro_servico; x
-- drop table tbl_ocupacao; x
-- drop table tbl_servico; x
-- drop table tbl_prestador; x
-- drop table tbl_morador; x
-- drop table tbl_morada; x
-- drop table tbl_condominio; x
-- drop table tbl_usuario; x
-- drop sequence tbl_condominio_seq; x
-- drop sequence tbl_usuario_seq; x
-- drop sequence tbl_morada_seq; x
-- drop sequence tbl_morador_seq; x
-- drop sequence tbl_prestador_seq; x
-- drop sequence tbl_registro_seq; x


CREATE TABLE tbl_condominio (
    id_condominio  NUMBER(10) NOT NULL,
    nm_condominio  VARCHAR2(100) NOT NULL,
    endereco       VARCHAR2(200) NOT NULL,
    nr_condominio  NUMBER(8) NOT NULL,
    cep            VARCHAR2(20) NOT NULL
);

ALTER TABLE tbl_condominio ADD CONSTRAINT tbl_condominio_pk PRIMARY KEY ( id_condominio );

CREATE TABLE tbl_morada (
    id_morada                    NUMBER(10) NOT NULL,
    nr_morada                    NUMBER(10) NOT NULL,
    tipo_morada                  VARCHAR2(20) NOT NULL,
    id_condominio                NUMBER(10) NOT NULL
);

ALTER TABLE tbl_morada ADD CONSTRAINT tbl_morada_pk PRIMARY KEY ( id_morada );

CREATE TABLE tbl_morador (
    id_morador             NUMBER(10) NOT NULL,
    nm_morador             VARCHAR2(100) NOT NULL,
    telefone               VARCHAR2(100) NOT NULL,
    id_usuario             NUMBER(8) NOT NULL
);

ALTER TABLE tbl_morador ADD CONSTRAINT tbl_morador_pk PRIMARY KEY ( id_morador );

CREATE TABLE tbl_ocupacao (
    id_prestador  NUMBER(10) NOT NULL,
    id_servico      NUMBER(10) NOT NULL
);

CREATE TABLE tbl_prestador (
    id_prestador           NUMBER(10) NOT NULL,
    nm_prestador           VARCHAR2(100) NOT NULL,
    telefone               VARCHAR2(100) NOT NULL,
    id_usuario             NUMBER(8) NOT NULL
);

ALTER TABLE tbl_prestador ADD CONSTRAINT tbl_prestador_pk PRIMARY KEY ( id_prestador );

CREATE TABLE tbl_registro_morada (
    id_morador        NUMBER(10) NOT NULL,
    id_morada          NUMBER(10) NOT NULL
);

CREATE TABLE tbl_registro_servico (
    id_registro                NUMBER(10) NOT NULL,
    dt_inicio                  TIMESTAMP WITH LOCAL TIME ZONE NOT NULL,
    dt_termino                 TIMESTAMP WITH LOCAL TIME ZONE NOT NULL,
    id_prestador               NUMBER(10) NOT NULL,
    id_morador                 NUMBER(10) NOT NULL,
    status                     VARCHAR2(15) NOT NULL
);

ALTER TABLE tbl_registro_servico ADD CONSTRAINT tbl_registro_servico_pk PRIMARY KEY ( id_registro );

CREATE TABLE tbl_servico (
    id_servico  NUMBER(10) NOT NULL,
    nm_servico  VARCHAR2(255) NOT NULL
);

ALTER TABLE tbl_servico ADD CONSTRAINT tbl_servico_pk PRIMARY KEY ( id_servico );

CREATE TABLE tbl_usuario (
    id_usuario  NUMBER(8) NOT NULL,
    login       VARCHAR2(50) NOT NULL,
    senha       VARCHAR2(50) NOT NULL
);

ALTER TABLE tbl_usuario ADD CONSTRAINT tbl_usuario_pk PRIMARY KEY ( id_usuario );

ALTER TABLE tbl_morada
    ADD CONSTRAINT morada_condominio_fk FOREIGN KEY ( id_condominio )
        REFERENCES tbl_condominio ( id_condominio );

ALTER TABLE tbl_morador
    ADD CONSTRAINT morador_usuario_fk FOREIGN KEY ( id_usuario )
        REFERENCES tbl_usuario ( id_usuario );

ALTER TABLE tbl_ocupacao
    ADD CONSTRAINT ocupacao_prestador_fk FOREIGN KEY ( id_prestador )
        REFERENCES tbl_prestador ( id_prestador );

ALTER TABLE tbl_ocupacao
    ADD CONSTRAINT ocupacao_servico_fk FOREIGN KEY ( id_servico )
        REFERENCES tbl_servico ( id_servico );

ALTER TABLE tbl_prestador
    ADD CONSTRAINT prestador_usuario_fk FOREIGN KEY ( id_usuario )
        REFERENCES tbl_usuario ( id_usuario );

ALTER TABLE tbl_registro_morada
    ADD CONSTRAINT registro_morada_fk FOREIGN KEY ( id_morada )
        REFERENCES tbl_morada ( id_morada );
 
ALTER TABLE tbl_registro_morada
    ADD CONSTRAINT registro_morador_fk FOREIGN KEY ( id_morador )
        REFERENCES tbl_morador ( id_morador );

ALTER TABLE tbl_registro_servico
    ADD CONSTRAINT registro_serv_mor_fk FOREIGN KEY ( id_morador )
        REFERENCES tbl_morador ( id_morador );

ALTER TABLE tbl_registro_servico
    ADD CONSTRAINT registro_serv_pres_fk FOREIGN KEY ( id_prestador )
        REFERENCES tbl_prestador ( id_prestador );

CREATE SEQUENCE tbl_condominio_seq
 START WITH     1
 INCREMENT BY   1
 NOCACHE
 NOCYCLE;

 CREATE SEQUENCE tbl_morada_seq
 START WITH     1
 INCREMENT BY   1
 NOCACHE
 NOCYCLE;

CREATE SEQUENCE tbl_usuario_seq
 START WITH     1
 INCREMENT BY   1
 NOCACHE
 NOCYCLE;

 CREATE SEQUENCE tbl_morador_seq
 START WITH     1
 INCREMENT BY   1
 NOCACHE
 NOCYCLE;

 CREATE SEQUENCE tbl_prestador_seq
 START WITH     1
 INCREMENT BY   1
 NOCACHE
 NOCYCLE;

 CREATE SEQUENCE tbl_registro_seq
 START WITH     1
 INCREMENT BY   1
 NOCACHE
 NOCYCLE;