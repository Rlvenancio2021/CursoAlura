USE VENDAS_SUCOS;

INSERT INTO PRODUTOS(CODIGO,DESCRITOR,SABOR,TAMANHO,EMBALAGEM,PRECO_LISTA)
VALUES('1040107', 'Ligth - 350 ml', 'Melância', '350 ml', 'Lata', 4.56);

INSERT INTO PRODUTOS(CODIGO,DESCRITOR,SABOR,TAMANHO,EMBALAGEM,PRECO_LISTA)
VALUES('1040108', 'Ligth - 350 ml - Graviola', 'Graviola', '350 ml', 'Lata', 4.00);

UPDATE PRODUTOS SET DESCRITOR = 'Ligth - 350 ml - Melância'
WHERE CODIGO = '1040107';

INSERT INTO PRODUTOS
VALUES('1040109', 'Ligth - 350 ml - Açai', 'Açai', '350 ml', 'Lata', 5.60);

INSERT INTO PRODUTOS
VALUES
('1040110', 'Ligth - 350 ml - Jaca', 'Jaca', '350 ml', 'Lata', 6.00),
('1040111', 'Ligth - 350 ml - Manga', 'Manga', '350 ml', 'Lata', 3.50);

SELECT * FROM PRODUTOS;

INSERT INTO CLIENTES
VALUES
('1471156710', 'Érica Carvalho', 'R. Iriquitia', 'Jardins', 'São Paulo','SP','80012212','19900901',27,'F',170000,24500,0),
('19290992743','Fernando Cavalcante','R. Dois de Fevereiro','Água Santa','Rio de Janeiro','RJ','22000000','20000212',18,'M',100000,20000,1),
('2600586709','César Teixeira','Rua Conde de Bonfim','Tijuca','Rio de Janeiro','RJ','22020001','20000312',18,'M',120000,22000,0);

SELECT * FROM CLIENTES;
