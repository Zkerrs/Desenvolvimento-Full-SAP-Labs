@AbapCatalog.sqlViewName: 'ZICNTRECSTD'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Relatório Contas a Receber'
@Metadata.ignorePropagatedAnnotations: true

@VDM.viewType: #COMPOSITE
@Analytics.dataCategory: #CUBE
@OData.publish: true

define view ZI_Contas_Receber_Std
  as select from I_OperationalAcctgDocItem as bseg

  association [0..1] to I_CompanyCode as _CompanyCode             on  bseg.CompanyCode = _CompanyCode.CompanyCode

  association [0..1] to I_Customer as _Customer                   on  bseg.Customer = _Customer.Customer

  association [0..1] to I_AccountingDocumentTypeText as _DocType  on  bseg.AccountingDocumentType = _DocType.AccountingDocumentType
                                                                  and _DocType.Language = $session.system_language

  association [0..1] to I_BR_BusinessPlace as _Branch             on  bseg.CompanyCode = _Branch.CompanyCode
                                                                  and bseg.BusinessPlace = _Branch.Branch

{
  key bseg.CompanyCode,
  key bseg.AccountingDocument                              as DocumentNumber,
  key bseg.AccountingDocumentItem                          as DocumentItem,
  key bseg.FiscalYear,
  key bseg.Customer,
  key bseg.GLAccount,

      bseg.BusinessArea                                    as Branch,
      _CompanyCode.CompanyCodeName                         as CompanyName,
      _Customer.CustomerName                               as CustomerName,
      bseg.AccountingDocumentType                          as DocType,
      bseg.PostingDate,
      bseg.DocumentDate,
      bseg.NetDueDate                                      as DueDate,
      bseg.FiscalPeriod,

      @Semantics.amount.currencyCode: 'Currency'
      @DefaultAggregation: #SUM
      bseg.AmountInCompanyCodeCurrency                     as AmountLocalCurrency,

      bseg.DebitCreditCode                                 as DebitCredit,

      @Semantics.amount.currencyCode: 'Currency'
      @DefaultAggregation: #SUM
      cast(bseg.AmountInCompanyCodeCurrency as abap.dec(16,2)) as AmountDocumentCurrency,

      @Semantics.currencyCode: true
      bseg.CompanyCodeCurrency                             as Currency,

      bseg.PostingKey,
      bseg.SpecialGLCode                                   as UMSKZ,
      bseg.SpecialGLTransactionType                        as UMSKS,

      bseg.ZUMSK                                           as ZUMSK,
      
      bseg.DocumentItemText                                as DocumentText,
      bseg.ClearingJournalEntry                            as ClearingDocument,
      bseg.ClearingDate,
      
      bseg.ProfitCenter,
      bseg.SalesDocument                                   as PedidoVenda,
      bseg.OffsettingAccount                               as GKONT,
      bseg.OffsettingAccountType                           as GKOAR,

      _Branch.BR_CNPJ                                      as CNPJ,
      _DocType.AccountingDocumentTypeName                  as TipoDocumento,
      bseg.InvoiceReference                                as DocEstorno,

      case
        when bseg.ClearingJournalEntry is not initial then 'Compensado'
        else 'Aberto'
      end                                                  as DocumentStatus,

      @Semantics.amount.currencyCode: 'Currency'
      @DefaultAggregation: #SUM
      case
        when bseg.ClearingJournalEntry is initial
        then cast(bseg.AmountInCompanyCodeCurrency as abap.dec(16,2))
        else cast(0 as abap.dec(16,2))
      end                                                  as ValorTotalAberto,

      @Semantics.amount.currencyCode: 'Currency'
      @DefaultAggregation: #SUM
      case
        when bseg.ClearingJournalEntry is not initial
        then cast(bseg.AmountInCompanyCodeCurrency as abap.dec(16,2))
        else cast(0 as abap.dec(16,2))
      end                                                  as ValorTotalCompensado
}
where
      bseg.FinancialAccountType = 'D' -- D = Debtors (Clientes)
  and bseg.Customer is not initial