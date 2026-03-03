-- DDL Data Definition Language

create table produtos (
	id serial primary key,
	descricao varchar(100) not null,
	marca varchar(70) not null,
	qtd_estoque int not null default 0,
	preco decimal(10, 2) not null,
	data_cadastro timestamp not null default now()
);

-- DML Data Manipulation Language

-- Inserindo dados
insert into produtos (descricao, marca, qtd_estoque, preco)
values ('Tênis shockwave', 'Nike', 3, 250.00),
('Tenis slim', 'Nike', 5, 550.50),
('Tenis slim 2', 'Adidas', 5, 359.99),
('Tenis Falcon', 'Adidas', 7, 259.50);

insert into produtos (descricao, marca, qtd_estoque, preco)
values ('Tênis shockwave', 'Nike', 5, 2500.00)


-- listar tenis marca Nike
select * from produtos
where marca = 'Nike';

-- listar Nike e Adidas e preco < 500
select * from produtos
where marca in ('Nike', 'Adidas') and preco < 500;

-- listar tenis preco >= 350
select * from produtos
where preco >= 350;

-- listar tenis Adidas que preco < 500
select * from produtos
where marca = 'Adidas' and preco < 500;

-- listar tenis Nike que preco < 500
select * from produtos
where marca = 'Nike' and preco < 500;

-- media de precos
select avg(preco) from produtos

-- preco produto > que a media dos precos dos produtos
select * from produtos
where preco > (select avg(preco) from produtos)

-- Sub Select / Sub query -> Só pode retornar 1 coluna
update produtos 
set qtd_estoque = qtd_estoque - 3 
where id in (select id from produtos where marca = 'Nike')

-- Count
select count(id) from produtos

-- Distinct -> nao trazer registros repetidos
select distinct descricao from produtos 

-- Contar sem os duplicados
select count(distinct descricao) from produtos

