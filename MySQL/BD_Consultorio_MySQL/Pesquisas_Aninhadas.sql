# Não estamos limiados a apenas uma pesquisa dentro de outra.

use Consultorio;

Select Cliente.nome, C.id, C.dataConsulta
	from
		Cliente join
        Consulta C
	on
		Cliente.id = C.cliente
	
    where
		(select sum(valorPago) from pagamento where Pagamento.consulta = C.id) -- CONSULTA
        <
        (select sum(valor) from ServicoRealizado where ServicoRealizado.consulta = C.id); -- CONSULTA
        
## Comparação com valores NULOS
-- Comparações com valores nulos, em geral, geram resultados indesejados. Uma forma de resolver a questão é incluir um filtro NOT EXISTS à cláusula WHERE

select Cliente.nome, C.id, C.dataConsulta
	from
		Cliente join
        Consulta C
	on
		Cliente.id = C.cliente
	where
		not exists (select valorPago from pagamento where Pagamento.consulta = C.id)
        or
        (select sum(valorPago) from Pagamento where Pagamento.consulta = C.id)
        <
        (select sum(valor) from ServicoRealizado where ServicoRealizado.consulta = C.id);
        
-- Uma outra forma de fazer seria:

select Cliente.nome, C.dataConsulta, C.id,
	(select sum(valorPago) from Pagamento where Pagamento.consulta = C.id) as totalPago,
    (select sum(valor) from ServicoRealizado where ServicoRealizado.consulta = C.id) as aPagar
    from
		Cliente join
        Consulta C
	on
		Cliente.id = C.cliente
	having
		(totalPago < aPagar)
        or isnull(totalpago);
        
-- Uma outra forma de fazer seria:

select Cliente.nome, C.dataConsulta, C.id,
	(select sum(valorPago) from Pagamento where Pagamento.consulta = C.id) as totalPago,
    (select sum(valor) from ServicoRealizado where ServicoRealizado.consulta = C.id) as aPagar,
    (select apagar) - (select totalpago) as 'Falta Pagar'
    from
		Cliente join
        Consulta C
	on
		Cliente.id = C.cliente
	having
		(totalPago < aPagar)
        or isnull(totalPago);
        
-- Outra forma de fazer com uso de VARIÁVEIS para realizar calculos com valores NULL

select Cliente.nome, C.dataConsulta, C.id,
	@pago := (select sum(valorPago) from Pagamento where Pagamento.consulta = C.id) as totalPago,
    @total := (select sum(valor) from ServicoRealizado where ServicoRealizado.consulta = C.id) as aPagar,
    CAST(if(isnull(@pago),@total, @total-@pago) as decimal (6,2)) as FaltaPagar
    
    from
		Cliente join
        Consulta C
	on
		Cliente.id = C.cliente
	having
		(totalPago < aPagar) or isnull(totalPago);
        
## Também podemos utilizar uma pesquisa aninhada no lugar de uma tablea, na cláusula FROM de um comando SELECT ##

select P.totalPago, S.aPagar, S.aPagar - P.totalPago as 'Falta Pagar', Consulta.dataConsulta, Consulta.id
	from
		Consulta
			join
			(select consulta, sum(valorPago) as totalPago from Pagamento group by consulta) as P
            join
            (select consulta, sum(valor) as aPagar from ServicoRealizado group by consulta) as S
	on
		P.consulta = Consulta.id and
        S.consulta = Consulta.id;