@AbapCatalog.sqlViewName: 'ZCCUSTOMATSTK'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Analytics Custo Material'
@Metadata.ignorePropagatedAnnotations: true

@VDM.viewType: #CONSUMPTION
@Analytics.query: true
@OData.publish: true

define view ZC_Custo_Material_STK
  as select from ZI_Custo_Material_STK
{
  @EndUserText.label: 'Empresa'
  @AnalyticsDetails.query.display: #KEY_TEXT
  key CompanyCode,

  @EndUserText.label: 'Centro (Planta)'
  @AnalyticsDetails.query.display: #KEY_TEXT
  key Plant,

  @EndUserText.label: 'Material'
  @AnalyticsDetails.query.display: #KEY_TEXT
  key Material,

  @EndUserText.label: 'Ano Fiscal'
  key FiscalYear,

  @EndUserText.label: 'Mês/Período'
  key FiscalPeriod,

  @EndUserText.label: 'Tipo Material'
  @AnalyticsDetails.query.display: #KEY
  TipoMaterial,

  @EndUserText.label: 'Descr. Tipo Material'
  @AnalyticsDetails.query.display: #TEXT
  TipoMaterialText,
  
  @EndUserText.label: 'Nome da Planta'
  PlantName,

  @EndUserText.label: 'Conta Contábil'
  @AnalyticsDetails.query.display: #KEY_TEXT
  ContaContabil, 
  
  @EndUserText.label: 'Nome da Conta'
  ContaContabilText,
  
  @EndUserText.label: 'Centro de Lucro'
  ProfitCenter,

  
  @EndUserText.label: 'Qtd. Estoque'
  @DefaultAggregation: #SUM
  EstoqueQuantidade,

  @EndUserText.label: 'Valor Total Estoque'
  @DefaultAggregation: #SUM
  EstoqueValorTotal,

  @EndUserText.label: 'Preço Unitário'
  @DefaultAggregation: #MAX
  PrecoUnitario_Oficial,

  @UI.hidden: true
  CompanyCodeCurrency,
  
  @UI.hidden: true
  BaseUnit

}
