@AbapCatalog.sqlViewName: 'ZCROYALTIES'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Relatório de Royalties'
@Metadata.ignorePropagatedAnnotations: true

@VDM.viewType: #CONSUMPTION
@Analytics.query: true
@OData.publish: true

define view ZC_Royalties
  as select from ZI_Royalties
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

  @EndUserText.label: 'Período Contábil'
  FiscalPeriod,
  
  @EndUserText.label: 'Data de Lançamento'
  @AnalyticsDetails.query.display: #KEY
  PostingDate,

  @EndUserText.label: 'Fornecedor'
  @AnalyticsDetails.query.display: #KEY_TEXT
  Supplier,

  @EndUserText.label: 'Nome do Fornecedor'
  SupplierName,

  @EndUserText.label: 'Material'
  @AnalyticsDetails.query.display: #KEY_TEXT
  Material,

  @EndUserText.label: 'Nome do Material'
  MaterialName,

  @EndUserText.label: 'Conta Razão'
  @AnalyticsDetails.query.display: #KEY_TEXT
  GLAccount,

  @EndUserText.label: 'Nome da Conta'
  GLAccountName,

  @EndUserText.label: 'Centro de Custo'
  @AnalyticsDetails.query.display: #KEY_TEXT
  CostCenter,

  @EndUserText.label: 'Nome Centro Custo'
  CostCenterName,

  @EndUserText.label: 'Centro de Lucro'
  @AnalyticsDetails.query.display: #KEY_TEXT
  ProfitCenter,

  @EndUserText.label: 'Nome Centro Lucro'
  ProfitCenterName,

  @EndUserText.label: 'Atribuição (Contrato)'
  Atribuicao,

  @EndUserText.label: 'Histórico'
  Historico,

  @EndUserText.label: 'Referência (NF)'
  Referencia,

  @EndUserText.label: 'Moeda'
  Currency,

  @EndUserText.label: 'Valor'
  @DefaultAggregation: #SUM
  Valor

}