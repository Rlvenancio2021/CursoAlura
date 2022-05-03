use Consultorio;

create table Cliente(
id smallint unsigned auto_increment,
nome varchar(30) not null,
telefone varchar(11) default '',
email varchar(45) default '',
idade tinyint unsigned not null,
primary key(id)
);

create table Dentista(
id smallint unsigned auto_increment,
nome varchar(30) not null,
telefone varchar(11) default'',
primary key(id),
check (length(telefone) >= 8 )
);

## Criado TRIGGER para validação do telefone dos Dentista ##
delimiter $$
create trigger Dentista_telefonevalido Before insert on Dentista
for each row
begin
	if length(new.telefone) < 8 then
		signal sqlstate '12345' set message_text = 'check constraint telefone válido falhou';
	end if;
end $$

delimiter ;

create table Consulta(
id integer unsigned auto_increment,
dataConsulta datetime,
cliente smallint unsigned,
dentista smallint unsigned,
primary key(id),
constraint oCliente foreign key (cliente) references Cliente(id),
constraint oDentista foreign key (dentista) references Dentista(id),
constraint umaConsulta unique (cliente,dentista,dataConsulta)
);

create table Pagamento(
id integer unsigned auto_increment,
dataPagamento date not null,
valorPago decimal(6,2) not null,
formaPagamento char(1),
consulta integer unsigned,
primary key(id),
constraint pagamentoConsulta foreign key(consulta) references Consulta(id)
);

create table DescricaoFormaPagamento(
codigo char(1),
descricao varchar(20),
primary key(codigo)
);

alter table Pagamento add constraint umTipoPagamento foreign key (formaPagamento) references DescricaoFormaPagamento(codigo);

create table TipoServico(
	id integer unsigned auto_increment,
    descricao varchar(45) not null,
    preco decimal(6,2) not null,
    primary key(id)
    );
    
create table ServicoRealizado(
	id integer unsigned auto_increment,
    observacao varchar(45) not null,
    valor decimal(6,2) not null,
    tipo integer unsigned,
    consulta integer unsigned,
    primary key(id),
    constraint tipoServico foreign key (tipo) references TipoServico(id),
    constraint aConsulta foreign key (consulta) references Consulta(id)
);
