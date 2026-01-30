//-----------------------------------------------------------------------------------
// Set Configurations and Data Region
//-----------------------------------------------------------------------------------
CONFIG.TIME_HIERARCHY = CALENDARYEAR
CONFIG.GENERATE_UNBOOKED_DATA = OFF

MEMBERSET [d/Measures] = "VALOR"
MEMBERSET [d/D_Fonte] = "SAP_S4"
MEMBERSET [d/D_Conta_Contabil] = ("11100000", "11100111", "22200222", "33300333")

//-----------------------------------------------------------------------------------
// Calculation with Mapping Logic
//-----------------------------------------------------------------------------------

IF [d/D_Conta_Contabil] = "11100000" THEN
    DATA([d/INDICADOR] = "BL_PTR_0500") = RESULTLOOKUP()
ELSEIF [d/D_Conta_Contabil] = "11100111" THEN
    DATA([d/INDICADOR] = "BL_PTR_0600") = RESULTLOOKUP()
ELSEIF [d/D_Conta_Contabil] = "22200222" THEN
    DATA([d/INDICADOR] = "BL_PTR_0700") = RESULTLOOKUP()
ELSEIF [d/D_Conta_Contabil] = "33300333" THEN
    DATA([d/INDICADOR] = "BL_PTR_0800") = RESULTLOOKUP()
ENDIF