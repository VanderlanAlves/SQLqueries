SELECT SUM(p.rows) AS total_linhas
FROM DXON_PF.sys.tables t
JOIN DXON_PF.sys.partitions p 
    ON t.object_id = p.object_id
WHERE t.name = 'PF'
AND SCHEMA_NAME(t.schema_id) = 'dbo'
AND p.index_id IN (0,1);
