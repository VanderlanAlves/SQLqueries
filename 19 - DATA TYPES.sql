USE FUNCIONARIOS_PUBLICOS_ESTADUAIS_082025;
GO

SELECT 
    c.name AS ColumnName,
    t.name AS DataType,
    c.max_length,
    c.precision,
    c.scale,
    c.is_nullable
FROM sys.columns c
JOIN sys.types t ON c.user_type_id = t.user_type_id
WHERE c.object_id = OBJECT_ID('SERVIDORES_ESTADUAIS_CONSOLIDADO');