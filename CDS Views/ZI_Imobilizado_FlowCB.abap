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
  Geral.AssetTrxType                      as TransactionType, -- Ex: 100, 120, 500
  
  case 
    -- Se o Tipo de Documento for 'AF', é Depreciação (Automática)
    when Geral.DocumentType = 'AF'        then 'Depreciação'
    -- Tipos manuais de Depreciação
    when Geral.AssetTrxType = '500'       then 'Depreciação'
    -- (1=Compra, 2=Baixa, 3=Transf)
    when Geral.AssetTrxType like '1%'     then 'Aquisição/Capitalização'
    when Geral.AssetTrxType like '2%'     then 'Baixa/Venda'
    when Geral.AssetTrxType like '3%'     then 'Transferência'
    when Geral.AssetTrxType like '4%'     then 'Pós-Capitalização'
    
    when Geral.MasterFixedAsset is not null 
         and Geral.MasterFixedAsset <> '' then 'Outros/Customizados'
         
    else 'Não Relacionado a Ativo' 
  end                                     as CategoriaMovimento,

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
    
    
