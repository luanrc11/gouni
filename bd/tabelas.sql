DROP DATABASE IF EXISTS TCC_DATABASE;
#---- creating database
CREATE DATABASE TCC_DATABASE;
#---- using database
USE TCC_DATABASE;

CREATE TABLE tb_faculdade(
facul_ni_cod INTEGER NOT NULL AUTO_INCREMENT,
facul_vc_nome VARCHAR(255) NOT NULL UNIQUE KEY,
CONSTRAINT pk_faculdade PRIMARY KEY(facul_ni_cod)
);

CREATE TABLE tb_campus(
facul_ni_cod INTEGER NOT NULL,
campus_ni_cod INTEGER NOT NULL AUTO_INCREMENT,
campus_vc_nome VARCHAR(255) NOT NULL,
campus_vc_endereco VARCHAR(255) NOT NULL,
CONSTRAINT pk_campus PRIMARY KEY(campus_ni_cod)
);

CREATE TABLE tb_curso(
campus_ni_cod INTEGER NOT NULL,
curso_ni_cod INTEGER NOT NULL AUTO_INCREMENT,
curso_vc_nome VARCHAR(128) NOT NULL,
curso_ni_valor NUMERIC(18,2) NOT NULL,
curso_ni_tip_forma INTEGER(1) NOT NULL, #1 - Tecnologo, 2 - Bacharel, 3 - Pos, 4 - Mestrado, 5 - Doutorado
curso_ni_duracao INTEGER, #duracao em semestres
CONSTRAINT pk_curso PRIMARY KEY(curso_ni_cod)
);

ALTER TABLE tb_campus
ADD CONSTRAINT fk_campus_facul
FOREIGN KEY(facul_ni_cod)
REFERENCES tb_faculdade(facul_ni_cod)
ON DELETE CASCADE;

ALTER TABLE tb_curso
ADD CONSTRAINT fk_curso_campus
FOREIGN KEY(campus_ni_cod)
REFERENCES tb_campus(campus_ni_cod)
ON DELETE CASCADE;

CREATE TABLE tb_estudante(
estu_ni_cod INTEGER NOT NULL AUTO_INCREMENT,
estu_vc_nome VARCHAR(255) NOT NULL,
estu_ni_niv INTEGER(1), #1 p/ EM 2 p/ Universitario
estu_dt_nasc DATE,
CONSTRAINT pk_estudante PRIMARY KEY(estu_ni_cod)
);

CREATE TABLE tb_usuario(
usu_ni_cod INTEGER NOT NULL AUTO_INCREMENT,
estu_ni_cod INTEGER NOT NULL,
usu_vc_email VARCHAR(255) NOT NULL UNIQUE KEY,
usu_vc_senha VARCHAR(255) NOT NULL,
usu_dt_cri TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
CONSTRAINT pk_usuario PRIMARY KEY(usu_ni_cod)
);

ALTER TABLE tb_usuario
ADD CONSTRAINT fk_usuario_estudante
FOREIGN KEY (estu_ni_cod)
REFERENCES tb_estudante(estu_ni_cod)
ON DELETE CASCADE;

CREATE TABLE tb_avaliacao(
ava_ni_cod INTEGER NOT NULL AUTO_INCREMENT
);


