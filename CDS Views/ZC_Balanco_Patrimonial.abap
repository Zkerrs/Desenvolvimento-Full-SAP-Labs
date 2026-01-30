@AbapCatalog.sqlViewName: 'ZCBALANCOPTR'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Analytics Balanço'
@Metadata.ignorePropagatedAnnotations: true

@VDM.viewType: #CONSUMPTION
@Analytics.query: true
@OData.publish: true

define view ZC_Balanco_Patrimonial
  as select from ZI_Balanco_Patrimonial
{
  // --- CHAVES (Detalhe do Documento) ---
  @EndUserText.label: 'Empresa'
  @AnalyticsDetails.query.display: #KEY_TEXT
  key CompanyCode,

  @EndUserText.label: 'Ledger'
  key Ledger,

  @EndUserText.label: 'Nº Documento'
  key DocumentNumber,

  @EndUserText.label: 'Item'
  key DocumentItem,

  @EndUserText.label: 'Ano Fiscal'
  key FiscalYear,

  // --- DATAS ---
  @EndUserText.label: 'Mês/Período'
  FiscalPeriod,

  @EndUserText.label: 'Data de Lançamento'
  PostingDate,

  @EndUserText.label: 'Data do Documento'
  DocumentDate,

  @EndUserText.label: 'Data de Compensação'
  ClearingDate,

  // --- CONTA E PLANO ---
  @EndUserText.label: 'Plano de Contas'
  ChartOfAccounts,

  @EndUserText.label: 'Conta Contábil'
  @AnalyticsDetails.query.display: #KEY
  GLAccount,

  @EndUserText.label: 'Descr. da Conta Contábil'
  @AnalyticsDetails.query.display: #TEXT
  GLAccountName,
  
  @EndUserText.label: 'Tipo de Conta (Cód)'
  @AnalyticsDetails.query.display: #KEY
  GLAccountType,

  @EndUserText.label: 'Descr. Tipo de Conta'
  @AnalyticsDetails.query.display: #TEXT
  GLAccountTypeName,

  @EndUserText.label: 'Grupo de Contas'
  @AnalyticsDetails.query.display: #KEY
  GLAccountGroup,

  @EndUserText.label: 'Descr. Grupo de Contas'
  @AnalyticsDetails.query.display: #TEXT
  GLAccountGroupName,
  
  @EndUserText.label: 'Centro de Lucro'
  ProfitCenter,

  @EndUserText.label: 'Descr. Centro Lucro'
  ProfitCenterName,

  @EndUserText.label: 'Centro de Custo'
  CostCenter,

  @EndUserText.label: 'Descr. Centro Custo'
  CostCenterName,

  @EndUserText.label: 'Divisão'
  Branch,

  @EndUserText.label: 'Segmento'
  Segment,

  @EndUserText.label: 'Área Funcional'
  FunctionalArea,

  @EndUserText.label: 'Centro (Planta)'
  Plant,

  @EndUserText.label: 'Descr. do Centro'
  PlantName,

  @EndUserText.label: 'Tipo de Documento'
  DocType,

  @EndUserText.label: 'Referência (XBLNR)'
  NotaFiscal_XBLNR,

  @EndUserText.label: 'Atribuição (ZUONR)'
  Atribuicao_ZUONR,

  @EndUserText.label: 'Descr. do Item'
  DocumentText,

  @EndUserText.label: 'Chave Lançamento (D/C)'
  DebitCreditCode,

  @UI.hidden: true
  Currency,

  @EndUserText.label: 'Valor'
  @DefaultAggregation: #SUM
  AmountInCompanyCurrency

}
