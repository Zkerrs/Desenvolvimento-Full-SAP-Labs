//-----------------------------------------------------------------------------------
//Defina configurações para as fórmulas avançadas.
//-----------------------------------------------------------------------------------
CONFIG.TIME_HIERARCHY = CALENDARYEAR
CONFIG.GENERATE_UNBOOKED_DATA = OFF
//-----------------------------------------------------------------------------------
//O contexto de dados no qual as fórmulas serão executadas.
//-----------------------------------------------------------------------------------
MEMBERSET [d/Measures] = "VALOR"
MEMBERSET [d/Date] =  PREVIOUS(12, "MONTH", %AnoMes%) TO PREVIOUS(1, "MONTH", %AnoMes%)
//-----------------------------------------------------------------------------------
//Cálculo e gravação de dados
//-----------------------------------------------------------------------------------
DATA() = RESULTLOOKUP([d/Version]="public.Actual")