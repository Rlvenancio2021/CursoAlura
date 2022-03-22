CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_com_comentarios`()
BEGIN
/* Vamos exibir itens combinados
entre texto e número */

-- Usando a função CONCAT

SELECT CONCAT ('Alô Mundo!!!!', '.....' , (1+9)-5) AS ITENS_COMBINADOS;
END