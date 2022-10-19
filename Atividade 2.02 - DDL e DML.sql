--Tabelas Iniciais

create table funcionario(
	matricula numeric(6) not null, 
	nome varchar(100) not null, 
	cod_cargo numeric(4) not null
);
create table cargo(
	cod_cargo numeric(4) not null, 
	nm_cargo varchar(40) not null
);
create table aloca(
	horas numeric(3) not null,
	matricula numeric(6) not null,
	cod_proj numeric(4) not null
);
create table projeto(
	cod_proj numeric(4) not null, 
	dt_fim date not null
);

alter table funcionario add constraint pk_funcionario primary key (matricula);
alter table cargo add constraint pk_cargo primary key (cod_cargo);
alter table projeto add constraint pk_projeto primary key (cod_proj);


alter table funcionario add constraint fk_funcionario_cargo foreign key (cod_cargo) references cargo (cod_cargo);
alter table aloca add constraint fk_aloca_funcionario foreign key (matricula) references funcionario (matricula);
alter table aloca add constraint fk_aloca_projeto foreign key (cod_proj) references projeto (cod_proj);


--Insert de dados

insert into cargo (cod_cargo, nm_cargo) values (1, 'Programador'), 
(2, 'Analista'),
(3, 'Projetista');

insert into funcionario (matricula, nome, cod_cargo) values (120, 'João',1),
(121, 'Hélio',1),
(270, 'Gabriel',2), 
(273, 'Silva',3), 
(306, 'Manoel',3), 
(279, 'Carla',1),
(274, 'Abraão',2), 
(301, 'Ana',1);

insert into projeto (cod_proj, dt_fim) values (1, '17/07/1995'),
(8, '12/01/1996'), 
(12, '21/03/1996'), 
(17, '21/03/1996');

insert into aloca (matricula, cod_proj, horas) values (120, 1, 37),
(120, 8, 12), 
(121, 1, 45), 
(121, 8, 21), 
(121, 12, 107), 
(270, 8, 10),
(270, 12, 38), 
(273, 1, 22), 
(274, 12, 31), 
(279, 1, 27), 
(279, 8, 20),
(279, 12, 51), 
(301, 12, 16), 
(306, 17, 67);


--Manutenção

create table cliente(
	cod_cliente numeric(6) not null, 
	cliente varchar(40) not null
);

alter table cliente add constraint pk_cliente primary key (cod_cliente);

alter table projeto add nm_proj varchar(30); 
alter table projeto add cod_cliente numeric(6); 

alter table projeto add constraint fk_projeto_cliente foreign key (cod_cliente) references cliente (cod_cliente);


--Insert depois de ter feito as mudanças

insert into cliente (cod_cliente, cliente) values (1010, 'Amazon'),
(1520, 'Google'), 
(3355, 'RSET');

update projeto set nm_proj='Alpha' where cod_proj=1;
update projeto set nm_proj='Beta' where cod_proj=8;
update projeto set nm_proj='Delta' where cod_proj=12;
update projeto set nm_proj='Gamma' where cod_proj=17;

update projeto set cod_cliente=1010 where cod_proj=1;
update projeto set cod_cliente=1520 where cod_proj=8;
update projeto set cod_cliente=3355 where cod_proj=12;
update projeto set cod_cliente=3355 where cod_proj=17;


--Alterando colunas para not null ja que tem informações
alter table projeto alter column nm_proj set not null;
alter table projeto alter column cod_cliente set not null;