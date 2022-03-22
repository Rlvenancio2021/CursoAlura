CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_com_funcoes`()
BEGIN
SELECT CONCAT('Alo Mundo !!!!', '....', (1+9)-5) AS ITENS_COMBINADOS; 
END