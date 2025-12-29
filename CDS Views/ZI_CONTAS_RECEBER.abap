@AbapCatalog.sqlViewName: 'ZISQL_DEV_CR'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'CDS - Relatório de Contas a Receber'
@Metadata.ignorePropagatedAnnotations: true

@VDM.viewType: #COMPOSITE     
@Analytics.dataCategory: #CUBE 
@OData.publish: true

define view ZI_Contas_Receber
  as select from I_OperationalAcctgDocItem as bseg
    
    // --- JOINS ---
    left outer join t001       on bseg.CompanyCode = t001.bukrs
    left outer join kna1       on bseg.Customer    = kna1.kunnr
    
    left outer join t003t      on  bseg.AccountingDocumentType = t003t.blart
                               and t003t.spras                 = $session.system_language
                               
    left outer join j_1bbranch on  bseg.CompanyCode   = j_1bbranch.bukrs
                               and bseg.BusinessPlace = j_1bbranch.branch
{
  key bseg.CompanyCode,
  key bseg.AccountingDocument                                  as DocumentNumber,
  key bseg.AccountingDocumentItem                              as DocumentItem,
  key bseg.FiscalYear                                          as FiscalYear,
  key bseg.Customer                                            as Customer, 
  key bseg.GLAccount                                           as GLAccount,
  
  concat( t001.mandt, '' )                                     as MandanteCod,
  
  bseg.BusinessArea                                            as Branch,
  t001.butxt                                                   as CompanyName,
  kna1.name1                                                   as CustomerName, 
  bseg.AccountingDocumentType                                  as DocType,
  bseg.PostingDate                                             as PostingDate,
  bseg.DocumentDate                                            as DocumentDate,
  bseg.NetDueDate                                              as DueDate,
  
  @Semantics.amount.currencyCode: 'Currency'
  @DefaultAggregation: #SUM
  bseg.AmountInCompanyCodeCurrency                             as AmountLocalCurrency,
  
  bseg.DebitCreditCode                                         as DebitCredit,
  
  @Semantics.amount.currencyCode: 'Currency'
  @DefaultAggregation: #SUM
  cast(bseg.AmountInCompanyCodeCurrency as abap.dec(16,2))     as AmountDocumentCurrency,
  
  @Semantics.currencyCode: true
  bseg.CompanyCodeCurrency                                     as Currency,
  
  bseg.PostingKey                                              as PostingKey,
  bseg.DocumentItemText                                        as DocumentText,
  bseg.ClearingJournalEntry                                    as ClearingDocument,
  bseg.ClearingDate                                            as ClearingDate,
  
  bseg.ProfitCenter                                            as ProfitCenter,
  
  j_1bbranch.stcd1                                             as CNPJ,       
  t003t.ltext                                                  as TipoReceita, 
  bseg.InvoiceReference                                        as DocEstorno,
  
  case
    when bseg.ClearingJournalEntry <> '' then 'Compensado'
    else 'Aberto'
  end                                                          as DocumentStatus,
  
  @Semantics.amount.currencyCode: 'Currency'
  @DefaultAggregation: #SUM
  case 
    when bseg.ClearingJournalEntry is null or bseg.ClearingJournalEntry = '' 
    then cast(bseg.AmountInCompanyCodeCurrency as abap.dec(16,2))
    else cast(0 as abap.dec(16,2))
  end                                                          as ValorTotalAberto,

  @Semantics.amount.currencyCode: 'Currency'
  @DefaultAggregation: #SUM
  case 
    when bseg.ClearingJournalEntry <> '' 
    then cast(bseg.AmountInCompanyCodeCurrency as abap.dec(16,2))
    else cast(0 as abap.dec(16,2))
  end                                                          as ValorTotalCompensado
}
where
  bseg.Customer is not null
