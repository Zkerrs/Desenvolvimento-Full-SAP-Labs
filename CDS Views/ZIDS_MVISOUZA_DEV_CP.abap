@AbapCatalog.sqlViewName: 'ZISQL_MVI_DEV_CP'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'CDS - Relatório de Contas a Pagar (Interface View)'
@Metadata.ignorePropagatedAnnotations: true

@VDM.viewType: #COMPOSITE     
@Analytics.dataCategory: #CUBE 
@OData.publish: true

define view ZIDS_MVISOUZA_CP
  as select from I_OperationalAcctgDocItem as bseg
    
    // --- JOINS ---
    left outer join t001       on bseg.CompanyCode = t001.bukrs
    left outer join lfa1       on bseg.Supplier = lfa1.lifnr
    
    // T003T: Texto do Tipo de Documento
    left outer join t003t      on  bseg.AccountingDocumentType = t003t.blart
                               and t003t.spras                 = $session.system_language
                               
    // J_1BBRANCH: Dados da Filial
    left outer join j_1bbranch on  bseg.CompanyCode   = j_1bbranch.bukrs
                               and bseg.BusinessPlace = j_1bbranch.branch
{
  key bseg.CompanyCode,
  key bseg.AccountingDocument                                  as DocumentNumber,
  key bseg.AccountingDocumentItem                              as DocumentItem,
  key bseg.FiscalYear                                          as FiscalYear,
  key bseg.Supplier                                            as Supplier,
  key bseg.GLAccount                                           as GLAccount,
  
  concat( t001.mandt, '' )                                     as MandanteCod,
  
  bseg.BusinessArea                                            as Branch,
  t001.butxt                                                   as CompanyName,
  lfa1.name1                                                   as VendorName,
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
  bseg.CostCenter                                              as CostCenter,
  j_1bbranch.stcd1                                             as CNPJ,       
  t003t.ltext                                                  as TipoDespesa, 
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
  bseg.Supplier is not null
