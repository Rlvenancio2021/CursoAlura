CREATE DEFINER=`root`@`localhost` PROCEDURE `looping_cursor_multiplas_colunas`()
BEGIN
   DECLARE fim_do_curso INT DEFAULT 0; -- variável de controle
   DECLARE vNome,vEndereco VARCHAR(150);
   DECLARE vCidade,vEstado,vCep VARCHAR(50);
   DECLARE c CURSOR FOR
   SELECT NOME, ENDERECO_1, CIDADE, ESTADO, CEP FROM TABELA_DE_CLIENTES; -- Declaração do CURSOR
   DECLARE CONTINUE HANDLER FOR NOT FOUND SET fim_do_curso = 1;
   OPEN c;
   WHILE fim_do_curso = 0
   DO
     FETCH c INTO vNome,vEndereco,vCidade,vEstado,vCep;
     IF fim_do_curso = 0 THEN
         SELECT CONCAT(vNome,' ENDEREÇO: ',vEndereco,vEstado,', ',vCidade,', ', vEstado,', ','CEP: ',vCep) AS ENDERECO_COMPLETO;
     END IF;
   END WHILE;
   CLOSE c;
   

END