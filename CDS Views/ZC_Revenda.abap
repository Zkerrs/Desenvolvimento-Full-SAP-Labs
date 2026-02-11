@AbapCatalog.sqlViewName: 'ZCREVENDA'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Relatório de Revenda'
@Metadata.ignorePropagatedAnnotations: true

@VDM.viewType: #CONSUMPTION
@Analytics.query: true
@OData.publish: true

define view ZC_Revenda
  as select from ZI_Revenda
{
  @EndUserText.label: 'Empresa'
  @AnalyticsDetails.query.display: #KEY_TEXT
  key CompanyCode,
  
  @EndUserText.label: 'Conta Contábil'
  @AnalyticsDetails.query.display: #KEY_TEXT
  key GLAccount,

  @EndUserText.label: 'Ledger'
  key Ledger,

  @EndUserText.label: 'Exercício'
  key FiscalYear,

  @EndUserText.label: 'Produto'
  @AnalyticsDetails.query.display: #KEY_TEXT
  key Material, 

  @EndUserText.label: 'Período'
  FiscalPeriod,
  
  @EndUserText.label: 'Data Lançamento'
  PostingDate,

  @EndUserText.label: 'Cliente'
  @AnalyticsDetails.query.display: #KEY_TEXT
  Customer,

  
  @EndUserText.label: 'Descr. Conta Contábil'
  GLAccountName,

  @EndUserText.label: 'Centro de Lucro'
  @AnalyticsDetails.query.display: #KEY_TEXT
  ProfitCenter,

  @EndUserText.label: 'Centro'
  @AnalyticsDetails.query.display: #KEY_TEXT
  Plant,

  @EndUserText.label: 'Unidade Medida'
  BaseUnit,
  
  @EndUserText.label: 'Moeda'
  Currency,

  @EndUserText.label: 'Valor'
  @DefaultAggregation: #SUM
  ValorTotal,

  @EndUserText.label: 'Quantidade'
  @DefaultAggregation: #SUM
  Quantidade

}
