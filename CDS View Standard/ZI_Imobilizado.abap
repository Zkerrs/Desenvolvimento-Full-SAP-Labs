@AbapCatalog.sqlViewName: 'ZIIMOBSTD'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Relatório Imobilizado Completo'
@Metadata.ignorePropagatedAnnotations: true

@VDM.viewType: #COMPOSITE
@Analytics.dataCategory: #CUBE
@OData.publish: true

define view ZI_Imobilizado_Std
  as select from    I_JournalEntryItem as Geral

    left outer join I_FixedAsset       as _AssetMaster on  Geral.CompanyCode      = _AssetMaster.CompanyCode
                                                       and Geral.MasterFixedAsset = _AssetMaster.MasterFixedAsset
                                                       and Geral.FixedAsset       = _AssetMaster.FixedAsset

  association [0..1] to I_JournalEntry               as _JournalHeader on  Geral.CompanyCode        = _JournalHeader.CompanyCode
                                                                       and Geral.FiscalYear         = _JournalHeader.FiscalYear
                                                                       and Geral.AccountingDocument = _JournalHeader.AccountingDocument

  association [0..1] to I_AssetTransactionTypeText   as _TrxText       on  Geral.AssetTransactionType = _TrxText.AssetTransactionType
                                                                       and _TrxText.Language          = $session.system_language

  association [0..1] to I_AssetClassText             as _ClassText     on  _AssetMaster.AssetClass = _ClassText.AssetClass
                                                                       and _ClassText.Language     = $session.system_language

  association [0..1] to I_CostCenterText             as _CCText        on  Geral.CostCenter      = _CCText.CostCenter
                                                                       and Geral.ControllingArea = _CCText.ControllingArea
                                                                       and _CCText.Language      = $session.system_language

  association [0..1] to I_ProfitCenterText           as _PCText        on  Geral.ProfitCenter    = _PCText.ProfitCenter
                                                                       and Geral.ControllingArea = _PCText.ControllingArea
                                                                       and _PCText.Language      = $session.system_language

  association [0..1] to I_GlAccountTextInCompanycode as _GLText        on  Geral.GLAccount   = _GLText.GLAccount
                                                                       and Geral.CompanyCode = _GLText.CompanyCode
                                                                       and _GLText.Language  = $session.system_language

  association [0..1] to I_Supplier                   as _Supplier      on  Geral.Supplier = _Supplier.Supplier

  association [0..1] to I_Plant                      as _Plant         on  Geral.Plant = _Plant.Plant

  association [0..1] to I_WBSElement                 as _WBS           on  Geral.WBSElement = _WBS.WBSElement

{
  key Geral.CompanyCode,
  key Geral.Ledger,
  key Geral.AccountingDocument,
  key Geral.LedgerGLLineItem             as LedgerLineItem,
  key Geral.FiscalYear,

  key Geral.MasterFixedAsset             as AssetMainNumber,
  key Geral.FixedAsset                   as AssetSubNumber,

      _AssetMaster.FixedAssetDescription as AssetName,
      _AssetMaster.AssetClass,
      _ClassText.AssetClassName          as AssetClassDescription,

      Geral.AssetTransactionType         as AssetTrxType,
      _TrxText.AssetTransactionTypeName,

      Geral.FiscalPeriod,
      Geral.PostingDate,
      Geral.DocumentDate,
      _JournalHeader.DocumentReferenceID as ReferenceID,
      Geral.DocumentItemText             as ItemText,

      Geral.CostCenter,
      _CCText.CostCenterName             as CostCenterName,
      Geral.ProfitCenter,
      _PCText.ProfitCenterName           as ProfitCenterName,
      Geral.Segment,

      Geral.Plant,
      _Plant.PlantName                   as PlantName,

      Geral.WBSElement,
      _WBS.WBSDescription                as WBSDescription,
      Geral.Project,

      Geral.GLAccount,
      _GLText.GLAccountName              as GLAccountName,

      Geral.Supplier,
      _Supplier.SupplierName             as SupplierName,

      Geral.CompanyCodeCurrency          as Currency,

      @Semantics.amount.currencyCode: 'Currency'
      @DefaultAggregation: #SUM
      Geral.AmountInCompanyCodeCurrency  as Amount

}
where
      Geral.Ledger               = '0L'
  and Geral.FinancialAccountType = 'A'
  and Geral.MasterFixedAsset     is not initial