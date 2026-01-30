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
MEMBERSET [d/INDICADOR] = ("PIS_COFINS_1800", "PIS_COFINS_1900")
MEMBERSET [d/Data].[p/MONTHDESC] = ("Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec", "Jan", "Feb", "Mar")
//-----------------------------------------------------------------------------------
//Calculation and Data Writing
//-----------------------------------------------------------------------------------
IF [d/Data].[p/MONTHDESC] = "Apr" THEN
	// 1. Pagamento (1800) = Saldo Inicial (1100) de MARÇO
	DATA([d/INDICADOR] = "PIS_COFINS_1800", [d/D_Fonte] = "CALC") =
	RESULTLOOKUP([d/INDICADOR] = "PIS_COFINS_1100", [d/D_Fonte] = "CALC", [d/Data] = PREVIOUS(1, "MONTH"))

	// 2. Saldo Final (1900) = Saldo Inicial (1100) MARÇO + Apuração (1600) ABRIL - Pagamento (1800) ABRIL + Comp. (1700) ABRIL
	DATA([d/INDICADOR] = "PIS_COFINS_1900", [d/D_Fonte] = "CALC") =
	RESULTLOOKUP([d/INDICADOR] = "PIS_COFINS_1100", [d/D_Fonte] = "CALC", [d/Data] = PREVIOUS(1, "MONTH")) +
	RESULTLOOKUP([d/INDICADOR] = "PIS_COFINS_1600", [d/D_Fonte] = "CALC") -
	(RESULTLOOKUP([d/INDICADOR] = "PIS_COFINS_1100", [d/D_Fonte] = "CALC", [d/Data] = PREVIOUS(1, "MONTH"))) +
	RESULTLOOKUP([d/INDICADOR] = "PIS_COFINS_1700", [d/D_Fonte] = "CALC")
ENDIF

// 2. Usa FOREACH para forçar o cálculo EM SEQUÊNCIA/ Cascata
FOREACH [d/Data]
	// Esse IF impede que o loop sobrescreva o cálculo de Abril, ou seja, ele diz (SE for DIFERENTE (!=) de abril... faça)
	IF [d/Data].[p/MONTHDESC] != "Apr" THEN
		// 1. Pagamento (1800) = Saldo Final (1900) do mês ANTERIOR (Abril)
		DATA([d/INDICADOR] = "PIS_COFINS_1800", [d/D_Fonte] = "CALC") =
			RESULTLOOKUP([d/INDICADOR] = "PIS_COFINS_1900", [d/D_Fonte] = "CALC", [d/Data] = PREVIOUS(1, "MONTH"))
		
		// Calcula o Saldo Final (1900) = Saldo Ant (1900) + Apuração (1600) - Saldo Ant (1900) + Comp. (1700)
		DATA([d/INDICADOR] = "PIS_COFINS_1900", [d/D_Fonte] = "CALC") =
			RESULTLOOKUP([d/INDICADOR] = "PIS_COFINS_1900", [d/D_Fonte] = "CALC", [d/Data] = PREVIOUS(1, "MONTH")) +
			RESULTLOOKUP([d/INDICADOR] = "PIS_COFINS_1600", [d/D_Fonte] = "CALC") -
			(RESULTLOOKUP([d/INDICADOR] = "PIS_COFINS_1900", [d/D_Fonte] = "CALC", [d/Data] = PREVIOUS(1, "MONTH"))) +
			RESULTLOOKUP([d/INDICADOR] = "PIS_COFINS_1700", [d/D_Fonte] = "CALC")
	ENDIF
ENDFOR

// Explicação:
// Sem FOREACH (Paralelo): O SAC tenta calcular Abril, Maio, Junho tudo ao mesmo tempo. O cálculo de Maio falha porque o de Abril ainda não terminou.
// Com FOREACH (Cascata/Sequencial): O SAC é forçado a calcular em ordem.