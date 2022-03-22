CREATE DEFINER=`root`@`localhost` FUNCTION `f_cliente_aleatorio`() RETURNS varchar(11) CHARSET utf8mb4
BEGIN
	DECLARE vRetorno VARCHAR(11); -- variável de retorno da função
    DECLARE num_max_tabela INT;
    DECLARE num_aleatorio INT;
    SELECT COUNT(*) INTO num_max_tabela FROM tabela_de_clientes; -- gravar o resultado do SELECT na variável num_max_tabela (quantidade de registros)
    SET num_aleatorio = f_numero_aleatorio(1, num_max_tabela); -- grava na variável num_aleatorio, um número aleatório entre 1 e o total de registro da tabela_de_clientes (usando a função criada para número aleatórios)
    SET num_aleatorio = num_aleatorio - 1; -- instrução de ajuste para permitir usar a variável num_aleatório na função LIMIT
    SELECT CPF INTO vRetorno FROM tabela_de_clientes
    LIMIT num_aleatorio,1; -- Selecia um CPF, sendo o próximo correspondente ao encontrado na posição gravada na variável num_aleatório conforme descrita no função LIMIT e grava na variável vRetorno.
RETURN vRetorno;
END