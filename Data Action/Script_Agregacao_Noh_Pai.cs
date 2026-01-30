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
MEMBERSET [d/D_Centro_Lucro] = "#"
MEMBERSET [d/INDICADOR] = BASEMEMBER([d/INDICADOR].[h/parentId], "VENDA_1700")
//-----------------------------------------------------------------------------------
//Calculation and Data Writing
//-----------------------------------------------------------------------------------
DATA([d/INDICADOR]="VENDA_1600", [d/D_Fonte]="CALC") = RESULTLOOKUP()