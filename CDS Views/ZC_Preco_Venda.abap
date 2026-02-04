@AbapCatalog.sqlViewName: 'ZCPRECOVENDA'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Relatório de Preço de Venda'
@Metadata.ignorePropagatedAnnotations: true

@VDM.viewType: #CONSUMPTION
@Analytics.query: true
@OData.publish: true

define view ZC_Preco_Venda
  as select from ZI_Preco_Venda
{
  @EndUserText.label: 'Empresa'
  @AnalyticsDetails.query.display: #KEY_TEXT
  key CompanyCode,

  @EndUserText.label: 'Ledger'
  key Ledger,

  @EndUserText.label: 'Exercício Fiscal'
  key FiscalYear,

  @EndUserText.label: 'Nº Documento'
  key DocumentNumber,

  key DocumentItem,

  @EndUserText.label: 'Período Contábil'
  FiscalPeriod,
  
  @EndUserText.label: 'Data do Lançamento'
  @AnalyticsDetails.query.display: #KEY
  PostingDate,

  @EndUserText.label: 'Produto (Material)'
  @AnalyticsDetails.query.display: #KEY_TEXT
  Material, 

  @EndUserText.label: 'Cliente'
  @AnalyticsDetails.query.display: #KEY_TEXT
  Customer,

  @EndUserText.label: 'Componente (Bruto/Imposto)'
  @AnalyticsDetails.query.display: #KEY
  ComponentePreco, 

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

  @EndUserText.label: 'Centro de Custo'
  @AnalyticsDetails.query.display: #KEY_TEXT
  CostCenter,
  
  @EndUserText.label: 'Nome Centro Custo'
  CostCenterName,

  @EndUserText.label: 'Centro (Fábrica)'
  @AnalyticsDetails.query.display: #KEY_TEXT
  Plant,
  
  @EndUserText.label: 'Nome da Fábrica'
  PlantName,

  @EndUserText.label: 'Divisão'
  Branch,

  @EndUserText.label: 'Unidade Medida'
  BaseUnit,
  
  @EndUserText.label: 'Moeda'
  Currency,

 

  @EndUserText.label: 'Valor Total'
  @DefaultAggregation: #SUM
  ValorTotal,

  @EndUserText.label: 'Quantidade'
  @DefaultAggregation: #SUM
  QuantidadeVenda

}
