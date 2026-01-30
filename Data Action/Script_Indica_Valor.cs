//-----------------------------------------------------------------------------------
// Set Configurations and Data Region
//-----------------------------------------------------------------------------------
CONFIG.TIME_HIERARCHY = CALENDARYEAR
CONFIG.GENERATE_UNBOOKED_DATA = OFF

MEMBERSET [d/Measures] = "VALOR"
MEMBERSET [d/D_Fonte] = "SAP_S4"
MEMBERSET [d/D_Conta_Contabil] = ("11101001", "11101002", "11101003", "11101090")

//-----------------------------------------------------------------------------------
// Calculation with Mapping Logic
//-----------------------------------------------------------------------------------

IF [d/D_Conta_Contabil] = "11101001" THEN
    DATA([d/INDICADOR] = "BL_PTR_0500") = RESULTLOOKUP()
ELSEIF [d/D_Conta_Contabil] = "11101002" THEN
    DATA([d/INDICADOR] = "BL_PTR_0600") = RESULTLOOKUP()
ELSEIF [d/D_Conta_Contabil] = "11101003" THEN
    DATA([d/INDICADOR] = "BL_PTR_0700") = RESULTLOOKUP()
ELSEIF [d/D_Conta_Contabil] = "11101090" THEN
    DATA([d/INDICADOR] = "BL_PTR_0800") = RESULTLOOKUP()
ENDIF