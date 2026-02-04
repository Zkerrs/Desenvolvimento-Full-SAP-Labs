@AbapCatalog.sqlViewName: 'ZCDREFLOW'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Relatório Analítico DRE (Flow)'
@Metadata.ignorePropagatedAnnotations: true

@VDM.viewType: #CONSUMPTION
@Analytics.query: true
@OData.publish: true

define view ZC_DRE
  as select from ZI_DRE
{
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

  @EndUserText.label: 'Mês/Período'
  FiscalPeriod,

  @EndUserText.label: 'Data de Lançamento'
  PostingDate,

  @EndUserText.label: 'Data do Documento'
  DocumentDate,

  @EndUserText.label: 'Plano de Contas'
  ChartOfAccounts,

  @EndUserText.label: 'Conta Contábil'
  @AnalyticsDetails.query.display: #KEY
  GLAccount,

  @EndUserText.label: 'Nome da Conta'
  @AnalyticsDetails.query.display: #TEXT
  GLAccountName,

  @EndUserText.label: 'Tipo de Conta'
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

  @EndUserText.label: 'Área de Controle'
  ControllingArea,

  @EndUserText.label: 'Centro de Custo'
  @AnalyticsDetails.query.display: #KEY
  CostCenter,

  @EndUserText.label: 'Nome Centro Custo'
  @AnalyticsDetails.query.display: #TEXT
  CostCenterName,

  @EndUserText.label: 'Centro de Lucro'
  @AnalyticsDetails.query.display: #KEY
  ProfitCenter,

  @EndUserText.label: 'Nome Centro Lucro'
  @AnalyticsDetails.query.display: #TEXT
  ProfitCenterName,

  @EndUserText.label: 'Área Funcional'
  @AnalyticsDetails.query.display: #KEY
  FunctionalArea,

  @EndUserText.label: 'Descr. Área Funcional'
  @AnalyticsDetails.query.display: #TEXT
  FunctionalAreaName,

  @EndUserText.label: 'Segmento'
  @AnalyticsDetails.query.display: #KEY
  Segment,

  @EndUserText.label: 'Descr. Segmento'
  @AnalyticsDetails.query.display: #TEXT
  SegmentName,

  @EndUserText.label: 'Divisão'
  Branch,

  @EndUserText.label: 'Centro (Planta)'
  Plant,

  @EndUserText.label: 'Nome do Centro'
  PlantName,

  @EndUserText.label: 'Tipo de Documento'
  DocType,

  @EndUserText.label: 'Histórico/Texto do Item'
  ItemText,

  @EndUserText.label: 'Tipo Doc. Ref.'
  RefDocType,

  @EndUserText.label: 'Chave Lançamento (D/C)'
  DebitCreditCode,

  @UI.hidden: true
  Currency,

  @EndUserText.label: 'Valor'
  @DefaultAggregation: #SUM
  AmountInCompanyCurrency

}
