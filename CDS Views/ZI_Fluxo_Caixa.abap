@AbapCatalog.sqlViewName: 'ZIFLUXCAIX'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Interface - Fluxo de Caixa Completo'

@VDM.viewType: #COMPOSITE
@Analytics.dataCategory: #CUBE
@OData.publish: true

define view ZI_Fluxo_Caixa
  as select from I_JournalEntryItemCube

  // Associações
  association [1..1] to I_CompanyCode      as _CompanyCode      on $projection.CompanyCode = _CompanyCode.CompanyCode
  association [0..1] to I_GLAccount        as _GLAccount        on $projection.ChartOfAccounts = _GLAccount.ChartOfAccounts 
                                                               and $projection.GLAccount = _GLAccount.GLAccount
  association [0..1] to I_CostCenter       as _CostCenter       on $projection.ControllingArea = _CostCenter.ControllingArea 
                                                               and $projection.CostCenter = _CostCenter.CostCenter
  association [0..1] to I_ProfitCenter     as _ProfitCenter     on $projection.ControllingArea = _ProfitCenter.ControllingArea 
                                                               and $projection.ProfitCenter = _ProfitCenter.ProfitCenter
  association [0..1] to I_Customer         as _Customer         on $projection.Customer = _Customer.Customer
  association [0..1] to I_Supplier         as _Supplier         on $projection.Supplier = _Supplier.Supplier
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
  
  // Datas
  PostingDate,                // Data Lançamento
  ValueDate,                  // Data de Valor
  DocumentDate,               // Data do Documento
  ClearingDate,               // Data da Compensação
  NetDueDate,                 // Vencimento Líquido
  CreationDate,               

  HouseBank,                  // Banco da Empresa
  HouseBankAccount,           // Conta do Banco
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

  // Valores e moedas
  @Semantics.currencyCode:true
  CompanyCodeCurrency,        
  
  @Semantics.amount.currencyCode: 'CompanyCodeCurrency'
  @DefaultAggregation: #SUM
  AmountInCompanyCodeCurrency, 

  @Semantics.currencyCode:true
  TransactionCurrency,        

  @Semantics.amount.currencyCode: 'TransactionCurrency'
  @DefaultAggregation: #SUM
  AmountInTransactionCurrency,

  DebitCreditCode,            
  // Associações
  _CompanyCode,
  _GLAccount,
  _CostCenter,
  _ProfitCenter,
  _Customer,
  _Supplier
}
where
  Ledger = '0L'
