-- Exercicios Group By e Where

-- Ordenando em ordem alfabética
select * from produtos
order by descricao

-- Listar marcas e quantidade de produtos de cada marca
select marca, count(*) as quantidade from produtos
group by marca

-- Listar marcas que qtd > 1
select marca, count(*) as quantidade from produtos
group by marca
having count(*) > 1

-- Agrupar somente os produtos em que o preco é maior que a media de todos os produtos
select marca, count(*) as quantidade from produtos
where preco > (select avg(preco) from produtos)
group by marca
having count(*) > 1

-- Liste todos os produtos de maior valor de cada marca
select * from produtos prod1
where preco = (select max(preco) from produtos prod2 where prod2.marca = prod1.marca)
                                                  -- compara somente o max, se a marca for igual

