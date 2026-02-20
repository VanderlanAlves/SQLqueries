INSERT INTO PR.FUNCIONARIOS_PUBLICOS_REMU_PR_TRATADO (
    NOME_TRATADO,
    VALOR
)
SELECT
    DATAFOURLIB2010.dbo.FN_NORMALIZA([nome]) AS NOME_TRATADO,

    TRY_CAST(
        NULLIF(
            REPLACE(
                LEFT(
                    LIMPO_FINAL,
                    CHARINDEX('.', LIMPO_FINAL + '.') - 1
                ),
                ',', ''
            ),
            ''
        ) AS BIGINT
    ) AS VALOR
FROM (
    SELECT
        [nome],
        LTRIM(RTRIM(
            REPLACE(
                REPLACE(
                    REPLACE(
                        REPLACE(
                            REPLACE(
                                REPLACE(
                                    COALESCE([ult_remu_bruta], ''),
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
    FROM [FUNCIONARIOS_PUBLICOS_ESTADUAIS_082025].[PR].[FUNCIONARIOS_PUBLICOS_REMU_PR]
    WHERE situacao NOT IN ('VOLUNTÁRIO', 'DESLIGADO')
) t;
