CREATE DEFINER=`root`@`localhost` PROCEDURE `cursor_looping`()
BEGIN
   DECLARE fim_do_cursor INT DEFAULT 0; -- Variável que vai dizer se o CURSOR tem ou não elementos 0-falso 1-verdadeiro
   DECLARE vNome VARCHAR(50);
   DECLARE c CURSOR FOR SELECT NOME FROM TABELA_DE_CLIENTES;
   DECLARE CONTINUE HANDLER FOR NOT FOUND SET fim_do_cursor = 1; -- defini que o tipo de erro que não para o processamento (erro do tipo FOR NOT FOUND)
   OPEN c;
   WHILE fim_do_cursor = 0
   DO
      FETCH c INTO vNome; -- comando para Abrir o CURSOR
      IF fim_do_cursor = 0 THEN
         SELECT vNome;
      END IF;
   END WHILE;
   CLOSE c; -- comando para Fechar o CURSOR
END