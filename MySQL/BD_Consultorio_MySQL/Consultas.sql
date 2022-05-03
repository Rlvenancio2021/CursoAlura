select Cliente.nome, Consulta.dataConsulta, Pagamento.valorPago, Pagamento.dataPagamento, D.descricao
	from Cliente 
		join Consulta
        join Pagamento
        join DescricaoFormaPagamento D
	on
		Cliente.id = Consulta.cliente and
        Pagamento.consulta = Consulta.id and
        Pagamento.formaPagamento = D.codigo
	order by Cliente.nome;

select descricao, observacao, valor,dataConsulta
	from ServicoRealizado join
		Consulta join
        TipoServico
	on
		tipo = TipoServico.id and
        consulta = Consulta.id;


select Cliente.nome, sum(Pagamento.valorPago), Consulta.dataConsulta, Pagamento.dataPagamento
	from
		Cliente join
        Consulta join
        Pagamento
	on
		Cliente.id = Consulta.cliente and
        Pagamento.consulta = Consulta.id
	where Cliente.nome = 'Maria do Carmo'
	group by Cliente.nome, Consulta.dataConsulta, Pagamento.dataPagamento
    order by Cliente.nome;
    
## Consulta com HAVING ##
select Cliente.nome,sum(Pagamento.valorPago) as Total, Consulta.dataConsulta
	from
		Cliente join Consulta join Pagamento
	on
		Cliente.id = Consulta.cliente and
        Pagamento.consulta = Consulta.id
    group by Cliente.nome, Consulta.dataConsulta
    having sum(Pagamento.valorPago) >= 100
    order by Cliente.nome;

## Consulta com HAVING e WHERE ##
select Cliente.nome,sum(Pagamento.valorPago) as Total, Consulta.dataConsulta
	from
		Cliente join Consulta join Pagamento
	on
		Cliente.id = Consulta.cliente and
        Pagamento.consulta = Consulta.id
	where Consulta.dataConsulta > '2022-06-01'
    group by Cliente.nome, Consulta.dataConsulta
    having sum(Pagamento.valorPago) >= 100
    order by Cliente.nome;

## Consulta com EXISTS ##

select dataConsulta as 'Data da Consulta', id, (select sum(valor) from ServicoRealizado where consulta = C.id) as 'Valor da Consulta'
	from
		Consulta C
	where not exists (select * from Pagamento where consulta = C.id);