CASE
    -- ==========================================
    -- 🏛️ PODER EXECUTIVO FEDERAL
    -- ==========================================
    WHEN 
        Descrição_Função LIKE '%PRESIDENTE DA REPUBLICA%' OR
        Descrição_Função LIKE '%VICE-PRESIDENTE DA REPUBLICA%' OR
        Descrição_Função LIKE '%MINISTRO DE ESTADO%'
    THEN 'PODER EXECUTIVO FEDERAL'

    -- ==========================================
    -- 🏛️ PODER EXECUTIVO ESTADUAL
    -- ==========================================
    WHEN 
        Descrição_Função LIKE '%GOVERNADOR%' OR
        Descrição_Função LIKE '%VICE-GOVERNADOR%' OR
        Descrição_Função LIKE '%SECRETARIO DE ESTADO%'
    THEN 'PODER EXECUTIVO ESTADUAL'

    -- ==========================================
    -- 🏛️ PODER EXECUTIVO MUNICIPAL
    -- ==========================================
    WHEN 
        Descrição_Função LIKE '%PREFEITO%' OR
        Descrição_Função LIKE '%VICE-PREFEITO%' OR
        Descrição_Função LIKE '%SECRETARIO MUNICIPAL%'
    THEN 'PODER EXECUTIVO MUNICIPAL'

    -- ==========================================
    -- 🏛️ PODER LEGISLATIVO FEDERAL
    -- ==========================================
    WHEN 
        Descrição_Função LIKE '%SENADOR%' OR
        Descrição_Função LIKE '%DEPUTADO FEDERAL%'
    THEN 'PODER LEGISLATIVO FEDERAL'

    -- ==========================================
    -- 🏛️ PODER LEGISLATIVO ESTADUAL
    -- ==========================================
    WHEN 
        Descrição_Função LIKE '%DEPUTADO ESTADUAL%'
    THEN 'PODER LEGISLATIVO ESTADUAL'

    -- ==========================================
    -- 🏛️ PODER LEGISLATIVO DISTRITAL
    -- ==========================================
    WHEN 
        Descrição_Função LIKE '%DEPUTADO DISTRITAL%'
    THEN 'PODER LEGISLATIVO DISTRITAL'

    -- ==========================================
    -- 🏛️ PODER LEGISLATIVO MUNICIPAL
    -- ==========================================
    WHEN 
        Descrição_Função LIKE '%VEREADOR%'
    THEN 'PODER LEGISLATIVO MUNICIPAL'

    -- ==========================================
    -- ⚖️ PODER JUDICIARIO FEDERAL
    -- ==========================================
    WHEN 
        Nome_Órgão LIKE '%SUPREMO TRIBUNAL FEDERAL%' OR
        Nome_Órgão LIKE '%SUPERIOR TRIBUNAL DE JUSTICA%' OR
        Nome_Órgão LIKE '%SUPERIOR TRIBUNAL MILITAR%' OR
        Nome_Órgão LIKE '%TRIBUNAL SUPERIOR DO TRABALHO%' OR
        Nome_Órgão LIKE '%TRIBUNAL SUPERIOR ELEITORAL%'
    THEN 'PODER JUDICIARIO FEDERAL'

    WHEN 
        Descrição_Função LIKE '%JUIZ FEDERAL%' OR
        Descrição_Função LIKE '%DESEMBARGADOR FEDERAL%'
    THEN 'PODER JUDICIARIO FEDERAL'

    -- ==========================================
    -- ⚖️ PODER JUDICIARIO ESTADUAL
    -- ==========================================
    WHEN 
        Descrição_Função LIKE '%DESEMBARGADOR%' OR
        Descrição_Função LIKE '%JUIZ DE DIREITO%'
    THEN 'PODER JUDICIARIO ESTADUAL'

    -- ==========================================
    -- 🛡️ MINISTERIO PUBLICO
    -- ==========================================
    WHEN Nome_Órgão LIKE '%MINISTERIO PUBLICO%'
    THEN 'MINISTERIO PUBLICO'

    WHEN 
        Descrição_Função LIKE '%PROCURADOR DA REPUBLICA%' OR
        Descrição_Função LIKE '%PROMOTOR DE JUSTICA%' OR
        Descrição_Função LIKE '%PROCURADOR DE JUSTICA%' OR
        Descrição_Função LIKE '%PROCURADOR-GERAL DA REPUBLICA%' OR
        Descrição_Função LIKE '%PROCURADOR-GERAL DE JUSTICA%'
    THEN 'MINISTERIO PUBLICO'

    -- ==========================================
    -- 🔍 TRIBUNAL DE CONTAS
    -- ==========================================
    WHEN Nome_Órgão LIKE '%TRIBUNAL DE CONTAS%'
    THEN 'TRIBUNAL DE CONTAS'

    WHEN 
        Descrição_Função LIKE '%MINISTRO DO TCU%' OR
        Descrição_Função LIKE '%CONSELHEIRO DO TRIBUNAL DE CONTAS%' OR
        Descrição_Função LIKE '%AUDITOR DO TRIBUNAL DE CONTAS%'
    THEN 'TRIBUNAL DE CONTAS'

    -- ==========================================
    -- ⚖️ DEFENSORIA PUBLICA
    -- ==========================================
    WHEN Nome_Órgão LIKE '%DEFENSORIA PUBLICA%'
    THEN 'DEFENSORIA PUBLICA'

    WHEN 
        Descrição_Função LIKE '%DEFENSOR PUBLICO%' OR
        Descrição_Função LIKE '%DEFENSOR PUBLICO-GERAL%'
    THEN 'DEFENSORIA PUBLICA'

    -- ==========================================
    -- ⚠️ EXECUTIVO - PROCURADORIAS
    -- ==========================================
    WHEN 
        Descrição_Função LIKE '%ADVOGADO GERAL DA UNIAO%' OR
        Descrição_Função LIKE '%PROCURADOR-GERAL DA FAZENDA NACIONAL%'
    THEN 'PODER EXECUTIVO FEDERAL'

    WHEN 
        Descrição_Função LIKE '%PROCURADOR DO ESTADO%' OR
        Descrição_Função LIKE '%PROCURADOR-GERAL DO ESTADO%'
    THEN 'PODER EXECUTIVO ESTADUAL'

    WHEN 
        Descrição_Função LIKE '%PROCURADOR MUNICIPAL%' OR
        Descrição_Função LIKE '%PROCURADOR-GERAL DO MUNICIPIO%'
    THEN 'PODER EXECUTIVO MUNICIPAL'

    ELSE NULL
END AS ESFERA_PODER