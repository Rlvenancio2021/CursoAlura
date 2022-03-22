CREATE DEFINER=`root`@`localhost` PROCEDURE `p_inserir_venda`(vData DATE, max_itens INT, max_quantidade INT)
BEGIN
	DECLARE vCliente VARCHAR(11);
    DECLARE vProduto VARCHAR(10);
    DECLARE vVendedor VARCHAR(5);
    DECLARE vQuantidade INT;
    DECLARE vPreco FLOAT;
    DECLARE vItens INT;
	DECLARE vNumeroNota INT;
    DECLARE vContador INT DEFAULT 1;
    DECLARE vNumItensNota INT; -- variável de controle de quantos itens já tenho na NF de um determinado produto
    
    SELECT MAX(NUMERO) + 1 INTO vNumeroNota FROM NOTAS_FISCAIS; -- criando o número da nota a partir da última NF que consta no BD
    SET vCliente = f_cliente_aleatorio();
    SET vVendedor = f_vendedor_aleatorio();
    INSERT INTO notas_fiscais (CPF, MATRICULA, DATA_VENDA, NUMERO, IMPOSTO)
    VALUES(vCliente, vVendedor, vData, vNumeroNota, 0.18); -- inclusão do cabeçalho da NF
    SET vItens = f_numero_aleatorio(1,max_itens); -- atribuinto o número máximo de itens (conforme o parâmetro disponibilizado para a SP) na variável vItens
	WHILE vContador <= vItens
    DO
		SET vProduto = f_produto_aleatorio();
        SELECT COUNT(*) INTO vNumItensNota FROM itens_notas_fiscais
        WHERE NUMERO = vNumeroNota AND CODIGO_DO_PRODUTO = vProduto; -- este SELECT verifica quantos itens essa NF já tem de um determinado produto
        IF vNumItensNota = 0 THEN        
			SET vQuantidade = f_numero_aleatorio(10, max_quantidade); -- entendendo que para o parâmetro desta função a quantidade mínima é de 10 itens
			SELECT PRECO_DE_LISTA INTO vPreco FROM TABELA_DE_PRODUTOS
			WHERE CODIGO_DO_PRODUTO = vProduto;
			INSERT INTO itens_notas_fiscais(NUMERO, CODIGO_DO_PRODUTO, QUANTIDADE, PRECO)
			VALUES (vNumeroNota, vProduto, vQuantidade, vPreco); -- utliza as variáveis para carregar as informações
        -- Este comando serve para corrigir o problema do programa ficar apresentando erro de duplicidade de itens
        END IF;
        SET vContador = vContador + 1; -- estando dentro do IF, ele tenta pegar outro item até achar um que nunca foi escolhido, estando fora do IF ele despesa um item
    END WHILE;
END