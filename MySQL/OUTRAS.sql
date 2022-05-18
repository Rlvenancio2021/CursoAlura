## TRIM, LTRIM, RTRIM ##

SET @s := "    teste    ";

SELECT CONCAT('*',LTRIM(@s),'*',RTRIM(@s),'*',TRIM(@s),'*');

## FORMAT ##

SELECT descricao, FORMAT(preco,2,'pt_br') as preco FROM produto; -- Formado o valor para 2.50 para 2,50 no padrão brasileiro

## FUNÇÕES MATEMÁTICAS ##

SELECT CEIL(13.4), CEIL(-13.4), FLOOR(13.4), FLOOR(-13.4), ROUND(13.4);

SELECT RAND(333), RAND(), RAND(), RAND(333), RAND(), RAND();

## FUNÇÕES DE MANIPULAÇÃO DE DATA ##

SELECT dataCompra, 
	ADDDATE(dataCompra, INTERVAL 2 DAY) AS col2, -- Soma 2 dias na data
	ADDDATE(dataCompra, INTERVAL 2 MONTH) AS col3, -- Soma 2 meses na data
    ADDDATE(dataCompra, INTERVAL 2 YEAR) AS col4 FROM Compra; -- Soma 2 anos na data

SELECT dataCompra, DATEDIFF(NOW(), dataCompra) AS dias FROM Compra;

SELECT dataCompra,
	DAY(dataCompra) AS dia,
    MONTH(dataCompra) AS mes,
    YEAR(dataCompra) AS ano FROM compra;