-- (ALEATORIO() * (MAX - MIN + 1) + MIN
-- MIN = 15, MAX = 300
-- RAND() função interna randomica que retorno um número aleatório
-- FLOOR() função interna que retorno apenas o número inteiro
SELECT FLOOR((RAND() * (300 - 15 + 1)) + 15);

SET GLOBAL log_bin_trust_function_creators = 1; -- script necessário para abilitar a criação de função.

SELECT f_numero_aleatorio(1, 10);

CREATE TABLE tabela_aleatorios(NUMERO INT);

SELECT FLOOR((RAND() * (1000 - 0 + 1)) + 0);

INSERT INTO tabela_aleatorios(NUMERO) VALUES (f_numero_aleatorio(0,1000));
SELECT * FROM TABELA_ALEATORIOS;

CALL tabela_numeros;
SELECT COUNT(*) FROM tabela_aleatorios;

SELECT f_cliente_aleatorio() AS CPF; -- busca um CPF de forma aleatória
SELECT f_produto_aleatorio() AS CODIGO_DO_PRODUTO;
SELECT f_vendedor_aleatorio() AS MATRICULA;

SELECT f_cliente_aleatorio(), f_produto_aleatorio(), f_vendedor_aleatorio();

-- SP - p_inserir_venda
SELECT MAX(NUMERO) + 1 FROM NOTAS_FISCAIS;

SELECT * FROM TABELA_DE_PRODUTOS;
SELECT PRECO_DE_LISTA FROM TABELA_DE_PRODUTOS WHERE CODIGO_DO_PRODUTO = '1000889';

CALL p_inserir_venda('20220223', 100, 100); -- teste realizados com itens iniciando com 3, 10 e 100

SELECT A.NUMERO, COUNT(*) AS NUMERO_ITENS, SUM(B.QUANTIDADE * B.PRECO) AS FATURADO
FROM NOTAS_FISCAIS A INNER JOIN ITENS_NOTAS_FISCAIS B
ON A.NUMERO = B.NUMERO
WHERE A.DATA_VENDA = '20220223'
GROUP BY A.NUMERO; -- consulta para testar se a SP inserir venda funcionou 