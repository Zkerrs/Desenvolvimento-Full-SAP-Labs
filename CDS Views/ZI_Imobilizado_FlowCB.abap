@AbapCatalog.sqlViewName: 'ZIIMOBFL'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Imobilizado (Fonte: Razão Geral)'
@Metadata.ignorePropagatedAnnotations: true

@VDM.viewType: #COMPOSITE     
@Analytics.dataCategory: #CUBE 
@OData.publish: true

define view ZI_IMOBILIZADO_FLOWCB
  as select from ZI_GLACCOUNTBALANCEFLOWCB as Geral

  association [0..1] to I_AssetTransactionTypeText as _TrxText 
    on  Geral.AssetTrxType = _TrxText.AssetTransactionType
    and _TrxText.Language  = $session.system_language

{
  key Geral.CompanyCode,
  key Geral.Ledger,
  key Geral.AccountingDocument,
  key Geral.LedgerLineItem,
  key Geral.FiscalYear,
  
  key Geral.MasterFixedAsset              as AssetMainNumber,
  key Geral.FixedAssetSub                 as AssetSubNumber,
  
  Geral.AssetName,

  @EndUserText.label: 'Cód. Movimento'
  Geral.AssetTrxType                      as CategoriaMovimento,
  
  @EndUserText.label: 'Descrição do Movimento'
  _TrxText.AssetTransactionTypeName       as NomeDoMovimento,

  Geral.FiscalPeriod,
  Geral.PostingDate,
  Geral.DocumentDate,
  Geral.ReferenceID,       
  Geral.ItemText,          

  Geral.CostCenter,
  Geral.CostCenterName,
  Geral.ProfitCenter,
  Geral.ProfitCenterName,
  Geral.Segment,
  Geral.Plant,
  Geral.PlantName,
  
  -- Capex / Projetos
  Geral.WBSElement,
  Geral.WBSDescription,
  Geral.Project,

  Geral.GLAccount,
  Geral.GLAccountName,
  
  Geral.Supplier,
  Geral.SupplierName,

  Geral.Currency,
  
  @Semantics.amount.currencyCode: 'Currency'
  @DefaultAggregation: #SUM
  Geral.Amount                            as Amount

}
where
    Geral.Ledger = '0L'
    
    
