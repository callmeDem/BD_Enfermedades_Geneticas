-- Con este Script de SQL se puede crear el modelo de la base de datos propuesto -- 


-- [CREACIÓN DE LAS ENTIDADES] --

-- Entidad:  ENFERMEDAD_GENETICA
-- Creacion Estandar
DROP TABLE IF EXISTS  ENFERMEDAD_GENETICA;
-- Creacion con eliminación
--DROP TABLE IF EXISTS  ENFERMEDAD_GENETICA CASCADE;

CREATE TABLE ENFERMEDAD_GENETICA(
  id SERIAL NOT NULL,
  n°MIM INTEGER NULL,
  n°Genbank CHAR NOT NULL DEFAULT NULL,
  nombre VARCHAR NOT NULL DEFAULT NULL,
  cod_origen INTEGER NOT NULL,
  cod_cigosidad INTEGER NOT NULL ,
  PRIMARY KEY (id)
);


-- Tabla MUTACION
DROP TABLE IF EXISTS MUTACION CASCADE;
		
CREATE TABLE MUTACION(
  codigo_HGVS VARCHAR NOT NULL,
  cod_tipo_mutacion INTEGER NOT NULL,
  proteina VARCHAR NULL,
  codon VARCHAR NULL,
  cod_gen INTEGER NOT NULL,
  PRIMARY KEY (codigo_HGVS)
);


-- Tabla CASO_CLINICO 
DROP TABLE IF EXISTS CASO_CLINICO CASCADE;
		
CREATE TABLE CASO_CLINICO (
  id SERIAL NOT NULL,
  cod_sintoma INTEGER NOT NULL,
  cod_enfermedad INTEGER NOT NULL,
  PRIMARY KEY (id)
);


-- Tabla GEN
DROP TABLE IF EXISTS GEN CASCADE;
		
CREATE TABLE GEN(
  nombre VARCHAR NOT NULL,
  n°MIM SERIAL NOT NULL,
  PRIMARY KEY (n°MIM)
);


-- Tabla SINTOMA
DROP TABLE IF EXISTS SINTOMA CASCADE;
		
CREATE TABLE SINTOMA(
  id SERIAL NOT NULL ,
  tratamiento VARCHAR NULL,
  descripcion VARCHAR NOT NULL,
  PRIMARY KEY (id)
);


-- Tabla ASOCIACION_GENETICA_DE_ENFERMEDAD
DROP TABLE IF EXISTS ASOCIACION_GENETICA_DE_ENFERMEDAD CASCADE;
		
CREATE TABLE ASOCIACION_GENETICA_DE_ENFERMEDAD(
  id SERIAL NOT NULL,
  cod_mutacion VARCHAR NOT NULL,
  cod_enfermedad INTEGER NOT NULL,
  PRIMARY KEY (id)
);


-- Tabla CIGOSIDAD
DROP TABLE IF EXISTS CIGOSIDAD CASCADE;
		
CREATE TABLE CIGOSIDAD(
  id SERIAL NOT NULL,
  tipo_de_cigocidad VARCHAR NOT NULL,
  PRIMARY KEY (id)
);


-- Tabla TIPO_MUTACION
DROP TABLE IF EXISTS TIPO_MUTACION CASCADE;
		
CREATE TABLE TIPO_MUTACION(
  id SERIAL NOT NULL,
  tipo_mutacion VARCHAR NOT NULL,
  PRIMARY KEY (id)
);


-- Tabla ORIGEN
DROP TABLE IF EXISTS ORIGEN CASCADE;
		
CREATE TABLE ORIGEN(
  id SERIAL NOT NULL,
  tipo_origen VARCHAR NOT NULL,
  PRIMARY KEY (id)
);


-- [LLAVES FORANEAS] -- 
ALTER TABLE ENFERMEDAD_GENETICA ADD FOREIGN KEY (cod_origen) REFERENCES ORIGEN(id);
ALTER TABLE ENFERMEDAD_GENETICA ADD FOREIGN KEY (cod_cigosidad) REFERENCES CIGOSIDAD(id);
ALTER TABLE MUTACION ADD FOREIGN KEY (cod_tipo_mutacion) REFERENCES TIPO_MUTACION(id);
ALTER TABLE MUTACION ADD FOREIGN KEY (cod_gen) REFERENCES GEN(n°MIM);
ALTER TABLE CASO_CLINICO ADD FOREIGN KEY (cod_sintoma) REFERENCES SINTOMA(id);
ALTER TABLE CASO_CLINICO ADD FOREIGN KEY (cod_enfermedad) REFERENCES ENFERMEDAD_GENETICA(id);
ALTER TABLE ASOCIACION_GENETICA_DE_ENFERMEDAD ADD FOREIGN KEY (cod_mutacion) REFERENCES MUTACION(codigo_HGVS);
ALTER TABLE ASOCIACION_GENETICA_DE_ENFERMEDAD ADD FOREIGN KEY (cod_enfermedad) REFERENCES ENFERMEDAD_GENETICA(id);

-- [FORMATO DE AGREGADO DE DATOS]--

-- ENFERMEDAD GENÉTICA
-- INSERT INTO  ENFERMEDAD_GENETICA  ( id , n°MIM , n°Genbank , nombre , cod_origen , cod_cigosidad ) VALUES
-- ( id , n°MIM , n°Genbank , nombre , cod_origen , cod_cigosidad );

-- MUTACION
-- INSERT INTO  MUTACION  ( codigo_HGVS , cod_tipo _mutacion , proteina , codon , cod_gen ) VALUES
-- ( codigo_HGVS , cod_tipo _mutacion , proteina , codon , cod_gen );

-- CASO_CLINICO
-- INSERT INTO  CASO_CLINICO   ( id , cod_sintoma , cod_enfermedad ) VALUES
-- ( id , cod_sintoma , cod_enfermedad );

-- GEN
-- INSERT INTO  GEN  ( nombre , n°MIM ) VALUES
-- ( nombre , n°MIM );

-- SINTOMA
-- INSERT INTO  SINTOMA  ( id , tratamiento , descripcion ) VALUES
-- ( id , tratamiento , descripcion );

-- ASOCIACION_GENETICA_DE_ENFERMEDAD
-- INSERT INTO  ASOCIACION_GENETICA_DE_ENFERMEDAD  ( id , cod_mutacion , cod_enfermedad ) VALUES
-- ( id , cod_mutacion , cod_enfermedad );

-- CIGOSIDAD
-- INSERT INTO  CIGOSIDAD  ( id , tipo_de_cigocidad ) VALUES
-- ( id , tipo_de_cigocidad );

-- TIPO_MUTACION
-- INSERT INTO  TIPO_MUTACION  ( id , tipo_mutacion ) VALUES
-- ( id , tipo_mutacion );

-- ORIGEN
-- INSERT INTO  ORIGEN  ( id , tipo_origen ) VALUES
-- ( id , tipo_origen );