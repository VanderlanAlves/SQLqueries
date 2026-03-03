-- criar um modelo para visualizar dados, sem digitar todo o Select: VIEW
create or replace view VW_RelatorioUsuarios as
select u.nome, u.email, u.cidade from usuarios u
inner join cidades c on u.cidade_id = c.id
inner join ufs uf on c.ufid = uf.id
order by u.nome

select * from 

