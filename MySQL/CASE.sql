SELECT codigo, descricao,
	CASE
		WHEN quantidade < 10 THEN 'comprar'
		WHEN quantidade > 30 THEN 'fazer promoção'
		ELSE 'nada' END AS Acao
	FROM produto;

-- Atualizando dados
UPDATE produto
	SET descricao = 
		CASE
			WHEN quantidade < 10 THEN concat('(comprar)', descricao)
            WHEN quantidade > 30 THEN concat('(fazer promoção)', descricao)
			ELSE descricao END;