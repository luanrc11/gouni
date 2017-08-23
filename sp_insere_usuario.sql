#-------------------------------------------------------------------------------
#procedure de insercao de usuario
#exemplo de uso ->SELECT fun_valida_usuario ('lucas.bcsantos@outlook.com', 'senha$00');
DELIMITER $$
 DROP PROCEDURE IF EXISTS sp_insere_usuario $$
 CREATE PROCEDURE sp_insere_usuario (IN p_email VARCHAR(50), IN p_senha VARCHAR (50))
 BEGIN
	INSERT INTO tb_usuario(usu_ni_cod, usu_vc_login, usu_vc_senha)
		VALUES (NULL, p_email, MD5(p_senha));
END
#-------------------------------------------------------------------------------
