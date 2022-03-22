CREATE DEFINER=`root`@`localhost` PROCEDURE `acha_tipo_sabor`(vProduto VARCHAR(50))
BEGIN

	DECLARE vSabor VARCHAR(50);
    SELECT SABOR INTO vSabor FROM TABELA_DE_PRODUTOS
    WHERE CODIGO_DO_PRODUTO = vProduto;
    CASE vSabor
		WHEN 'Lima/Limão' THEN SELECT 'Cítrico' AS Tipo;
        WHEN 'Laranja' THEN SELECT 'Cítrico' AS Tipo;
        WHEN 'Morango/Limão' THEN SELECT 'Cítrico' AS Tipo;
        WHEN 'Uva' THEN SELECT 'Neutro' AS Tipo;
        WHEN 'Morango' THEN SELECT 'Neutro' AS Tipo;
        ELSE SELECT 'Ácido' AS Tipo;
	END CASE;

END