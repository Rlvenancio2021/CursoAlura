CREATE DEFINER=`root`@`localhost` PROCEDURE `atribui_valor`()
BEGIN
DECLARE texto VARCHAR(30) DEFAULT 'Texto inicial';
SELECT texto;
SET texto = 'Texto modificado';
SELECT texto;
END