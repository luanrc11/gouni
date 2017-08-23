#-------------------------------------------------------------------------------
#function para validar login no sitema
#exemplo de uso -> SELECT fun_valida_usuario ('lucas.bcsantos@outlook.com', 'senha$00');
#retorno 1 VALIDO // 0 INVALIDO
DELIMITER $$
 DROP FUNCTION IF EXISTS fun_valida_usuario $$ 
 CREATE FUNCTION fun_valida_usuario(p_login VARCHAR(50), p_senha VARCHAR(50) ) 
	RETURNS INT (1)
 BEGIN
 DECLARE ret	INT(1) DEFAULT 0;
	SET  ret	= IFNULL( (SELECT DISTINCT 1  
							FROM tb_usuario  
							WHERE usu_vc_login = p_login  
							AND usu_vc_senha = MD5(p_senha) ),0); 
                            
 RETURN ret;  
 END$$  
#-------------------------------------------------------------------------------
