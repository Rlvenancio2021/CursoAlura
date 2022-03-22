CREATE DEFINER=`root`@`localhost` PROCEDURE `Comparativo_Vendas`(vDataInicial DATE, vDataFinal DATE)
BEGIN
DECLARE vFaturamentoInicial FLOAT;
DECLARE vFaturamentoFinal FLOAT;
DECLARE vVariacao float;

SELECT SUM(B.QUANTIDADE * B.PRECO) INTO vFaturamentoInicial FROM 
NOTAS_FISCAIS A INNER JOIN ITENS_NOTAS_FISCAIS B
ON A.NUMERO = B.NUMERO
WHERE A.DATA_VENDA = vDataInicial;

SELECT SUM(B.QUANTIDADE * B.PRECO) INTO vFaturamentoFinal FROM 
NOTAS_FISCAIS A INNER JOIN ITENS_NOTAS_FISCAIS B
ON A.NUMERO = B.NUMERO
WHERE A.DATA_VENDA = vDataFinal ;

SET vVariacao = ((vFaturamentoFinal / vFaturamentoInicial) -1) * 100;
	IF vVariacao > 10 THEN
		SELECT 'Verde' AS Condicao, vVariacao AS Variacao;
	ELSEIF vVariacao >= -10 AND vVariacao <= 10 THEN
		SELECT 'Amarelo' AS Condicao, vVariacao AS Variacao;
	ELSE
		SELECT 'Vermelho' AS Condicao, vVariacao AS Variacao;
	END IF;   

END