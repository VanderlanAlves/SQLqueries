USE TEMP_VANDERLAN
GO

CREATE OR ALTER FUNCTION dbo.FN_CONVERTE_VALOR (@VALOR VARCHAR(100))
RETURNS INT
AS
BEGIN
    DECLARE @V VARCHAR(100) = REPLACE(REPLACE(ISNULL(@VALOR, ''), 'R$', ''), ' ', '')

    -- Vazio ou NULL retorna 0
    IF @V = '' OR @V IS NULL RETURN 0

    -- Não numérico (letras, símbolos) retorna 0
    IF @V NOT LIKE '%[0-9]%' RETURN 0

    -- Múltiplos pontos: 1.500.000,99 → remove todos os pontos
    IF (LEN(@V) - LEN(REPLACE(@V, '.', ''))) > 1
        SET @V = REPLACE(@V, '.', '')

    -- Múltiplas vírgulas: 1,500,000.99 → remove todas as vírgulas
    IF (LEN(@V) - LEN(REPLACE(@V, ',', ''))) > 1
        SET @V = REPLACE(@V, ',', '')

    RETURN CASE 
        WHEN CHARINDEX('.', @V) > CHARINDEX(',', @V)
        THEN CAST(REPLACE(LEFT(@V, CHARINDEX('.', @V) - 1), ',', '') AS INT)
        
        WHEN CHARINDEX(',', @V) > CHARINDEX('.', @V)
        THEN CAST(REPLACE(LEFT(@V, CHARINDEX(',', @V) - 1), '.', '') AS INT)
        
        ELSE CAST(REPLACE(REPLACE(@V, '.', ''), ',', '') AS INT)
    END
END