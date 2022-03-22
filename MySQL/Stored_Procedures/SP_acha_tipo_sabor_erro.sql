CREATE DEFINER=`root`@`localhost` PROCEDURE `acha_tipo_sabor_erro`(vProduto VARCHAR(50))
BEGIN

	DECLARE vSabor VARCHAR(50);
    DECLARE msgErro VARCHAR(30);
    DECLARE CONTINUE HANDLER FOR 1339 SET msgErro = 'O CASE não esta completo';
    SELECT SABOR INTO vSabor FROM TABELA_DE_PRODUTOS
    WHERE CODIGO_DO_PRODUTO = vProduto;
    CASE vSabor
		WHEN 'Lima/Limão' THEN SELECT 'Cítrico' AS Tipo;
        WHEN 'Laranja' THEN SELECT 'Cítrico' AS Tipo;
        WHEN 'Morango/Limão' THEN SELECT 'Cítrico' AS Tipo;
        WHEN 'Uva' THEN SELECT 'Neutro' AS Tipo;
        WHEN 'Morango' THEN SELECT 'Neutro' AS Tipo;
	END CASE;
    SELECT msgErro AS Tipo;

END