INSERT INTO tb_faculdade (facul_vc_nome)
VALUES('Universidade São Judas Tadeu');


INSERT INTO tb_campus(facul_ni_cod, campus_vc_nome, campus_vc_endereco)
VALUES (1, 'Butantã', 'Av. Vital Brasil, 1000');
INSERT INTO tb_campus(facul_ni_cod, campus_vc_nome, campus_vc_endereco)
VALUES (1, 'Mooca'  , 'Rua Taquari, 545');

INSERT INTO tb_curso(campus_ni_cod, curso_vc_nome, curso_ni_valor, curso_ni_tip_forma, curso_ni_duracao)
VALUES (1, 'Sistemas de Informação', 1519.13, 2, 8); 
INSERT INTO tb_curso(campus_ni_cod, curso_vc_nome, curso_ni_valor, curso_ni_tip_forma, curso_ni_duracao)
VALUES (2, 'Sistemas de Informação', 1519.13, 2, 8); 
INSERT INTO tb_curso(campus_ni_cod, curso_vc_nome, curso_ni_valor, curso_ni_tip_forma, curso_ni_duracao)
VALUES (2, 'Ciencia da Computação', 1519.13, 2, 8); 
INSERT INTO tb_curso(campus_ni_cod, curso_vc_nome, curso_ni_valor, curso_ni_tip_forma, curso_ni_duracao)
VALUES (2, 'Análise e Desenvolvimento de Sistemas', 1291.32, 1, 5); 


SELECT * FROM TB_FACULDADE;
SELECT * FROM TB_CAMPUS;
SELECT * FROM TB_CURSO;

SELECT facul_vc_nome Faculdade, 
	   campus_vc_nome Campus, 
       curso_vc_nome Curso
	FROM
		tb_faculdade
	INNER JOIN tb_campus ON tb_faculdade.facul_ni_cod = tb_campus.facul_ni_cod
    INNER JOIN tb_curso  ON tb_campus.campus_ni_cod = tb_curso.campus_ni_cod;

INSERT INTO tb_estudante (estu_vc_nome, estu_ni_niv, estu_dt_nasc)
VALUES ('Lucas Bispo Coelho dos Santos', 2, '1995-02-09');

INSERT INTO tb_estudante (estu_vc_nome, estu_ni_niv, estu_dt_nasc)
VALUES ('Matheus Bispo Coelho dos Santos', 1, '1999-05-02');

INSERT INTO tb_usuario (estu_ni_cod, usu_vc_email, usu_vc_senha)
VALUES(3,'lucas.bcsantos@outlook.com',md5('senha$00'));

INSERT INTO tb_usuario (estu_ni_cod, usu_vc_email, usu_vc_senha)
VALUES(4,'theus.bispo@gmail.com',md5('mat0205'));

SELECT estu_vc_nome Nome, 
	   CASE estu_ni_niv
				WHEN 1 then 'Ensino Médio'
				WHEN 2 then 'Universitário'
			ELSE ''
			END AS Estudante,
		usu_vc_email as 'E-mail'
	FROM tb_estudante
    INNER JOIN tb_usuario ON tb_estudante.estu_ni_cod = tb_usuario.estu_ni_cod;