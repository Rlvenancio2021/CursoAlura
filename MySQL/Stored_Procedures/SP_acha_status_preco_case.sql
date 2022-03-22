CREATE DEFINER=`root`@`localhost` PROCEDURE `acha_status_preco_case`(vProduto VARCHAR(50))
BEGIN

	DECLARE vPreco FLOAT;
    DECLARE vMensagem VARCHAR(50);
    SELECT PRECO_DE_LISTA INTO vPreco FROM TABELA_DE_PRODUTOS 
    WHERE CODIGO_DO_PRODUTO = vProduto;
    
    CASE
    WHEN vPreco >= 12 THEN
		SET vMensagem = 'PRODUTO CARO.';
	WHEN vPreco >=7 AND vPreco < 12 THEN
		SET vMensagem = 'PROCUTO EM CONTA.';
	WHEN vPreco < 7 THEN
		SET vMensagem = 'PRODUTO BARATO.';
    END CASE;
    SELECT vMensagem AS Status_Produto;

END