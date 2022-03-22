CREATE DEFINER=`root`@`localhost` PROCEDURE `soma_dias_notas`()
BEGIN
DECLARE vDataInicial DATE;
DECLARE vDataFinal DATE;
DECLARE vNumNotas INT;
SET vDataInicial = '20170101';
SET vDataFinal = '20170110';
WHILE vDataInicial <= vDataFinal
DO
SELECT COUNT(*) INTO vNumNotas  FROM notas_fiscais WHERE DATA_VENDA = vDataInicial;
SELECT concat(DATE_FORMAT(vDataInicial, '%d/%m/%Y'), ' - ' , CAST(vNumNotas as CHAR(50))) AS Resultado;
SELECT ADDDATE(vDataInicial, INTERVAL 1 DAY) INTO vDataInicial;
END WHILE;

END