@AbapCatalog.sqlViewName: 'ZSQL_MVI_CP'   
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Teste - Relatório de Contas a Pagar'
@Metadata.ignorePropagatedAnnotations: true

define view ZCDS_SUPPLIER_MVISOUZA
  as select from I_OperationalAcctgDocItem as bseg
  
    // T001: Dados da Empresa
    left outer join t001       on bseg.CompanyCode = t001.bukrs
    
    // LFA1: Dados do Fornecedor
    left outer join lfa1       on bseg.Supplier = lfa1.lifnr
    
    // T003T: Texto do Tipo de Documento
    left outer join t003t      on  bseg.AccountingDocumentType = t003t.blart
                               and t003t.spras                 = $session.system_language
                               
    // J_1BBRANCH: Dados da Filial
    left outer join j_1bbranch on  bseg.CompanyCode   = j_1bbranch.bukrs
                               and bseg.BusinessPlace = j_1bbranch.branch

{
  key bseg.CompanyCode,
  key bseg.AccountingDocument                                  as NumeroDocumento,
  key bseg.AccountingDocumentItem                              as DocumentItem,
  key bseg.FiscalYear                                          as FiscalYear,
  key bseg.Supplier                                            as Supplier,

      t001.mandt,
      bseg.BusinessArea                                        as Branch,
      t001.butxt                                               as CompanyName,
      lfa1.name1                                               as VendorName,
      bseg.AccountingDocumentType                              as DocType,

      cast(bseg.PostingDate as abap.sstring( 8 ))              as PostingDate,
      cast(bseg.DocumentDate as abap.sstring( 8 ))             as DocumentDate,
      cast(bseg.NetDueDate as abap.sstring( 8 ))               as DueDate,
      bseg.AmountInCompanyCodeCurrency                         as AmountLocalCurrency,
      bseg.DebitCreditCode                                     as DebitCredit,
      cast(bseg.AmountInCompanyCodeCurrency as abap.dec(16,2)) as AmountDocumentCurrency,
      bseg.CompanyCodeCurrency                                 as Currency,
      bseg.PostingKey                                          as PostingKey,
      bseg.DocumentItemText                                    as DocumentText,
      bseg.ClearingJournalEntry                                as ClearingDocument,
      bseg.ClearingDate                                        as ClearingDate,
      bseg.CostCenter                                          as CostCenter,
      j_1bbranch.stcd1                                         as CNPJ,
      t003t.ltext                                              as TipoDespesa,
      bseg.InvoiceReference                                    as DocEstorno,
      case
        when bseg.ClearingJournalEntry <> '' then 'Compensado'
        else 'Aberto'
      end                                                      as DocumentStatus
}
where
  bseg.Supplier is not null
