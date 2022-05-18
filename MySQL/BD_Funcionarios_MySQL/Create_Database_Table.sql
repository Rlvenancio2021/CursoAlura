CREATE DATABASE Funcionarios;

use funcionarios;

create table Funcionario (
	cpf char(11),
    nome varchar(40) not null,
    ramal char(5),
    endereco varchar(100),
    salario decimal(7,2) not null,
    primary key(cpf)
);

insert into Funcionario values
('33344412332', 'Maria das Graças', '20123', null, 4450.00),
('12233233933', 'Cláudia Sabino Fontes', '10323', null, 3249.00),
('98988734444', 'Euzébio Lima', '30434', null, 1989.39);