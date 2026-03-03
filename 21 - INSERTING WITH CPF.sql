-- INSERTING WITH CPF

INSERT INTO PA_FUNCIONARIOS_PUBLICOS_MUNICIPAIS_BELEM_TRATADO (
    NOME_TRATADO,
    CPF,
    VALOR
)
SELECT
    DATAFOURLIB2010.dbo.FN_NORMALIZA([NOME]) AS NOME_TRATADO,

    [CPF] AS CPF,

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
    ) AS VALOR
FROM (
    SELECT
        [NOME],
        [CPF],
        LTRIM(RTRIM(
            REPLACE(
                REPLACE(
                    REPLACE(
                        REPLACE(
                            REPLACE(
                                REPLACE(
                                    COALESCE([Liquido], ''),
                                    'R$', ''
                                ),
                                CHAR(160), ' '
                            ),   -- NBSP
                            CHAR(9), ' '
                        ),       -- TAB
                        CHAR(13), ' '
                    ),          -- CR
                    CHAR(10), ' '
                ),              -- LF
                '  ', ' '
            )
        )) AS LIMPO_FINAL
    FROM [FUNCIONARIOS_PUBLICOS_MUNICIPAIS_202509].[dbo].[PA_FUNCIONARIOS_PUBLICOS_MUNICIPAIS_BELEM]
) t;
