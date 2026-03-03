-- busca binária --> indice

--> mais usado em:
-- consulta com muita frequencia
-- Foreign key

-- indice nao clusterizado (nao primario)
create index IX_Usuarios_Email
on usuarios(email)

-- FK --> exemplo: todos de SP juntos
create index IX_Usuarios_cidadeId
on usuarios(cidadeId)

-- indice unico
create unique index IX_Usuarios_cidadeId
on usuarios(email)