#---- insere curso
DELIMITER $$
 DROP PROCEDURE IF EXISTS sp_insere_curso $$
 
 CREATE PROCEDURE sp_insere_curso (IN p_cod_curso BIGINT,
								   IN p_curso VARCHAR(50),
								   IN p_tip_forma INT(1),
                                   IN p_duracao TINYINT)
 BEGIN
	INSERT INTO tb_curso (curso_ni_cod, curso_vc_nome, curso_ni_tip_forma, curso_ni_duracao)
		VALUES (p_cod_curso, p_curso, p_tip_forma, p_duracao);
 END
#---- // ----

#---- ver curso
DELIMITER $$
 DROP PROCEDURE IF EXISTS sp_ver_curso $$
 
 CREATE PROCEDURE sp_ver_curso (IN p_curso VARCHAR(50))
 BEGIN
	IF (p_curso IS NULL) THEN
		SELECT curso_vc_nome Curso,
			CASE curso_ni_tip_forma
				WHEN 1 then 'Técnologo'
				WHEN 2 then 'Graduação'
				WHEN 3 then 'Pós-Graduação'
				WHEN 4 then 'Doutorado'
			ELSE ''
			END AS Formacao,
			curso_ni_duracao Duracao
		FROM tb_curso ORDER by 3;
    ELSE
		SELECT curso_vc_nome Curso,
			CASE curso_ni_tip_forma
				WHEN 1 then 'Técnologo'
				WHEN 2 then 'Graduação'
				WHEN 3 then 'Pós-Graduação'
				WHEN 4 then 'Doutorado'
			ELSE ''
			END AS Formacao,
			curso_ni_duracao Duracao
		FROM tb_curso 
        WHERE curso_vc_nome = p_curso 
        ORDER by 3;
	END IF;
 END
#---- // ----