@AbapCatalog.sqlViewName: 'ZCSQL_DEV_CRDD'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Consumo Analítico do Contas a Receber (DDIC)'
@Metadata.ignorePropagatedAnnotations: true

@VDM.viewType: #CONSUMPTION
@Analytics.query: true
@OData.publish: true

define view ZC_Contas_Receber_DDIC
  as select from ZI_Contas_Receber_DDIC
{
  @EndUserText.label: 'Empresa'
  @AnalyticsDetails.query.display: #KEY_TEXT
  key bukrs              as CompanyCode,

  @EndUserText.label: 'Número do Documento'
  key belnr              as DocumentNumber,

  @EndUserText.label: 'Item'
  key buzei              as DocumentItem,

  @EndUserText.label: 'Ano Fiscal'
  key gjahr              as FiscalYear,

  @EndUserText.label: 'Cliente'
  key kunnr              as Customer,

  @EndUserText.label: 'Conta Razão'
  key hkont              as GLAccount,

  @EndUserText.label: 'Divisão'
  gsber                  as BusinessArea,

  @EndUserText.label: 'Nome da Empresa'
  butxt                  as CompanyName,

  @EndUserText.label: 'Nome do Cliente'
  name1                  as CustomerName,

  @EndUserText.label: 'Tipo de Documento'
  blart                  as DocType,

  @EndUserText.label: 'Data de Lançamento'
  budat                  as PostingDate,

  @EndUserText.label: 'Data do Documento'
  bldat                  as DocumentDate,

  @EndUserText.label: 'Data de Vencimento'
  zfbdt                  as DueDate,

  @EndUserText.label: 'Mês'
  monat                  as FiscalPeriod,

  @EndUserText.label: 'Débito/Crédito'
  shkzg                  as DebitCredit,

  @EndUserText.label: 'Moeda'
  waers                  as Currency,

  @DefaultAggregation: #SUM
  @EndUserText.label: 'Valor em Moeda da Empresa'
  dmbtr                  as AmountCompanyCurrency,

  @DefaultAggregation: #SUM
  @EndUserText.label: 'Valor (Calc.)'
  wrbtr_calc             as AmountCalc,

  @EndUserText.label: 'Chave de Lançamento'
  bschl                  as PostingKey,

  @EndUserText.label: 'Indicador de Especial G/L'
  umskz                  as SpecialGLIndicator,

  @EndUserText.label: 'Tipo de Transação G/L Especial'
  umsks                  as SpecialGLTransactionType,

  @EndUserText.label: 'Grupo de Razão (ZUMSK)'
  zumsk                  as ZUMSK,

  @EndUserText.label: 'Texto do Item'
  sgtxt                  as DocumentText,

  @EndUserText.label: 'Documento de Compensação'
  augbl                  as ClearingDocument,

  @EndUserText.label: 'Data de Compensação'
  augdt                  as ClearingDate,

  @EndUserText.label: 'Centro de Lucro'
  prctr                  as ProfitCenter,

  @EndUserText.label: 'Documento de Vendas'
  vbeln                  as SalesDocument,

  @EndUserText.label: 'Conta Contrapartida (GKONT)'
  @AnalyticsDetails.query.display: #KEY
  gkont                  as GKONT,

  @EndUserText.label: 'Tipo Contrapartida (GKOAR)'
  @AnalyticsDetails.query.display: #KEY
  gkoar                  as GKOAR,

  @EndUserText.label: 'CNPJ Filial'
  stcd1                  as CNPJ,

  @EndUserText.label: 'Descrição Tipo de Documento'
  ltext                  as DocTypeText,

  @EndUserText.label: 'Documento de Referência'
  rebzg                  as ReferenceDocument,

  @EndUserText.label: 'Status do Documento'
  status_doc             as DocumentStatus,

  @DefaultAggregation: #SUM
  @EndUserText.label: 'Valor em Aberto'
  valor_aberto           as OpenAmount,

  @DefaultAggregation: #SUM
  @EndUserText.label: 'Valor Compensado'
  valor_compensado       as ClearedAmount
}

