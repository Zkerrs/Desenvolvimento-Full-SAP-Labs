@AbapCatalog.sqlViewName: 'ZCIMPFLOWCB'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Analytics de Impostos'
@Metadata.ignorePropagatedAnnotations: true

@VDM.viewType: #CONSUMPTION
@Analytics.query: true
@OData.publish: true

define view ZC_Impostos_FlowCB
  as select from ZI_Impostos_FlowCB
{
    key CompanyCode,
    key Ledger,
    
    @EndUserText.label: 'Número do Documento'
    key AccountingDocument,
    
    @EndUserText.label: 'Item'
    key LedgerLineItem,
    
    key FiscalYear,

    @EndUserText.label: 'Conta Razão'
    GLAccount,
    
    @EndUserText.label: 'Nome da Conta'
    GLAccountName,
    
    @EndUserText.label: 'Área de Negócio'
    AreaNegocio,
    
    @EndUserText.label: 'Centro/Planta'
    Planta,
    
    @EndUserText.label: 'Fornecedor'
    Supplier,
    
    @EndUserText.label: 'Nome do Fornecedor'
    SupplierName,
    
    @EndUserText.label: 'Cliente'
    Customer,
    
    @EndUserText.label: 'Nome do Cliente'
    CustomerName,
    
    @EndUserText.label: 'Centro de Lucro'
    ProfitCenter,
    
    @EndUserText.label: 'Nome do Centro de Lucro'
    ProfitCenterName,

    @EndUserText.label: 'Tipo de Documento'
    DocumentType,
    
    @EndUserText.label: 'Nota Fiscal / Ref.'
    NotaFiscal_XBLNR,
    
    @EndUserText.label: 'Histórico'
    Historico,
    
    @EndUserText.label: 'Atribuição'
    Atribuicao,

    @EndUserText.label: 'Data de Lançamento'
    DataLancamento,
    
    @EndUserText.label: 'Data do Documento'
    DataDocumento,
    
    @EndUserText.label: 'Data de Compensação'
    DataCompensacao,

    @EndUserText.label: 'Status do Imposto'
    StatusImposto,

    
    @EndUserText.label: 'Moeda'
    CompanyCodeCurrency,

    @DefaultAggregation: #SUM
    @EndUserText.label: 'Valor do Imposto (Geral)'
    AmountInCompanyCodeCurrency,

    @DefaultAggregation: #SUM
    @EndUserText.label: 'Débito (A Recuperar)'
    ValorDebito,

    @DefaultAggregation: #SUM
    @EndUserText.label: 'Crédito (A Recolher)'
    ValorCredito
}
