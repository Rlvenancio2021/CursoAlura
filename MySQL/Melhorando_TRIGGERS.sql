USE  SUCOS_VENDAS;
CREATE TABLE TAB_FATURAMENTO(DATA_VENDA DATE NULL, TOTAL_VENDA FLOAT);

-- Reescrevendo as TRIGGERS de vinculando uma Stored Procedure para que assim quanto necessário atualizar é preciso modificar apenas a SP
DELIMITER //
CREATE TRIGGER TG_CALCULA_FATURAMENTO_INSERT AFTER INSERT ON ITENS_NOTAS_FISCAIS
FOR EACH ROW BEGIN
	CALL p_calculo_faturamento;
END//

DELIMITER //
CREATE TRIGGER TG_CALCULA_FATURAMENTO_UPDATE AFTER UPDATE ON ITENS_NOTAS_FISCAIS
FOR EACH ROW BEGIN
	CALL p_calculo_faturamento;
END//

DELIMITER //
CREATE TRIGGER TG_CALCULA_FATURAMENTO_DELETE AFTER DELETE ON ITENS_NOTAS_FISCAIS
FOR EACH ROW BEGIN
	CALL p_calculo_faturamento;
END//

CALL p_inserir_venda ('20220223', 3, 100);

SELECT * FROM TAB_FATURAMENTO WHERE DATA_VENDA = '20220223';

-- Para melhora as TRIGGERS é necessário apagar e recria-lás 

DROP TRIGGER TG_CALCULA_FATURAMENTO_INSERT;
DROP TRIGGER TG_CALCULA_FATURAMENTO_UPDATE;
DROP TRIGGER TG_CALCULA_FATURAMENTO_DELETE;