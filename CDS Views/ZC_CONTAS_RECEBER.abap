@AbapCatalog.sqlViewName: 'ZCSQL_DEV_CR'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Relatório de Contas a Receber (Query)'
@Metadata.ignorePropagatedAnnotations: true

@VDM.viewType: #CONSUMPTION  
@Analytics.query: true       
@OData.publish: true

define view ZC_Contas_Receber
  as select from ZI_Contas_Receber
{
    key CompanyCode,
    key DocumentNumber,
    key DocumentItem,
    key FiscalYear,
    key Customer,      
    key GLAccount,
    
    @EndUserText.label: 'Mandante'
    MandanteCod,               
    Branch,
    CompanyName,
    CustomerName,
    DocType,
    PostingDate,
    DocumentDate,
    DueDate,
    DocumentText,
    ClearingDocument,
    ClearingDate,
    ProfitCenter,
    CNPJ,
    TipoReceita,
    DocEstorno,
    DocumentStatus,
    DebitCredit,
    PostingKey,
    Currency,

    @DefaultAggregation: #SUM
    AmountLocalCurrency,

    @DefaultAggregation: #SUM
    AmountDocumentCurrency,
    
    @DefaultAggregation: #SUM
    @EndUserText.label: 'Total em Aberto'
    ValorTotalAberto,

    @DefaultAggregation: #SUM
    @EndUserText.label: 'Total Compensado'
    ValorTotalCompensado
}
