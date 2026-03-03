-- Inner Join -> Pega valores onde há match entre tabelas
-- tabela esquerda
-- tabela direita
select * from cidades c -- tabela esquerda
inner join UFs u on c.ufid = u.id -- pegue tudo de cidades, junte com UFs, onde o UFid da Cidade = Id da UF


-- right join -> pega todos os dados da tabela da esquerda e os dados da intersecção
select * from cidades c 
right join ufs u on c.ufid = u.id

-- full join
select * from cidades c 
full join ufs u on c.ufid = u.id

-- Criando a FK para add uma cidade para cada usuario
alter table usuarios add column cidade_id int;
alter table usuarios add constraint FK_Usuarios_Cidades_CidadeId
foreign key(cidade_Id) references cidades(id)

-- Atribuindo a FK cidade para cada usuario
update usuarios set cidade_id = (select Id from cidades c 
	where c.nome = cidade and
	c.ufid = (
			select Id from ufs u where u.sigla = uf)
							   );
							   
-- alter table usuarios drop column cidade, uf

-- pesquisar todos os users from Sao Paulo
select * from usuarios u
where cidade_id = (select Id from cidades c where nome = 'São Paulo')

-- trazer os users and cities
select * from usuarios u
inner join cidades c on u.cidade_id = c.id
inner join ufs uf on c.ufid = uf.id

-- formatado
select u.nome, u.email, u.cidade from usuarios u
inner join cidades c on u.cidade_id = c.id
inner join ufs uf on c.ufid = uf.id
order by u.nome