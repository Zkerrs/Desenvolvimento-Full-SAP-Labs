@AbapCatalog.sqlViewName: 'ZIIMOBASS'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Imobilizado'
@Metadata.ignorePropagatedAnnotations: true

@VDM.viewType: #COMPOSITE     
@Analytics.dataCategory: #CUBE 

define view ZI_Imobilizado_Ass
  as select from ZI_GLAccountBalance_Ass as Geral

  -- associações de texto específicas do imobilizado
  association [0..1] to I_AssetTransactionTypeText as _TrxText   on  $projection.AssetTrxType = _TrxText.AssetTransactionType
                                                                 and _TrxText.Language        = $session.system_language

  association [0..1] to I_AssetClassText           as _ClassText on  $projection.AssetClass   = _ClassText.AssetClass
                                                                 and _ClassText.Language      = $session.system_language
{
  key Geral.CompanyCode,
  key Geral.Ledger,
  key Geral.AccountingDocument,
  key Geral.LedgerLineItem,
  key Geral.FiscalYear,
  
  key Geral.MasterFixedAsset              as AssetMainNumber,
  key Geral.FixedAssetSub                 as AssetSubNumber,
  
  -- indo na associação da view base para pegar dados mestre
  Geral._AssetMaster.AssetClass           as AssetClass,
  Geral._AssetMaster.CapitalizationDate   as CapitalizationDate,
  Geral._AssetMaster.DeactivationDate     as DeactivationDate,
  
  @ObjectModel.text.association: '_TrxText'
  Geral.AssetTrxType,

  Geral.FiscalPeriod,
  Geral.PostingDate,
  Geral.DocumentDate,
  Geral.ReferenceID,       
  Geral.ItemText,          

  Geral.CostCenter,
  Geral.ProfitCenter,
  Geral.Segment,
  Geral.Plant,
  
  Geral.WBSElement,
  Geral.Project,

  Geral.GLAccount,
  Geral.Supplier,
  
  Geral.Currency,
  
  @Semantics.amount.currencyCode: 'Currency'
  @DefaultAggregation: #SUM
  Geral.Amount                            as Amount,
  
  Geral.BaseUnit,
  
  @Semantics.quantity.unitOfMeasure: 'BaseUnit'
  @DefaultAggregation: #SUM
  Geral.Quantity                          as Quantity,

  -- Expondo as associações de texto e mestre
  _TrxText,
  _ClassText,
  Geral._AssetMaster,
  Geral._CostCenterText,
  Geral._GLAccountText
}
