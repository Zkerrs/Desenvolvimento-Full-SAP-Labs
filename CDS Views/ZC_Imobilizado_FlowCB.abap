@AbapCatalog.sqlViewName: 'ZCIMOBFL'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Relatório de Imobilizado (Analítico)'
@Metadata.ignorePropagatedAnnotations: true

@VDM.viewType: #CONSUMPTION
@Analytics.query: true       
@OData.publish: true

define view ZC_IMOBILIZADO_FLOWCB
  as select from ZI_IMOBILIZADO_FLOWCB
{
    key CompanyCode,
    key Ledger,
    
    @EndUserText.label: 'Documento Contábil'
    key AccountingDocument,
    
    key LedgerLineItem,
    key FiscalYear,

   @EndUserText.label: 'Imobilizado'
    AssetMainNumber,
    
    @EndUserText.label: 'Nr. Imobilizado'
    AssetSubNumber,
    
    @EndUserText.label: 'Descrição do Imobilizado'
    AssetName,
    
    @EndUserText.label: 'Classe do Ativo'
    AssetClass,

    @EndUserText.label: 'Descrição da Classe'
    AssetClassDescription,
    
    @EndUserText.label: 'Tipo de Movimento'
    AssetTrxType,
    
    @EndUserText.label: 'Descrição do Movimento'
    AssetTransactionTypeName,

    @EndUserText.label: 'Conta Razão'
    GLAccount,

    @EndUserText.label: 'Nome da Conta'
    GLAccountName,

    FiscalPeriod,

    @EndUserText.label: 'Data Lançamento'
    PostingDate,
    
    @EndUserText.label: 'Data Documento'
    DocumentDate,

    @EndUserText.label: 'Nota Fiscal / Ref'
    ReferenceID,
    
    @EndUserText.label: 'Histórico'
    ItemText,

    @EndUserText.label: 'Centro de Custo'
    CostCenter,
    @EndUserText.label: 'Nome C. Custo'
    CostCenterName,
    
    @EndUserText.label: 'Centro de Lucro'
    ProfitCenter,
    @EndUserText.label: 'Nome C. Lucro'
    ProfitCenterName,
    
    @EndUserText.label: 'Planta'
    Plant,
    @EndUserText.label: 'Nome Planta'
    PlantName,

    @EndUserText.label: 'Elemento PEP'
    WBSElement,
    @EndUserText.label: 'Nome do Projeto'
    WBSDescription,
    
    @EndUserText.label: 'Fornecedor'
    Supplier,
    @EndUserText.label: 'Nome Fornecedor'
    SupplierName,
    
    Currency,

    @DefaultAggregation: #SUM
    @EndUserText.label: 'Valor (Moeda Empresa)'
    Amount
}
