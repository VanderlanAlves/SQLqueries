-- Relações de tabelas
-- Foreign Key, que deve estar no lado N

create table Cidades (
	id serial primary KEY,
	nome varchar(60) not null,
	UFId int not null
);

create table UFs (
	id serial primary KEY,
	sigla varchar(2) not null,
	nome varchar(60) not null
);

-- Criando a constraint            -- Tabela origem_Tabela destino_Campo
alter table cidades add constraint FK_Cidades_UFs_UFId
FOREIGN key (UFId) references UFs (id);

-- Inserindo os dados
insert into UFs (sigla, nome) values ('SP', 'Sao Paulo'), ('PB', 'Paraíba');
insert into ufs (sigla, nome) values ('MG', 'Minas Gerais');

select * from ufs

-- Inserindo a partir dos dados de outra tabela
insert into Cidades (nome, UFId)
select distinct cidade, 
(select Id from ufs where ufs.sigla = usuarios.uf) as UFId
from usuarios




