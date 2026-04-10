//-----------------------------------------------------------------------------------
//Defina configurações para as fórmulas avançadas.
//-----------------------------------------------------------------------------------
CONFIG.TIME_HIERARCHY = CALENDARYEAR
CONFIG.GENERATE_UNBOOKED_DATA = OFF
//-----------------------------------------------------------------------------------
//O contexto de dados no qual as fórmulas serão executadas.
//-----------------------------------------------------------------------------------
MEMBERSET [d/Measures] = "VALOR"
MEMBERSET [d/Date] =  NEXT(0, "MONTH", %AnoMes%) TO NEXT(12, "MONTH", %AnoMes%)
//-----------------------------------------------------------------------------------
//Cálculo e gravação de dados
//-----------------------------------------------------------------------------------
DATA() = RESULTLOOKUP([d/Version]="public.Budget")