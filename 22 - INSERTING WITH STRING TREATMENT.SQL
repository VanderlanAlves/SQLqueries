-- INSERTING WITH STRING TREATMENT

INSERT INTO BA_FUNCIONARIOS_PUBLICOS_MUNICIPAIS_SALVADOR_TRATADO (
    NOME_TRATADO,
    VALOR
)
SELECT
    DATAFOURLIB2010.dbo.FN_NORMALIZA(t.NOME_TRATADO),
    TRY_CAST(
        NULLIF(
            REPLACE(
                LEFT(
                    t.LIMPO_FINAL,
                    CHARINDEX(',', t.LIMPO_FINAL + ',') - 1
                ),
                '.', ''
            ),
            ''
        ) AS BIGINT
    )
FROM (
    SELECT
        LTRIM(RTRIM(REPLACE(
            LEFT([Nome], CHARINDEX('(', [Nome] + '(') - 1),
            '"', ''
        ))) AS NOME_TRATADO,

        LTRIM(RTRIM(
            REPLACE(
                REPLACE(
                    REPLACE(
                        REPLACE(
                            REPLACE(
                                REPLACE(
                                    COALESCE(LTRIM(RTRIM(REPLACE(
                                        [Remuneração_após_Descontos_Legais],
                                        '"',''
                                    ))),''),
                                    'R$',''
                                ),
                                CHAR(160),' '
                            ),
                            CHAR(9),' '
                        ),
                        CHAR(13),' '
                    ),
                    CHAR(10),' '
                ),
                '  ',' '
            )
        )) AS LIMPO_FINAL

    FROM [FUNCIONARIOS_PUBLICOS_MUNICIPAIS_202509].[dbo].[BA_FUNCIONARIOS_PUBLICOS_MUNICIPAIS_SALVADOR]
) t;
