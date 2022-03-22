CREATE DEFINER=`root`@`localhost` PROCEDURE `inclui_novo_produto`()
BEGIN

DECLARE vCodigo VARCHAR(50) DEFAULT '3000001';
DECLARE vNome VARCHAR(50) DEFAULT 'Sabor do Mar 700 ml - Manga';
DECLARE vSAbor VARCHAR(50) DEFAULT 'Manga';
DECLARE vTamanho VARCHAR(50) DEFAULT '700 ml';
DECLARE vEmbalagem VARCHAR(50) DEFAULT 'Garrafa';
DECLARE vPreco DECIMAL(10,2) DEFAULT 9.25;

INSERT INTO tabela_de_produtos (CODIGO_DO_PRODUTO,NOME_DO_PRODUTO,SABOR,TAMANHO,EMBALAGEM,PRECO_DE_LISTA)
    VALUES (
    vCodigo,
    vNome,
    vSAbor,
    vTamanho,
    vEmbalagem,
    vPreco);

END