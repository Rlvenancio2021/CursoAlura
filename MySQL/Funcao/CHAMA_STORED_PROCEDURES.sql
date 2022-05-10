/* Criar Stored Procedures via Workbench, botao direito em Stored Procedures e clicar em create */

CALL Ola_Mundo;

CALL MOSTRA_NUMERO;

CALL mostra_numero_alias;

CALL sp_com_funcoes;

CALL sp_com_comentarios;

CALL ALO_MUNDO_2;

CALL EXIBE_VARIAVEL;

call tipos_de_dados;

call hora_data_local;

CALL sem_declaracao; -- não foi declarado variável para verificar o erro

CALL mesmo_tipo_dados;

CALL atribui_valor;

CALL sp_Exerc01;

CALL sp_Exerc01_2;

CALL calcula_idade;

SELECT * FROM TABELA_DE_PRODUTOS WHERE CODIGO_DO_PRODUTO = '4000001';

CALL inclui_novo_produto_parametro('4000001', 'Sabor do Pantanal 1 litro - Melância','Melância','1 Litro', 'PET', 4.76);

SELECT * FROM TABELA_DE_PRODUTOS WHERE CODIGO_DO_PRODUTO = '4000001';

CALL reajuste_comissao(0.50);

SELECT NOME, PERCENTUAL_COMISSAO FROM TABELA_DE_VENDEDORES;

/* Incluindo mensagem no Stored Procedure após altera a SP "inclui_novo_produto_parametro" */

SELECT * FROM TABELA_DE_PRODUTOS WHERE CODIGO_DO_PRODUTO = '4000001';

CALL inclui_novo_produto_parametro('4000001', 'Sabor do Pantanal 1 litro - Melância','Melância','1 Litro', 'PET', 4.76);

CALL inclui_novo_produto_parametro('4000002', 'Sabor do Pantanal 1 litro - Melância','Melância','1 Litro', 'PET', 4.76);

 -- Atribuição de valor usando SELECT
 
SELECT SABOR FROM TABELA_DE_PRODUTOS WHERE codigo_do_produto = '4000001';
 
SELECT codigo_do_produto, sabor FROM TABELA_DE_PRODUTOS;
 
CALL acha_sabor_produto('1013793');
 
SELECT * FROM NOTAS_FISCAIS;

CALL quantidade_notas('2017-01-01');

-- Atribuindo função IF

SELECT * FROM TABELA_DE_CLIENTES;

SELECT DATA_DE_NASCIMENTO FROM TABELA_DE_CLIENTES WHERE CPF =  '1471156710';
SELECT DATA_DE_NASCIMENTO FROM TABELA_DE_CLIENTES WHERE CPF =  '19290992743';

CALL cliente_novo_velho('19290992743');

SELECT DISTINCT DATA_VENDA FROM NOTAS_FISCAIS;

SELECT COUNT(*) FROM NOTAS_FISCAIS WHERE DATA_VENDA = '2015-01-01';
SELECT COUNT(*) FROM NOTAS_FISCAIS WHERE DATA_VENDA = '2015-01-10';

CALL testa_numero_notas('2015-01-10');

-- Atribuindo função IF com ELSEIF

SELECT * FROM TABELA_DE_PRODUTOS;
/*
	>= 12 CARO
    >= 7 e < 12 EM CONTA
    < 7 BARATO
*/

SELECT PRECO_DE_LISTA FROM TABELA_DE_PRODUTOS WHERE CODIGO_DO_PRODUTO = '1000889';
SELECT PRECO_DE_LISTA FROM TABELA_DE_PRODUTOS WHERE CODIGO_DO_PRODUTO = '1086543';
SELECT PRECO_DE_LISTA FROM TABELA_DE_PRODUTOS WHERE CODIGO_DO_PRODUTO = '326779';

CALL acha_status_preco('1000889');

SELECT SUM(B.QUANTIDADE * B.PRECO) AS TOTAL_VENDA FROM 
NOTAS_FISCAIS A INNER JOIN ITENS_NOTAS_FISCAIS B
ON A.NUMERO = B.NUMERO
WHERE A.DATA_VENDA = '20170301';

CALL Comparativo_Vendas('2015-01-10','2015-01-15');

-- Atribuindo função CASE

SELECT DISTINCT CODIGO_DO_PRODUTO, SABOR FROM TABELA_DE_PRODUTOS WHERE CODIGO_DO_PRODUTO = '1000889';

/*
Apenas como um exemplo
'Lima/Limão' - 'Cítrico'
'Laranja' - 'Cítrico'
'Morango/Limão' - 'Cítrico'
'Uva' - 'Nutro'
'Morango' - 'Nutro'
'Outros' - 'Ácido'
*/

CALL acha_tipo_sabor('1000889');

-- Atribuindo função CASE com erro

CALL acha_tipo_sabor_erro('1040107');

-- Atribuindo função CASE Condicional

CALL acha_status_preco_case('1000889');

CALL Comparativo_Vendas_case('2015-01-10','2015-01-15');

-- Usando Looping

CREATE TABLE TAB_LOOPING (ID INT);

-- Utilizando o CURSOR

CALL cursor_primeiro_contato;

CALL cursor_loopicursor_loopingng; -- Com comando WHILE

CALL limite_creditos;
CALL Limite_creditos_ALURA;

SELECT * FROM TABELA_DE_CLIENTES;
CALL looping_cursor_multiplas_colunas;

CALL mais_um_campo;

SELECT * FROM itens_notas_fiscais;