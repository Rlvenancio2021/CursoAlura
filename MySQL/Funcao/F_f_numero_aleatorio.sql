CREATE DEFINER=`root`@`localhost` FUNCTION `f_numero_aleatorio`(min INT, max INT) RETURNS int(11)
BEGIN
	DECLARE vRetorno INT;
	SELECT FLOOR((RAND() * (max - min + 1)) + min) INTO vRetorno;
RETURN vRetorno;
END