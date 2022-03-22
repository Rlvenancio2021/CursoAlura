CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_Exerc01`()
BEGIN
DECLARE cliente VARCHAR(10) DEFAULT 'João';
DECLARE idade INTEGER DEFAULT 10;
DECLARE dataNascimento DATE DEFAULT '2007-01-10';
DECLARE custo FLOAT DEFAULT 10.23;
SELECT cliente, idade, dataNascimento, custo;
END