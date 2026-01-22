@AbapCatalog.sqlViewName: 'ZCSQL_DEV_CR'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Relatório de Contas a Receber (Query)'
@Metadata.ignorePropagatedAnnotations: true

@VDM.viewType: #CONSUMPTION  
@Analytics.query: true       
@OData.publish: true

define view ZC_Contas_ReceberFlowCB
  as select from ZI_Contas_ReceberFlowCB
{
    key CompanyCode,
    key Ledger,
    
    @EndUserText.label: 'Número do Documento'
    key DocumentNumber,
    
    @EndUserText.label: 'Item'
    key DocumentItem,
    
    key FiscalYear,

    @EndUserText.label: 'Cliente'
    Customer,
    
    @EndUserText.label: 'Nome do Cliente'
    CustomerName,

    @EndUserText.label: 'Conta Razão'
    GLAccount,
    
    @EndUserText.label: 'Nome da Conta'
    GLAccountName,

    @EndUserText.label: 'Área de Negócio'
    Branch,
    
    @EndUserText.label: 'Centro de Lucro'
    ProfitCenter,
    
    @EndUserText.label: 'Nome Centro Lucro'
    ProfitCenterName,

    @EndUserText.label: 'Tipo de Documento'
    DocType,
    
    @EndUserText.label: 'Referência / Nota Fiscal'
    NotaFiscal_XBLNR,
    
    @EndUserText.label: 'Atribuição'
    Atribuicao_ZUONR,
    
    @EndUserText.label: 'Texto do Item'
    DocumentText,
    
    @EndUserText.label: 'Débito/Crédito'
    DebitCredit,

    @EndUserText.label: 'Data de Lançamento'
    PostingDate,
    
    @EndUserText.label: 'Data do Documento'
    DocumentDate,
    
    @EndUserText.label: 'Data de Vencimento'
    DueDate,
    
    @EndUserText.label: 'Data de Compensação'
    ClearingDate,

    @EndUserText.label: 'Status do Documento'
    DocumentStatus,

    Currency,

    @DefaultAggregation: #SUM
    @EndUserText.label: 'Valor Original'
    AmountDocumentCurrency,

    @DefaultAggregation: #SUM
    @EndUserText.label: 'Saldo em Aberto'
    ValorTotalAberto,

    @DefaultAggregation: #SUM
    @EndUserText.label: 'Valor Compensado'
    ValorTotalCompensado
}