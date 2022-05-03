use Consultorio;

insert into Cliente values
(null,'João Pereira Martins','2198988323',null,30+2),
(null,'Maria do Carmo',null,'maria@aquimesmo.com',40+length('maria')),
(10,'Adriana dos Santos','2133849854',null,19),
(null,'Sandro Farquac',null,null,21);

insert into Dentista values
(null,'Daniel Marcondes','1199899883'),
(null,'Onório Afonso da Silveira','3143356598'),
(null,'Anastácia Gonçalves Dias',null);

insert into Consulta values
(null,'2022-04-11 14:00',(select id from cliente where nome='Maria do Carmo'),3),
(null,'2022-05-10 16:30',1,2),
(null,'2022-06-03 9:00',10,2),
(null,'2022-04-30 13:00',10,(select id from dentista where nome = 'Daniel Marcondes'));

insert into descricaoformapagamento values
('x', 'Cheque'),
('d', 'Dinheiro'),
('c', 'Cartão');

insert into Pagamento values
(null,'2022-6-11',30,'d',1),
(null,'2022-6-13',3,'d',1),
(null,'2022-5,14',50,'c',2),
(null,'2022-6-14',50,'c',2),
(null,'2022-4-20',80,'x',3),
(null,'2022-5-20',80,'x',3),
(null,'2022-6-20',40,'x',3);

insert into TipoServico values
	(null,'Limpeza', 40.00),
    (null,'Restauração',60.00),
    (null,'Canal',200.00),
    (null,'Extração',180.50);
    
insert into ServicoRealizado values
	(null,'Serviço rotina',33,(select id from TipoServico where descricao = 'Limpeza'),1),
    (null,'Primeiro molar',60, @restauro := (select id from TipoServico where descricao = 'Restauração'),4),
    (null,'Segundo molar',55, @restauro, 2),
    (null,'Ciso esquerdo superior',155,(select id from TipoServico where descricao = 'Extração'),2),
    (null,'Canino',200,3,3);