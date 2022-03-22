CREATE DEFINER=`root`@`localhost` PROCEDURE `Comparativo_Vendas_case`(vDataInicial DATE, vDataFinal DATE)
BEGIN
DECLARE vFaturamentoInicial FLOAT;
DECLARE vFaturamentoFinal FLOAT;
DECLARE vVariacao float;
DECLARE vMensagem VARCHAR(50);

SELECT SUM(B.QUANTIDADE * B.PRECO) INTO vFaturamentoInicial FROM 
NOTAS_FISCAIS A INNER JOIN ITENS_NOTAS_FISCAIS B
ON A.NUMERO = B.NUMERO
WHERE A.DATA_VENDA = vDataInicial;

SELECT SUM(B.QUANTIDADE * B.PRECO) INTO vFaturamentoFinal FROM 
NOTAS_FISCAIS A INNER JOIN ITENS_NOTAS_FISCAIS B
ON A.NUMERO = B.NUMERO
WHERE A.DATA_VENDA = vDataFinal ;

SET vVariacao = ((vFaturamentoFinal / vFaturamentoInicial) -1) * 100;
	CASE
    WHEN vVariacao > 10 THEN
		SET vMensagem = 'Verde';
		-- SELECT 'Verde' AS Condicao, vVariacao AS Variacao;
	WHEN vVariacao >= -10 AND vVariacao <= 10 THEN
        SET vMensagem = 'Amarelo';
        -- SELECT 'Amarelo' AS Condicao, vVariacao AS Variacao;
	WHEN vVariacao < -10 THEN
		SET vMensagem = 'Vermelho';
        -- SELECT 'Vermelho' AS Condicao, vVariacao AS Variacao;
	END CASE;
    SELECT vMensagem AS Condicao, vVariacao AS Variacao;

END