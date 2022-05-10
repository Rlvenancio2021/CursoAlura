USE VENDAS_SUCOS;

INSERT INTO PRODUTOS (CODIGO,DESCRITOR,SABOR,TAMANHO,EMBALAGEM,PRECO_LISTA)

     VALUES ('1001001','Sabor dos Alpes 700 ml - Manga','Manga','700 ml','Garrafa',7.50),

         ('1001000','Sabor dos Alpes 700 ml - Melão','Melão','700 ml','Garrafa',7.50),

         ('1001002','Sabor dos Alpes 700 ml - Graviola','Graviola','700 ml','Garrafa',7.50),

         ('1001003','Sabor dos Alpes 700 ml - Tangerina','Tangerina','700 ml','Garrafa',7.50),

         ('1001004','Sabor dos Alpes 700 ml - Abacate','Abacate','700 ml','Garrafa',7.50),

         ('1001005','Sabor dos Alpes 700 ml - Açai','Açai','700 ml','Garrafa',7.50),

         ('1001006','Sabor dos Alpes 1 Litro - Manga','Manga','1 Litro','Garrafa',7.50),

         ('1001007','Sabor dos Alpes 1 Litro - Melão','Melão','1 Litro','Garrafa',7.50),

         ('1001008','Sabor dos Alpes 1 Litro - Graviola','Graviola','1 Litro','Garrafa',7.50),

         ('1001009','Sabor dos Alpes 1 Litro - Tangerina','Tangerina','1 Litro','Garrafa',7.50),

         ('1001010','Sabor dos Alpes 1 Litro - Abacate','Abacate','1 Litro','Garrafa',7.50),

         ('1001011','Sabor dos Alpes 1 Litro - Açai','Açai','1 Litro','Garrafa',7.50);

SELECT * FROM PRODUTOS WHERE SUBSTRING(DESCRITOR,1,15) = 'Sabor dos Alpes';

DELETE FROM PRODUTOS WHERE CODIGO = '1001000';

SELECT * FROM PRODUTOS WHERE SUBSTRING(DESCRITOR,1,15) = 'Sabor dos Alpes';

SELECT * FROM PRODUTOS WHERE TAMANHO = '1 Litro' AND SUBSTRING(DESCRITOR,1,15) = 'Sabor dos Alpes';

DELETE FROM PRODUTOS WHERE TAMANHO = '1 Litro'
AND SUBSTRING(DESCRITOR,1,15) = 'Sabor dos Alpes';

SELECT CODIGO_DO_PRODUTO FROM SUCOS_VENDAS.TABELA_DE_PRODUTOS;

SELECT CODIGO FROM PRODUTOS WHERE CODIGO 
NOT IN (SELECT CODIGO_DO_PRODUTO FROM SUCOS_VENDAS.TABELA_DE_PRODUTOS);

/* Deletar informações usando como base conteúdo de outra tabela*/
DELETE FROM PRODUTOS WHERE
CODIGO NOT IN (SELECT CODIGO_DO_PRODUTO FROM SUCOS_VENDAS.TABELA_DE_PRODUTOS);

SELECT * FROM CLIENTES WHERE IDADE <= 18;

SELECT NUMERO FROM NOTAS WHERE 
CPF = '19290992743' OR CPF = '2600586709' OR CPF = '95939180787'
ORDER BY NUMERO;

SELECT NUMERO FROM NOTAS WHERE
CPF IN (SELECT CPF FROM CLIENTES WHERE IDADE <= 18)
ORDER BY NUMERO;

DELETE FROM NOTAS WHERE
CPF IN (SELECT CPF FROM CLIENTES WHERE IDADE <= 18);
/* OU */

SELECT A.NUMERO FROM NOTAS A
INNER JOIN CLIENTES B ON A.CPF = B.CPF
WHERE B.IDADE <= 18;

DELETE A FROM NOTAS A
INNER JOIN CLIENTES B ON A.CPF = B.CPF
WHERE B.IDADE <= 18