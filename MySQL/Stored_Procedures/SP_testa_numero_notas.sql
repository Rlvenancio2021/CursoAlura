CREATE DEFINER=`root`@`localhost` PROCEDURE `testa_numero_notas`(vData DATE)
BEGIN

	DECLARE vNumNotas INT;
	SELECT COUNT(*) INTO vNumNotas FROM NOTAS_FISCAIS WHERE DATA_VENDA = vData;
	IF vNumNotas > 70 THEN
		SElECT 'Muita nota' AS ANALISE, vNumNotas AS QUANTIDADE_DE_NF;
	ELSE
		SELECT 'Pouca nota' AS ANALISE, vNumNotas AS QUANTIDADE_DE_NF;
	END IF;
    
END