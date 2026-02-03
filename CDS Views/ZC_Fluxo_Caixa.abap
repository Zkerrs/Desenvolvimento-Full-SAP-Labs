@AbapCatalog.sqlViewName: 'ZCFLUXCAIX'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Analytics Fluxo Caixa'

@VDM.viewType: #CONSUMPTION  
@Analytics.query: true       
@OData.publish: true

define view ZC_Fluxo_Caixa
  as select from ZI_Fluxo_Caixa
{
  @EndUserText.label: 'Empresa'
  @AnalyticsDetails.query.display: #KEY_TEXT
  key CompanyCode,

  @EndUserText.label: 'Ledger'
  key Ledger,

  @EndUserText.label: 'Exercício'
  key FiscalYear,

  @EndUserText.label: 'Nº Documento'
  key DocumentNumber,
  
  key DocumentItem,

  @EndUserText.label: 'Período'
  FiscalPeriod,

  @EndUserText.label: 'Data Lançamento'
  @AnalyticsDetails.query.display: #KEY
  PostingDate,

  @EndUserText.label: 'Data Documento'
  DocumentDate,

  @EndUserText.label: 'Conta Contábil'
  @AnalyticsDetails.query.display: #KEY_TEXT
  GLAccount,

  @EndUserText.label: 'Descr. da Conta Contábil'
  GLAccountName,
  
  @EndUserText.label: 'Grupo (Cód)'
  @AnalyticsDetails.query.display: #KEY
  GLAccountGroup,

  @EndUserText.label: 'Descr. Grupo'
  @AnalyticsDetails.query.display: #TEXT
  AccountGroupName,

  @EndUserText.label: 'Cliente'
  @AnalyticsDetails.query.display: #KEY_TEXT
  Customer,

  @EndUserText.label: 'Fornecedor'
  @AnalyticsDetails.query.display: #KEY_TEXT
  Supplier,

  @EndUserText.label: 'Centro Custo'
  @AnalyticsDetails.query.display: #KEY_TEXT
  CostCenter,

  @EndUserText.label: 'Centro Lucro'
  @AnalyticsDetails.query.display: #KEY_TEXT
  ProfitCenter,

  @EndUserText.label: 'Débito/Crédito'
  @AnalyticsDetails.query.display: #KEY
  DebitCreditCode, 

  @EndUserText.label: 'Moeda'
  Currency,

  @EndUserText.label: 'Valor'
  @DefaultAggregation: #SUM
  AmountValue

}
