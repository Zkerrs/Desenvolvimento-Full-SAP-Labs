@AbapCatalog.sqlViewName: 'ZIROYALTYSTD'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Relatório de Royalties Standard'
@Metadata.ignorePropagatedAnnotations: true

@VDM.viewType: #COMPOSITE
@Analytics.dataCategory: #CUBE 
@OData.publish: true

define view ZI_Royalties_Std
  as select from I_JournalEntryItem as Geral

  association [0..1] to I_JournalEntry as _JournalHeader       on  Geral.CompanyCode        = _JournalHeader.CompanyCode
                                                               and Geral.FiscalYear         = _JournalHeader.FiscalYear
                                                               and Geral.AccountingDocument = _JournalHeader.AccountingDocument

  association [0..1] to I_Supplier as _Supplier                on  Geral.Supplier = _Supplier.Supplier

  association [0..1] to I_ProductText as _ProductText          on  Geral.Product = _ProductText.Product
                                                               and _ProductText.Language = $session.system_language

  association [0..1] to I_GLAccountTextInCompanycode as _GLText on Geral.CompanyCode = _GLText.CompanyCode
                                                               and Geral.GLAccount   = _GLText.GLAccount
                                                               and _GLText.Language  = $session.system_language

  association [0..1] to I_CostCenterText as _CCText            on  Geral.ControllingArea = _CCText.ControllingArea
                                                               and Geral.CostCenter = _CCText.CostCenter
                                                               and _CCText.Language = $session.system_language

  association [0..1] to I_ProfitCenterText as _PCText          on  Geral.ControllingArea = _PCText.ControllingArea
                                                               and Geral.ProfitCenter = _PCText.ProfitCenter
                                                               and _PCText.Language = $session.system_language

{
  key Geral.CompanyCode,
  key Geral.Ledger,
  key Geral.AccountingDocument                                 as DocumentNumber,
  key Geral.LedgerGLLineItem                                   as DocumentItem,
  key Geral.FiscalYear,

  Geral.FiscalPeriod,
  Geral.PostingDate,
  
  Geral.Supplier,
  _Supplier.SupplierName                                       as SupplierName,
  
  Geral.Product                                                as Material,
  _ProductText.ProductName                                     as MaterialName,

  Geral.GLAccount,
  _GLText.GLAccountName                                        as GLAccountName,
  
  Geral.CostCenter,
  _CCText.CostCenterName                                       as CostCenterName,
  Geral.ProfitCenter,
  _PCText.ProfitCenterName                                     as ProfitCenterName,

  Geral.AssignmentReference                                    as Atribuicao,
  Geral.DocumentItemText                                       as Historico,
  _JournalHeader.DocumentReferenceID                           as Referencia,

  Geral.CompanyCodeCurrency                                    as Currency,

  @Semantics.amount.currencyCode: 'Currency'
  @DefaultAggregation: #SUM
  Geral.AmountInCompanyCodeCurrency                            as Valor

}
where
  Geral.Ledger = '0L'