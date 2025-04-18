-- Gerado por Oracle SQL Developer Data Modeler 4.1.3.901
--   em:        2025-04-17 21:29:06 BRT
--   site:      Oracle Database 12c
--   tipo:      Oracle Database 12c




CREATE TABLE Aplicacao_Nutriente
  (
    aplicacao_id   NUMBER NOT NULL ,
    talhao_id      NUMBER ,
    data_hora      TIMESTAMP ,
    tipo_nutriente VARCHAR2 (50) ,
    quantidade     NUMBER ,
    metodo         VARCHAR2 (100) ,
    motivo         VARCHAR2 (100)
  ) ;
ALTER TABLE Aplicacao_Nutriente ADD CONSTRAINT Aplicacao_Nutriente_PK PRIMARY KEY ( aplicacao_id ) ;


CREATE TABLE Cultura
  (
    cultura_id         NUMBER NOT NULL ,
    nome               VARCHAR2 (100) NOT NULL ,
    descricao          VARCHAR2 (255) ,
    umidade_ideal_min  NUMBER ,
    umidade_ideal_max  NUMBER ,
    ph_ideal_min       NUMBER ,
    ph_ideal_max       NUMBER ,
    fosforo_ideal_min  NUMBER ,
    fosforo_ideal_max  NUMBER ,
    potassio_ideal_min NUMBER ,
    potassio_ideal_max NUMBER
  ) ;
ALTER TABLE Cultura ADD CONSTRAINT Cultura_PK PRIMARY KEY ( cultura_id ) ;


CREATE TABLE Irrigacao
  (
    irrigacao_id    NUMBER NOT NULL ,
    talhao_id       NUMBER ,
    data_hora       TIMESTAMP ,
    quantidade_agua NUMBER ,
    duracao         NUMBER ,
    motivo          VARCHAR2 (100)
  ) ;
ALTER TABLE Irrigacao ADD CONSTRAINT Irrigacao_PK PRIMARY KEY ( irrigacao_id ) ;


CREATE TABLE Leitura_Sensor
  (
    leitura_id     NUMBER NOT NULL ,
    sensor_id      NUMBER ,
    data_hora      TIMESTAMP ,
    valor_umidade  NUMBER ,
    valor_ph       NUMBER ,
    valor_fosforo  NUMBER ,
    valor_potassio NUMBER
  ) ;
ALTER TABLE Leitura_Sensor ADD CONSTRAINT Leitura_Sensor_PK PRIMARY KEY ( leitura_id ) ;


CREATE TABLE Recomendacao
  (
    recomendacao_id NUMBER NOT NULL ,
    talhao_id       NUMBER ,
    data_hora       TIMESTAMP ,
    tipo            VARCHAR2 (50) ,
    descricao CLOB ,
    status        VARCHAR2 (10) ,
    data_execucao TIMESTAMP
  ) ;
ALTER TABLE Recomendacao ADD CHECK ( status IN ('executada', 'ignorada', 'pendente')) ;
ALTER TABLE Recomendacao ADD CONSTRAINT Recomendacao_PK PRIMARY KEY ( recomendacao_id ) ;


CREATE TABLE Sensor
  (
    sensor_id       NUMBER NOT NULL ,
    talhao_id       NUMBER ,
    tipo            VARCHAR2 (2) ,
    modelo          VARCHAR2 (100) ,
    localizacao     VARCHAR2 (255) ,
    data_instalacao DATE ,
    status          VARCHAR2 (10)
  ) ;
ALTER TABLE Sensor ADD CHECK ( tipo   IN ('S1', 'S2', 'S3')) ;
ALTER TABLE Sensor ADD CHECK ( status IN ('ativo', 'inativo', 'manutencao')) ;
ALTER TABLE Sensor ADD CONSTRAINT Sensor_PK PRIMARY KEY ( sensor_id ) ;


CREATE TABLE Talhao
  (
    talhao_id              NUMBER NOT NULL ,
    cultura_id             NUMBER ,
    nome                   VARCHAR2 (50) NOT NULL ,
    area                   NUMBER ,
    localizacao            VARCHAR2 (255) ,
    data_plantio           DATE ,
    data_colheita_prevista DATE
  ) ;
ALTER TABLE Talhao ADD CONSTRAINT Talhao_PK PRIMARY KEY ( talhao_id ) ;


ALTER TABLE Aplicacao_Nutriente ADD CONSTRAINT fk_aplicacao_talhao FOREIGN KEY ( talhao_id ) REFERENCES Talhao ( talhao_id ) NOT DEFERRABLE ;

ALTER TABLE Irrigacao ADD CONSTRAINT fk_irrigacao_talhao FOREIGN KEY ( talhao_id ) REFERENCES Talhao ( talhao_id ) NOT DEFERRABLE ;

ALTER TABLE Leitura_Sensor ADD CONSTRAINT fk_leitura_sensor FOREIGN KEY ( sensor_id ) REFERENCES Sensor ( sensor_id ) NOT DEFERRABLE ;

ALTER TABLE Recomendacao ADD CONSTRAINT fk_recomendacao_talhao FOREIGN KEY ( talhao_id ) REFERENCES Talhao ( talhao_id ) NOT DEFERRABLE ;

ALTER TABLE Sensor ADD CONSTRAINT fk_sensor_talhao FOREIGN KEY ( talhao_id ) REFERENCES Talhao ( talhao_id ) NOT DEFERRABLE ;

ALTER TABLE Talhao ADD CONSTRAINT fk_talhao_cultura FOREIGN KEY ( cultura_id ) REFERENCES Cultura ( cultura_id ) NOT DEFERRABLE ;


-- Relatório do Resumo do Oracle SQL Developer Data Modeler: 
-- 
-- CREATE TABLE                             7
-- CREATE INDEX                             0
-- ALTER TABLE                             16
-- CREATE VIEW                              0
-- ALTER VIEW                               0
-- CREATE PACKAGE                           0
-- CREATE PACKAGE BODY                      0
-- CREATE PROCEDURE                         0
-- CREATE FUNCTION                          0
-- CREATE TRIGGER                           0
-- ALTER TRIGGER                            0
-- CREATE COLLECTION TYPE                   0
-- CREATE STRUCTURED TYPE                   0
-- CREATE STRUCTURED TYPE BODY              0
-- CREATE CLUSTER                           0
-- CREATE CONTEXT                           0
-- CREATE DATABASE                          0
-- CREATE DIMENSION                         0
-- CREATE DIRECTORY                         0
-- CREATE DISK GROUP                        0
-- CREATE ROLE                              0
-- CREATE ROLLBACK SEGMENT                  0
-- CREATE SEQUENCE                          0
-- CREATE MATERIALIZED VIEW                 0
-- CREATE SYNONYM                           0
-- CREATE TABLESPACE                        0
-- CREATE USER                              0
-- 
-- DROP TABLESPACE                          0
-- DROP DATABASE                            0
-- 
-- REDACTION POLICY                         0
-- TSDP POLICY                              0
-- 
-- ORDS DROP SCHEMA                         0
-- ORDS ENABLE SCHEMA                       0
-- ORDS ENABLE OBJECT                       0
-- 
-- ERRORS                                   0
-- WARNINGS                                 0
