CREATE DEFINER=`root`@`localhost` PROCEDURE `limite_creditos`()
BEGIN
   DECLARE fim_do_cursor INT DEFAULT 0;
   DECLARE vNome VARCHAR (50);
   DECLARE vLimiteCredito FLOAT;
   DECLARE c CURSOR FOR SELECT NOME, LIMITE_DE_CREDITO FROM TABELA_DE_CLIENTES;
   DECLARE CONTINUE HANDLER FOR NOT FOUND SET fim_do_cursor = 1;
   SET vLimiteCredito =0;
   OPEN c;
   WHILE fim_do_cursor = 0
   DO
   FETCH c INTO vNome, vLimiteCredito;
      IF fim_do_cursor = 0 THEN
         SELECT vNome, vLimiteCredito;
      END IF;
   END WHILE;
   CLOSE c;
END