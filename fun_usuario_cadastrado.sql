#-------------------------------------------------------------------------------
#function para validar se usuario ja cadastrado
#exemplo de uso -> SELECT fun_usuario_cadastrado('lucas.bcsantos@outlook.com');
#retorno 0 N CADASTRADO // 1 CADASTRADO
DELIMITER $$
 DROP FUNCTION IF EXISTS fun_usuario_cadastrado $$
 CREATE FUNCTION fun_usuario_cadastrado (p_login VARCHAR(50) )
	RETURNS INT (1)
 BEGIN
 DECLARE ret	INT (1) DEFAULT 0;
	SET  ret	= IFNULL( (SELECT DISTINCT 1
						   FROM tb_usuario
                           WHERE usu_vc_login = p_login),0);
RETURN ret;
END$$
#--------------------------------------------------------------------------------