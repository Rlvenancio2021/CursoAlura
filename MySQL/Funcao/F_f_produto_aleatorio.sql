CREATE DEFINER=`root`@`localhost` FUNCTION `f_produto_aleatorio`() RETURNS varchar(10) CHARSET utf8mb4
BEGIN
	DECLARE vRetorno VARCHAR(10);
    DECLARE num_max_tabela INT;
    DECLARE num_aleatorio INT;
    SELECT COUNT(*) INTO num_max_tabela FROM tabela_de_produtos;
    SET num_aleatorio = f_numero_aleatorio(1,num_max_tabela);
    SET num_aleatorio = num_aleatorio - 1;
    SELECT codigo_do_produto INTO vRetorno FROM tabela_de_produtos
    LIMIT num_aleatorio,1;
RETURN vRetorno;
END