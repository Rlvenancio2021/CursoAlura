SET GLOBAL log_bin_trust_function_creators = 1;

SELECT f_acha_tipo_sabor('Laranja') AS SABOR;

SELECT NOME_DO_PRODUTO, SABOR, f_acha_tipo_sabor(SABOR) AS TIPO FROM TABELA_DE_PRODUTOS;

SELECT NOME_DO_PRODUTO, SABOR, f_acha_tipo_sabor(SABOR) AS TIPO FROM TABELA_DE_PRODUTOS
WHERE f_acha_tipo_sabor(SABOR) = 'Neutro';

SELECT f_numero_notas('20170101') AS QUANTIDADE_NOTAS;