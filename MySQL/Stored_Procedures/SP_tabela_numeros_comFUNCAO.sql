CREATE DEFINER=`root`@`localhost` PROCEDURE `tabela_numeros`()
BEGIN
	DECLARE vContador INT;
	DECLARE vContMaximo INT;
	SET vContador = 0;
	SET vContMaximo = 100;
    DELETE FROM tabela_aleatorios; -- apague os dados antes de rodar o loop
	WHILE vContador < vContMaximo
	DO
		INSERT INTO tabela_aleatorios(NUMERO) VALUES (f_numero_aleatorio(0,1000));
        SET vContador = vContador + 1; -- condição para controle do Looping
	END WHILE;
    SELECT * FROM tabela_aleatorios;
END