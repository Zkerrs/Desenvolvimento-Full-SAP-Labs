@AbapCatalog.sqlViewName: 'ZCDIVIDENDOS'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Relatório de Pagamento de Dividendos'
@Metadata.ignorePropagatedAnnotations: true

@VDM.viewType: #CONSUMPTION
@Analytics.query: true
@OData.publish: true

define view ZC_Dividendos
  as select from ZI_Dividendos
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

  @EndUserText.label: 'Conta Contábil'
  @AnalyticsDetails.query.display: #KEY_TEXT
  GLAccount,
  
  @EndUserText.label: 'Nome da Conta'
  GLAccountName,

  @EndUserText.label: 'Centro de Lucro'
  @AnalyticsDetails.query.display: #KEY_TEXT
  ProfitCenter,
  
  @EndUserText.label: 'Nome Centro Lucro'
  ProfitCenterName,

  @EndUserText.label: 'Moeda'
  Currency,

  @EndUserText.label: 'Valor'
  @DefaultAggregation: #SUM
  Valor

}
