CREATE DEFINER=`root`@`localhost` PROCEDURE `acha_sabor_produto`(vProduto VARCHAR(50))
BEGIN

DECLARE vSabor VARCHAR(50);
SELECT SABOR INTO vSabor FROM TABELA_DE_PRODUTOS WHERE codigo_do_produto = vProduto;
SELECT vSabor;

END