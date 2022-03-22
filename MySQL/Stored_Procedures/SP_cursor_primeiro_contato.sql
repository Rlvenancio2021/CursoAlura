CREATE DEFINER=`root`@`localhost` PROCEDURE `cursor_primeiro_contato`()
BEGIN
   
   DECLARE vNome VARCHAR(50);
   DECLARE c CURSOR FOR SELECT NOME FROM TABELA_DE_CLIENTES LIMIT 4;
   OPEN c;
   FETCH c INTO vNome;
   SELECT vNome;
   FETCH c INTO vNome;
   SELECT vNome;
   FETCH c INTO vNome;
   SELECT vNome;
   FETCH c INTO vNome;
   SELECT vNome;
   CLOSE c;

END