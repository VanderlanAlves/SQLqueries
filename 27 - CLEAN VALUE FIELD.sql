USE [FUNCIONARIOS_PUBLICOS_MUNICIPAIS_202509]
  
  INSERT INTO SECRETARIOS_MUNICIPAIS_CAPITAIS (
  NOME,
  CPF_INCOMPLETO ,
  CARGO,
  SECRETARIA,
  CIDADE ,
   RENDA )

   SELECT
   [NOME],
   '',
   [Cargo],
   [Divisão],
   'CAMPO GRANDE - MS',
  CASE 
    WHEN CHARINDEX('.', REPLACE(REPLACE([Líquido], 'R$', ''), ' ', '')) > CHARINDEX(',', REPLACE(REPLACE([Líquido], 'R$', ''), ' ', ''))
    THEN CAST(REPLACE(LEFT(REPLACE(REPLACE([Líquido], 'R$', ''), ' ', ''), CHARINDEX('.', REPLACE(REPLACE([Líquido], 'R$', ''), ' ', '')) - 1), ',', '') AS INT)
    
    WHEN CHARINDEX(',', REPLACE(REPLACE([Líquido], 'R$', ''), ' ', '')) > CHARINDEX('.', REPLACE(REPLACE([Líquido], 'R$', ''), ' ', ''))
    THEN CAST(REPLACE(LEFT(REPLACE(REPLACE([Líquido], 'R$', ''), ' ', ''), CHARINDEX(',', REPLACE(REPLACE([Líquido], 'R$', ''), ' ', '')) - 1), '.', '') AS INT)
    
    ELSE CAST(REPLACE(REPLACE(REPLACE(REPLACE([Líquido], 'R$', ''), ' ', ''), '.', ''), ',', '') AS INT)
END
  FROM [FUNCIONARIOS_PUBLICOS_MUNICIPAIS_202509].[dbo].[BA_FUNCIONARIOS_PUBLICOS_MUNICIPAIS_SALVADOR]
  WHERE   [Cargo]  COLLATE Latin1_General_CI_AI LIKE '%secretar%' AND  [Cargo] NOT LIKE'%ASSESSOR%' AND Situação NOT LIKE '%RESCINDIDO%'
