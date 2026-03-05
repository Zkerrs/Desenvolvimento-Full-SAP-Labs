@AbapCatalog.sqlViewName: 'ZIGLABLCASS'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'View Geral Base - Association'
@Metadata.ignorePropagatedAnnotations: true

@VDM.viewType: #COMPOSITE     
@Analytics.dataCategory: #CUBE 

define view ZI_GLAccountBalance_Ass
  as select from I_GLAccountLineItem as Item

  association [0..1] to I_GLAccountText      as _GLAccountText  on  $projection.ChartOfAccounts = _GLAccountText.ChartOfAccounts
                                                                and $projection.GLAccount       = _GLAccountText.GLAccount
                                                                and _GLAccountText.Language     = $session.system_language

  association [0..1] to I_CostCenterText     as _CostCenterText on  $projection.ControllingArea = _CostCenterText.ControllingArea
                                                                and $projection.CostCenter      = _CostCenterText.CostCenter
                                                                and _CostCenterText.Language    = $session.system_language

  association [0..1] to I_ProfitCenterText   as _ProfitCenterText on $projection.ControllingArea = _ProfitCenterText.ControllingArea
                                                                and $projection.ProfitCenter    = _ProfitCenterText.ProfitCenter
                                                                and _ProfitCenterText.Language  = $session.system_language

  association [0..1] to I_Customer           as _Customer       on  $projection.Customer = _Customer.Customer
  
  association [0..1] to I_Supplier           as _Supplier       on  $projection.Supplier = _Supplier.Supplier

  association [0..1] to I_FixedAsset         as _AssetMaster    on  $projection.CompanyCode      = _AssetMaster.CompanyCode
                                                                and $projection.MasterFixedAsset = _AssetMaster.MasterFixedAsset
                                                                and $projection.FixedAssetSub    = _AssetMaster.FixedAsset

  association [0..1] to I_ProductText        as _MaterialText   on  $projection.Material = _MaterialText.Product
                                                                and _MaterialText.Language = $session.system_language

  association [0..1] to I_Plant              as _Plant          on  $projection.Plant = _Plant.Plant
  
  association [0..1] to I_WBSElement         as _WBS            on  $projection.WBSElement = _WBS.WBSElement

{
  key Item.CompanyCode                 as CompanyCode,
  key Item.Ledger                      as Ledger,
  key Item.SourceLedger                as SourceLedger,
  key Item.AccountingDocument          as AccountingDocument,
  key Item.LedgerGLLineItem            as LedgerLineItem,
  key Item.FiscalYear                  as FiscalYear,

      Item.OffsettingAccount           as GKONT,
      Item.OffsettingAccountType       as GKOAR,
      Item.FiscalPeriod                as FiscalPeriod,
      Item.ChartOfAccounts             as ChartOfAccounts,

      @ObjectModel.text.association: '_GLAccountText'
      Item.GLAccount                   as GLAccount,

      Item.FinancialAccountType        as AccountType,
      Item.ControllingArea             as ControllingArea,

      @ObjectModel.text.association: '_CostCenterText'
      Item.CostCenter                  as CostCenter,

      @ObjectModel.text.association: '_ProfitCenterText'
      Item.ProfitCenter                as ProfitCenter,

      Item.FunctionalArea              as FunctionalArea, 
      Item.BusinessArea                as BusinessArea,
      Item.Segment                     as Segment,

      @ObjectModel.foreignKey.association: '_Customer'
      Item.Customer                    as Customer,

      @ObjectModel.foreignKey.association: '_Supplier'
      Item.Supplier                    as Supplier,

      @ObjectModel.foreignKey.association: '_AssetMaster'
      Item.MasterFixedAsset            as MasterFixedAsset,
      Item.FixedAsset                  as FixedAssetSub,
      Item.AssetTransactionType        as AssetTrxType,

      Item.PostingDate                 as PostingDate,  
      Item.DocumentDate                as DocumentDate, 
      Item.NetDueDate                  as NetDueDate,   
      Item.ClearingDate                as ClearingDate, 
      Item.CreationDate                as CreationDate, 

      Item.AccountingDocumentType      as DocumentType, 
      Item.DocumentItemText            as ItemText,     
      Item.AssignmentReference         as Assignment,   
      Item.ReferenceDocument           as ReferenceID,  
      Item.ReferenceDocumentType       as RefDocType,
      Item.ClearingJournalEntry        as ClearingDoc,  

      @ObjectModel.text.association: '_MaterialText'
      Item.Product                     as Material,
      
      @ObjectModel.foreignKey.association: '_Plant'
      Item.Plant                       as Plant,
      Item.SoldProduct                 as SoldProduct,

      @ObjectModel.foreignKey.association: '_WBS'
      Item.WBSElement                  as WBSElement,
      Item.Project                     as Project,

      Item.HouseBank                   as HouseBank,
      Item.HouseBankAccount            as HouseBankAccount,
      Item.DebitCreditCode             as DebitCreditCode, 

      Item.CompanyCodeCurrency         as Currency,

      @Semantics.amount.currencyCode: 'Currency'
      @DefaultAggregation: #SUM
      Item.AmountInCompanyCodeCurrency as Amount,

      Item.BaseUnit                    as BaseUnit,

      @Semantics.quantity.unitOfMeasure: 'BaseUnit'
      @DefaultAggregation: #SUM
      Item.Quantity                    as Quantity,

      // Expondo as associações para quem consumir a view poder usar
      _GLAccountText,
      _CostCenterText,
      _ProfitCenterText,
      _Customer,
      _Supplier,
      _AssetMaster,
      _MaterialText,
      _Plant,
      _WBS
}