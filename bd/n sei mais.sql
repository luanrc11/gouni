#---- insere faculdade e campus
DELIMITER $$
 DROP PROCEDURE IF EXISTS sp_insere_faculdade_campus $$
 CREATE PROCEDURE sp_insere_faculdade_campus ( IN p_cod_facul BIGINT,
											   IN p_facul VARCHAR(50),
											   IN p_cod_campus BIGINT,
                                               IN p_curso BIGINT,
                                               IN p_campus VARCHAR(50),
                                               IN p_endereco VARCHAR (150))
 BEGIN
     INSERT INTO tb_faculdade(facul_ni_cod, facul_vc_nome)
		VALUES (p_cod_facul, p_facul);
        
	INSERT INTO tb_faculdade_campus(ni_cod_campus, ni_cod_facul, ni_cod_curso, vc_campus, vc_endereco)
		VALUES (p_cod_campus, p_cod_facul, p_curso, p_campus, p_endereco);
END

CALL sp_ver_curso(null);

CALL sp_insere_faculdade_campus(200,'Universidade Paulista', 201, 100, 'UNIP - Alphaville', 'Alameda Araguaia, 2992');

	select * from tb_faculdade;
	select * from tb_faculdade_campus;
select * from tb_curso;