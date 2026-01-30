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
MEMBERSET [d/INDICADOR] = "MAT_INDIRETO_0300"
MEMBERSET [d/Data].[p/MONTHDESC] = ("Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec", "Jan", "Feb", "Mar")

//-----------------------------------------------------------------------------------
//-----------------------------------------------------------------------------------
FOREACH [d/Data]
    DATA([d/D_Fonte] = "CALC") = RESULTLOOKUP([d/Data] = PREVIOUS(1, "MONTH"))
ENDFOR