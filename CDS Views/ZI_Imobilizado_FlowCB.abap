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
{
  key Geral.CompanyCode,
  key Geral.Ledger,
  key Geral.AccountingDocument,
  key Geral.LedgerLineItem,
  key Geral.FiscalYear,
  
  -- Dados do Ativo (Imobilizado)
  key Geral.MasterFixedAsset              as AssetMainNumber,
  key Geral.FixedAssetSub                 as AssetSubNumber,
  
  Geral.AssetName,
  @EndUserText.label: 'Tipo de Movimento'
  Geral.AssetTrxType                      as CategoriaMovimento,  
  Geral.FiscalPeriod,
  Geral.PostingDate,
  Geral.DocumentDate,
  Geral.ReferenceID,       -- Nota Fiscal
  Geral.ItemText,          

  Geral.CostCenter,
  Geral.CostCenterName,
  Geral.ProfitCenter,
  Geral.ProfitCenterName,
  Geral.Segment,
  Geral.Plant,
  Geral.PlantName,
  
  -- (Capex)
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
    
    
