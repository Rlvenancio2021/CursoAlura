CREATE DEFINER=`root`@`localhost` PROCEDURE `mesmo_tipo_dados`()
BEGIN
DECLARE data_1, data_2 DATE DEFAULT '2014-09-13';
SELECT data_1, data_2;
END