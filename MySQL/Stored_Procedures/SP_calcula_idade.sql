CREATE DEFINER=`root`@`localhost` PROCEDURE `calcula_idade`()
BEGIN

UPDATE tabela_de_clientes SET idade = TIMESTAMPDIFF(YEAR, data_de_nascimento, CURDATE());


END