USE VENDAS_SUCOS;

SELECT * FROM NOTAS;
SELECT * FROM ITENS_NOTAS;
SELECT * FROM TB_FATURAMENTO;


/* Essas alteração não altera a TB_FATURAMENTO pois a trigger rodas apenas depois do INSERT */
UPDATE ITENS_NOTAS SET QUANTIDADE = 200
WHERE NUMERO = '0104' AND CODIGO = '1002334';

DELETE FROM ITENS_NOTAS WHERE NUMERO = '0104' AND CODIGO = '1002334';

/* Criando TRIGGER para executar depois de alterar ou deletar dados */

DELIMITER //
CREATE TRIGGER TG_CALCULA_FATURAMENTO_UPDATE AFTER UPDATE ON ITENS_NOTAS
FOR EACH ROW
BEGIN
	DELETE FROM TB_FATURAMENTO;
    INSERT INTO TB_FATURAMENTO
    SELECT A.DATA_VENDA, SUM(B.QUANTIDADE * B.PRECO) AS TOTAL_VENDA FROM
    NOTAS A INNER JOIN ITENS_NOTAS B
    ON A.NUMERO = B.NUMERO
    GROUP BY A.DATA_VENDA;
END //

DELIMITER //
CREATE TRIGGER TG_CALCULA_FATURAMENTO_DELETE AFTER DELETE ON ITENS_NOTAS
FOR EACH ROW
BEGIN
	DELETE FROM TB_FATURAMENTO;
    INSERT INTO TB_FATURAMENTO
    SELECT A.DATA_VENDA, SUM(B.QUANTIDADE * B.PRECO) AS TOTAL_VENDA FROM
    NOTAS A INNER JOIN ITENS_NOTAS B
    ON A.NUMERO = B.NUMERO
    GROUP BY A.DATA_VENDA;
END //

INSERT INTO NOTAS(NUMERO, DATA_VENDA, CPF, MATRICULA, IMPOSTO)
VALUES('0107', '2022-02-15', '1471156710', '235', 0.10);
INSERT INTO ITENS_NOTAS(NUMERO, CODIGO, QUANTIDADE, PRECO)
VALUES('0107','1000889',100, 10);
INSERT INTO ITENS_NOTAS(NUMERO, CODIGO, QUANTIDADE, PRECO)
VALUES('0107','1002334',100, 10);

DELETE FROM ITENS_NOTAS WHERE NUMERO = '0107' AND CODIGO = '1002334';

SELECT * FROM ITENS_NOTAS;

UPDATE ITENS_NOTAS SET QUANTIDADE = 400
WHERE NUMERO = '0100' AND CODIGO = '1002334';