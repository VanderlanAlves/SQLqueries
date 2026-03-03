-- DDL Data Definition Language

create table Usuarios (
	Id serial primary key,
	nome varchar(250),
	cpf varchar(11),
	email varchar(250)
);

-- alterando para 60 caracteres
alter table Usuarios
alter column nome type varchar(60);

alter table usuarios
alter COLUMN cpf type varchar(60);

alter table usuarios
alter COLUMN email type varchar(60);

alter table usuarios 
add column cidade varchar(50);

alter table usuarios 
alter column UF type char(2);


-- DML Data Manipulation Language

-- Inserindo dados
insert into Usuarios
values (
	1, 'Vanderlan Alves', '12345678910', 'vanderlan@gmail.com', 'Santo André', 'SP');

insert into Usuarios
values (
	2, 'Romildo Carlos', '11111111111', 'romildo@carlos.com',  'Santo André', 'PB');

insert into Usuarios (
	id, nome, cpf)
values (
	3, 'Carlos Eduardo', '22222222222');
	
insert into Usuarios (
	nome, id, email)
values (
	'Gustavo José', 4, 'guga@bol.com');
	
-- Adequando dados para alterar campos para not null
UPDATE usuarios set cpf = 'xxxxxxxxxxx'
where id = 4;

update usuarios set email = ''
where id = 3;

-- alterando campos para not null

alter table Usuarios
alter column nome set not null;

alter table Usuarios
alter column cpf set not null;

alter table Usuarios
alter column email set not null;

-- Alterando a sequencia para add usuario sem colocar o ID (num = prox ID)
alter sequence usuarios_id_seq restart with 5;
	
insert into usuarios (nome, cpf, email)
values ('Robert', '32132132111', 'robert@gmail.com');

-- inserindo varios usuarios ao mesmo tempo
insert into usuarios (nome, cpf, email)
values ('Roberta', '22222222222', 'roberta@gmail.com'),
('Carla', '55555555555', 'carla@gmail.com');

-- UPDADE 
UPDATE usuarios set cidade = 'São Paulo', UF = 'SP'
where id = 4;

update usuarios set cidade = 'São Paulo', UF = 'SP'
where id = 3;

update usuarios set cidade = 'Santo André', UF = 'SP'
where id = 5;

update usuarios set cidade = 'Santo André', UF = 'PB'
where id = 6;

-- ver a tabela
select * from Usuarios



