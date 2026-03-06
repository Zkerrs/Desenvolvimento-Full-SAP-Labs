@AbapCatalog.sqlViewName: 'ZIREVENDASTD'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Relatório de Revenda Standard'
@Metadata.ignorePropagatedAnnotations: true

@VDM.viewType: #COMPOSITE
@Analytics.dataCategory: #CUBE 
@OData.publish: true

define view ZI_Revenda_Std
  as select from I_JournalEntryItem as Geral

  association [0..1] to I_GLAccountTextInCompanycode as _GLText on  Geral.CompanyCode = _GLText.CompanyCode
                                                                and Geral.GLAccount   = _GLText.GLAccount
                                                                and _GLText.Language  = $session.system_language

  association [0..1] to I_ProfitCenterText           as _PCText on  Geral.ControllingArea = _PCText.ControllingArea
                                                                and Geral.ProfitCenter    = _PCText.ProfitCenter
                                                                and _PCText.Language      = $session.system_language

  association [0..1] to I_Plant                      as _Plant  on  Geral.Plant = _Plant.Plant

{
  key Geral.CompanyCode,
  key Geral.Ledger,
  key Geral.AccountingDocument                     as DocumentNumber,
  key Geral.LedgerGLLineItem                       as DocumentItem,
  key Geral.FiscalYear,

  Geral.FiscalPeriod,
  Geral.PostingDate,

  Geral.Product                                    as Material,
  Geral.Customer,
  
  Geral.GLAccount,
  _GLText.GLAccountName                            as GLAccountName,

  Geral.ControllingArea,
  Geral.ProfitCenter,
  _PCText.ProfitCenterName                         as ProfitCenterName,
  
  Geral.Plant,
  _Plant.PlantName                                 as PlantName,
  
  Geral.BusinessArea                               as Branch,

  Geral.BaseUnit,
  Geral.CompanyCodeCurrency                        as Currency,

  @Semantics.amount.currencyCode: 'Currency'
  @DefaultAggregation: #SUM
  Geral.AmountInCompanyCodeCurrency                as ValorTotal,

  @Semantics.quantity.unitOfMeasure: 'BaseUnit'
  @DefaultAggregation: #SUM
  Geral.Quantity                                   as Quantidade

}
where
  Geral.Ledger = '0L'