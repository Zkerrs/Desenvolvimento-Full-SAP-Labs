//-----------------------------------------------------------------------------------
//Set Configurations Definitions for the Advanced Formulas.
//-----------------------------------------------------------------------------------
CONFIG.TIME_HIERARCHY = CALENDARYEAR
CONFIG.GENERATE_UNBOOKED_DATA = OFF
//-----------------------------------------------------------------------------------
//The data region against which the formulas will be executed.
//-----------------------------------------------------------------------------------
MEMBERSET [d/Measures] = "VALOR"
MEMBERSET [d/D_Fonte] = "CALC"
MEMBERSET [d/INDICADOR] = BASEMEMBER([d/INDICADOR], "IRPJ_CSL_0000") // Seleciona todos os filhos abaixo do nó pai "IRPJ_CSL_0000"
//-----------------------------------------------------------------------------------
//Calculation and Data Writing
//-----------------------------------------------------------------------------------
DELETE()

