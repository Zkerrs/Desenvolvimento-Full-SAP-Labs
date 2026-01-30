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
MEMBERSET [d/INDICADOR] = "ROY_0500" 
//-----------------------------------------------------------------------------------
//Calculation and Data Writing
//-----------------------------------------------------------------------------------
FOREACH [d/Data]
	DATA([d/INDICADOR] = "ROY_0200", [d/D_Fonte] = "CALC") =
		RESULTLOOKUP([d/INDICADOR] = "ROY_0500", [d/D_Fonte] = "CALC", [d/Data] = PREVIOUS(1))

	IF [d/Data].[p/MONTHDESC] = "Oct" THEN
		DATA([d/INDICADOR] = "ROY_0400", [d/D_Fonte] = "CALC") =
			RESULTLOOKUP([d/INDICADOR] = "ROY_0500", [d/D_Fonte] = "CALC", [d/Data] = PREVIOUS(1))
	ENDIF

	DATA([d/INDICADOR] = "ROY_0500", [d/D_Fonte] = "CALC") =
		RESULTLOOKUP([d/INDICADOR] = "ROY_0200", [d/D_Fonte] = "CALC") +
		RESULTLOOKUP([d/INDICADOR] = "ROY_0300", [d/D_Fonte] = "CALC") -
		RESULTLOOKUP([d/INDICADOR] = "ROY_0400", [d/D_Fonte] = "CALC")
ENDFOR