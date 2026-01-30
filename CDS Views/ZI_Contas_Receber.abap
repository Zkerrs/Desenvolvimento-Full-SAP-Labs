@AbapCatalog.sqlViewName: 'ZISQL_DEV_CR'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Relatório de Contas a Receber'
@Metadata.ignorePropagatedAnnotations: true

@VDM.viewType: #COMPOSITE     
@Analytics.dataCategory: #CUBE 
@OData.publish: true

define view ZI_Contas_Receber
  as select from ZI_GLAccountBalanceFlow as Geral

{
  key Geral.CompanyCode,
  key Geral.Ledger,
  key Geral.AccountingDocument                 as DocumentNumber,
  key Geral.LedgerLineItem                     as DocumentItem,
  key Geral.FiscalYear,

  Geral.Customer,
  Geral.CustomerName,
  
  Geral.GLAccount                              as GLAccount,
  Geral.GLAccountName,
  
  Geral.BusinessArea                           as Branch,
  Geral.ProfitCenter,
  Geral.ProfitCenterName,

  Geral.DocumentType                           as DocType,
  Geral.ReferenceID                            as NotaFiscal_XBLNR,
  Geral.Assignment                             as Atribuicao_ZUONR,
  Geral.ItemText                               as DocumentText,
  
  Geral.PostingDate,
  Geral.DocumentDate,
  Geral.NetDueDate                             as DueDate,
  Geral.ClearingDate,
  
  case 
    when Geral.ClearingDoc is not null and Geral.ClearingDoc <> '' 
    then 'Compensado'
    else 'Aberto'
  end                                          as DocumentStatus,

  Geral.Currency,
  Geral.DebitCreditCode                        as DebitCredit,

  @Semantics.amount.currencyCode: 'Currency'
  @DefaultAggregation: #SUM
  Geral.Amount                                 as AmountDocumentCurrency,

  @Semantics.amount.currencyCode: 'Currency'
  @DefaultAggregation: #SUM
  case 
    when Geral.ClearingDoc is null or Geral.ClearingDoc = '' 
    then Geral.Amount
    else cast( 0 as abap.curr(23,2) )
  end                                          as ValorTotalAberto,

  @Semantics.amount.currencyCode: 'Currency'
  @DefaultAggregation: #SUM
  case 
    when Geral.ClearingDoc is not null and Geral.ClearingDoc <> ''
    then Geral.Amount
    else cast( 0 as abap.curr(23,2) )
  end                                          as ValorTotalCompensado

}
where
    Geral.Ledger = '0L'
    and Geral.Customer is not null