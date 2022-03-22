
/* COMANDO EXPLAIN 

EXPLAIN SELECT A.NOME_DO_PRODUTO FROM TABELA_DE_PRODUTOS A; - pode ser executado no Workbench
EXPLAIN SELECT A.NOME_DO_PRODUTO FROM TABELA_DE_PRODUTOS A \G - executável apenas em linhas de comando
EXPLAIN FORMAT = JSON SELECT A.NOME_DO_PRODUTO FROM TABELA_DE_PRODUTOS A \G - executável apenas em linhas de comando
 - FORMAT=JSOIN apresenta mais detalhes inclusive o valor de QUERY COST
 */


-- 3.35 QUERY COST
SELECT A.NOME_DO_PRODUTO FROM TABELA_DE_PRODUTOS A;

-- 35464.94 QUERY COST
SELECT A.NOME_DO_PRODUTO, C.QUANTIDADE FROM TABELA_DE_PRODUTOS A
INNER JOIN ITENS_NOTAS_FISCAIS C ON A.CODIGO_DO_PRODUTO = C.CODIGO_DO_PRODUTO;

-- 115231.15 QUERY COST
SELECT A.NOME_DO_PRODUTO, YEAR(B.DATA_VENDA) AS ANO, C.QUANTIDADE FROM TABELA_DE_PRODUTOS A
INNER JOIN ITENS_NOTAS_FISCAIS C ON A.CODIGO_DO_PRODUTO = C.CODIGO_DO_PRODUTO
INNER JOIN NOTAS_FISCAIS B ON C.NUMERO = B.NUMERO;

-- 115231.15 QUERY COST
SELECT A.NOME_DO_PRODUTO, YEAR(B.DATA_VENDA) AS ANO, SUM(C.QUANTIDADE) AS QUANTIDADE FROM TABELA_DE_PRODUTOS A
INNER JOIN ITENS_NOTAS_FISCAIS C ON A.CODIGO_DO_PRODUTO = C.CODIGO_DO_PRODUTO
INNER JOIN NOTAS_FISCAIS B ON C.NUMERO = B.NUMERO
GROUP BY A.NOME_DO_PRODUTO, YEAR(B.DATA_VENDA)
ORDER BY A.NOME_DO_PRODUTO, YEAR(B.DATA_VENDA);