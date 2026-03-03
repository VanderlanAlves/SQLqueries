BEGIN TRAN;

WITH CTE AS
(
    SELECT *,
           ROW_NUMBER() OVER (
               PARTITION BY NOME_TRATADO, CPF
               ORDER BY RENDA DESC
           ) AS RN
    FROM SERVIDORES_ESTADUAIS_CONSOLIDADO
)
DELETE FROM CTE
WHERE RN > 1;




-- Se estiver correto:
COMMIT;

-- Se estiver errado:
-- ROLLBACK;


