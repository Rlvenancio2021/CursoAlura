use funcionarios;

-- Criando uma visualiação padrão dos dados de Funcionários.
CREATE VIEW DadosBasicos AS
	SELECT Nome, Ramal
		FROM funcionario
        ORDER BY nome;
        
SELECT * FROM DadosBasicos;

SHOW CREATE VIEW DadosBasicos;

-- Para alterar o conteúdo da View.
CREATE OR REPLACE VIEW DadosBasicos AS
	SELECT Nome, Ramal
    FROM Funcionario
	ORDER BY nome, ramal;
    
SELECT * FROM DadosBasicos;

-- Comando para excluir a Visão DROP VIEW

## Visões mais Complexas ##
USE Consultorio;

CREATE OR REPLACE VIEW ConsultasEmAberto AS
	SELECT Cliente.nome, C.dataConsulta, C.id,
		(SELECT SUM(valorPago) FROM Pagamento WHERE Pagamento.consulta = C.id) as totalPago,
        (SELECT SUM(valor) FROM ServicoRealizado WHERE ServicoRealizado.consulta = C.id) as totalPagar,
        IF(ISNULL((SELECT totalPago)), (SELECT totalPagar), (SELECT totalPagar) - (SELECT totalPago)) AS faltaPagar
	FROM Cliente join Consulta C
    ON Cliente.id = C.cliente
    HAVING (totalPago < totalPagar) OR ISNULL (totalPago);
    
SELECT * FROM ConsultasEmAberto WHERE faltaPagar>100;

## Criando Nova Tabela com base em uma VISÃO ##
CREATE TABLE ConsultasEmDebito AS SELECT * FROM Consultorio.ConsultasEmAberto;

SELECT * FROM ConsultasEmDebito;