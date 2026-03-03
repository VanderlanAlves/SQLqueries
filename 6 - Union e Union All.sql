-- mostrar dados de duas tabelas de uma vez: UNION

--> precisa ser o mesmo tipo de dado da mesma coluna
--> caso os dados forem iguais, ele vai trazer só um
select * from usuarios u
UNION
select * from clientes 

--> precisa ter o mesmo número de colunas OU colocar NULL:
select nome, email from usuarios
union 
select nome, null from clientes

-- trazer todos os dados mesmo que forem repetidos: UNION ALL
select * from usuarios u
UNION all
select * from clientes c
