/* As informações não serão gravadas no banco de dados */
START TRANSACTION;

SELECT * FROM VENDEDORES;

UPDATE VENDEDORES SET COMISSAO = COMISSAO * 1.15;

ROLLBACK;


/* As informações serão gravadas no banco de dados */
START TRANSACTION;

SELECT * FROM VENDEDORES;

UPDATE VENDEDORES SET COMISSAO = COMISSAO * 1.15;

COMMIT;

/* As informações não serão gravadas no banco de dados */
START TRANSACTION;

INSERT INTO `vendas_sucos`.`VENDEDORES`
(`MATRICULA`,
`NOME`,
`BAIRRO`,
`COMISSAO`,
`DATA_ADMISSAO`,
`FERIAS`)
VALUES
('99999',
'João da Silva',
'Icaraí',
0.08,
'2012-01-15',
0);

UPDATE VENDEDORES SET COMISSAO = COMISSAO * 1.15;

INSERT INTO `vendas_sucos`.`VENDEDORES`
(`MATRICULA`,
`NOME`,
`BAIRRO`,
`COMISSAO`,
`DATA_ADMISSAO`,
`FERIAS`)
VALUES
('99998',
'João da Silva2',
'Icaraí',
0.08,
'2012-01-15',
0);

ROLLBACK;


/* As informações serão gravadas no banco de dados */
START TRANSACTION;

INSERT INTO `vendas_sucos`.`VENDEDORES`
(`MATRICULA`,
`NOME`,
`BAIRRO`,
`COMISSAO`,
`DATA_ADMISSAO`,
`FERIAS`)
VALUES
('99999',
'João da Silva',
'Icaraí',
0.08,
'2012-01-15',
0);

UPDATE VENDEDORES SET COMISSAO = COMISSAO * 1.15;

INSERT INTO `vendas_sucos`.`VENDEDORES`
(`MATRICULA`,
`NOME`,
`BAIRRO`,
`COMISSAO`,
`DATA_ADMISSAO`,
`FERIAS`)
VALUES
('99998',
'João da Silva2',
'Icaraí',
0.08,
'2012-01-15',
0);

COMMIT;