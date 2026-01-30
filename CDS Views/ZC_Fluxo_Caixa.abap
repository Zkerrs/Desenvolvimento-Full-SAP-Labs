@AbapCatalog.sqlViewName: 'ZCFLUXCAIX'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Analytics Fluxo Caixa'

@VDM.viewType: #CONSUMPTION  
@Analytics.query: true       
@OData.publish: true

define view ZC_Fluxo_Caixa
  as select from ZI_Fluxo_Caixa
{
  key SourceLedger,
  key CompanyCode,
  key FiscalYear,
  key LedgerGLLineItem,
  key Ledger,
      ChartOfAccounts,
      GLAccount,
      LedgerFiscalYear,
      FiscalPeriod,
      PostingDate,
      ValueDate,
      DocumentDate,
      ClearingDate,
      NetDueDate,
      CreationDate,
      HouseBank,
      HouseBankAccount,
      FinancialAccountType,
      SpecialGLCode,
      AccountingDocumentType,
      AccountingDocumentCategory,
      DocumentItemText,
      AssignmentReference,
      ReferenceDocumentType,
      OffsettingAccount,
      OffsettingAccountType,
      CostCenter,
      ProfitCenter,
      FunctionalArea,
      BusinessArea,
      Segment,
      ControllingArea,
      Customer,
      Supplier,
      PartnerCompany,
      CompanyCodeCurrency,
      AmountInCompanyCodeCurrency,
      TransactionCurrency,
      AmountInTransactionCurrency,
      DebitCreditCode,
      /* Associations */
      _CompanyCode,
      _GLAccount,
      _CostCenter,
      _ProfitCenter,
      _Customer,
      _Supplier
}
