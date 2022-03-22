CREATE DEFINER=`root`@`localhost` PROCEDURE `exibe_variavel`()
BEGIN
DECLARE texto CHAR(20) DEFAULT 'Alô Mundo !!!!';
SELECT texto;
END