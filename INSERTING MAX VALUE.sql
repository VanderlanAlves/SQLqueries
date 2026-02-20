--INSERTING MAX VALUE

WITH BASE AS (
    SELECT
        DATAFOURLIB2010.dbo.FN_NORMALIZA([Nome]) AS NOME_TRATADO,

        TRY_CAST(
            NULLIF(
                REPLACE(
                    LEFT(
                        LIMPO_FINAL,
                        CHARINDEX(',', LIMPO_FINAL + ',') - 1
                    ),
                    '.', ''
                ),
                ''
            ) AS BIGINT
        ) AS VALOR_TRATADO

    FROM (
        SELECT
            [Nome],
            LTRIM(RTRIM(
                REPLACE(
                    REPLACE(
                        REPLACE(
                            REPLACE(
                                REPLACE(
                                    REPLACE(
                                        COALESCE([REMUNERAÇÃO_LÍQUIDA], ''),
                                        'R$', ''
                                    ),
                                    CHAR(160), ' '
                                ),
                                CHAR(9), ' '
                            ),
                            CHAR(13), ' '
                        ),
                        CHAR(10), ' '
                    ),
                    '  ', ' '
                )
            )) AS LIMPO_FINAL

        FROM [FUNCIONARIOS_PUBLICOS_MUNICIPAIS_202509].[dbo].[RJ_FUNCIONARIOS_PUBLICOS_MUNICIPAIS_RIODEJANEIRO]
    ) x
)

INSERT INTO RJ_FUNCIONARIOS_PUBLICOS_MUNICIPAIS_RIODEJANEIRO_TRATADO (
    NOME_TRATADO,
    VALOR
)
SELECT
    NOME_TRATADO,
    MAX(VALOR_TRATADO) AS VALOR
FROM BASE
WHERE VALOR_TRATADO IS NOT NULL
GROUP BY NOME_TRATADO;
