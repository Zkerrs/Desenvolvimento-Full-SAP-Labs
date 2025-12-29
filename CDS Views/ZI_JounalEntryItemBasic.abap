@AbapCatalog.sqlViewName: 'ZIJournalBasic'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Dados Contábeis - FCX, DRE e BP'

@Analytics.query: true
@VDM.viewType: #CONSUMPTION
@OData.publish: true

define view ZI_JournalEntryItemBasic
  as select from I_JournalEntryItemCube

  association [1..1] to A_CompanyCode                as _CompanyCode              on  $projection.CompanyCode     = _CompanyCode.CompanyCode

  association [0..1] to A_CostCenter                 as _CurrentCostCenter        on  $projection.ControllingArea = _CurrentCostCenter.ControllingArea
                                                                                  and $projection.CostCenter      = _CurrentCostCenter.CostCenter
                                                                                  and _CurrentCostCenter.ValidityStartDate <= $session.system_date
                                                                                  and _CurrentCostCenter.ValidityEndDate   >= $session.system_date

  association [0..1] to A_ProfitCenter               as _CurrentProfitCenter      on  $projection.ControllingArea = _CurrentProfitCenter.ControllingArea
                                                                                  and $projection.ProfitCenter    = _CurrentProfitCenter.ProfitCenter
                                                                                  and _CurrentProfitCenter.ValidityStartDate <= $session.system_date
                                                                                  and _CurrentProfitCenter.ValidityEndDate   >= $session.system_date

  association [0..1] to A_GLAccountInChartOfAccounts as _GLAccountInChartOfAccounts on  $projection.ChartOfAccounts = _GLAccountInChartOfAccounts.ChartOfAccounts
                                                                                    and $projection.GLAccount       = _GLAccountInChartOfAccounts.GLAccount
{

  @ObjectModel.text.element: ['LedgerName']
  Ledger,                       // RLDNR
  LedgerName,

  SourceLedger,                 // RLDNR
  LedgerFiscalYear,             // RYEAR

  @ObjectModel.text.element: ['ControllingAreaName']
  ControllingArea,              // KOKRS
  ControllingAreaName,

  @ObjectModel.text.element: ['CompanyCodeName']
  CompanyCode,                  // RBUKRS
  CompanyCodeName,

  @ObjectModel.text.element: ['GLAccountName']
  GLAccount,                    // RACCT
  GLAccountName,

  @ObjectModel.sapObjectNodeTypeReference:'FinancialTransactionType'
  FinancialTransactionType,     // RMVCT

  BusinessTransactionCategory,

  @ObjectModel.sapObjectNodeTypeReference:'BusinessTransactionType'
  BusinessTransactionType,

  @ObjectModel.sapObjectNodeTypeReference:'ReferenceDocumentType'
  SourceReferenceDocumentType,  // SRC_AWTYP

  @ObjectModel.sapObjectNodeTypeReference:'JournalEntryItemObsoleteReason'
  JrnlEntryItemObsoleteReason,  // OBS_REASON

  @ObjectModel.text.element: ['CostCenterName']
  CostCenter,                   // RCNTR
  CostCenterName,

  @ObjectModel.text.element: ['ProfitCenterName']
  ProfitCenter,                 // PRCTR
  ProfitCenterName,

  @ObjectModel.text.element: ['FunctionalAreaName']
  FunctionalArea,               // RFAREA
  FunctionalAreaName,

  @ObjectModel.text.element: ['BusinessAreaName']
  BusinessArea,                 // RBUSA
  BusinessAreaName,

  @ObjectModel.text.element: ['SegmentName']
  Segment,                      // SEGMENT
  SegmentName,

  @ObjectModel.text.element: ['PartnerCostCenterName']
  PartnerCostCenter,            // SCNTR
  PartnerCostCenterName,

  @ObjectModel.text.element: ['PartnerProfitCenterName']
  PartnerProfitCenter,          // PPRCTR
  PartnerProfitCenterName,

  @ObjectModel.text.element: ['PartnerFunctionalAreaName']
  PartnerFunctionalArea,        // SFAREA
  PartnerFunctionalAreaName,

  @ObjectModel.text.element: ['PartnerBusinessAreaName']
  PartnerBusinessArea,          // SBUSA
  PartnerBusinessAreaName,

  @ObjectModel.text.element: ['PartnerCompanyName']
  PartnerCompany,               // RASSC
  PartnerCompanyName,

  @ObjectModel.text.element: ['PartnerSegmentName']
  PartnerSegment,               // PSEGMENT
  PartnerSegmentName,


  /////////////////////////////////////////////////////////////////////////////////////
  // .INCLUDE ACDOC_SI_VALUE_DATA Unified Journal Entry: Value Fields
  /////////////////////////////////////////////////////////////////////////////////////

  @ObjectModel.sapObjectNodeTypeReference:'Currency'
  @Semantics.currencyCode:true
  TransactionCurrency,          // RWCUR
  @Aggregation.default: #SUM
  @Semantics: { amount : {currencyCode: 'TransactionCurrency'} } 
  AmountInTransactionCurrency,  // WSL

  @ObjectModel.sapObjectNodeTypeReference:'Currency'
  @Semantics.currencyCode:true
  CompanyCodeCurrency,          // RHCUR
  @Aggregation.default: #SUM
  @Semantics: { amount : {currencyCode: 'CompanyCodeCurrency'} } 
  AmountInCompanyCodeCurrency,  // HSL

  @ObjectModel.sapObjectNodeTypeReference:'Currency'
  @Semantics.currencyCode:true
  GlobalCurrency,               // RKCUR
  @Aggregation.default: #SUM
  @Semantics: { amount : {currencyCode: 'GlobalCurrency'} }  
  AmountInGlobalCurrency,       // KSL
  
  @Aggregation.default: #SUM
  @Semantics: { amount : {currencyCode: 'GlobalCurrency'} } 
  FixedAmountInGlobalCrcy,      // KFSL

  @ObjectModel.sapObjectNodeTypeReference:'Currency'
  @Semantics.currencyCode:true
  FunctionalCurrency,
  @Aggregation.default: #SUM
  @Semantics: { amount : {currencyCode: 'FunctionalCurrency'} } 
  AmountInFunctionalCurrency,

  @ObjectModel.sapObjectNodeTypeReference:'Currency'
  @Semantics.currencyCode:true
  ControllingObjectCurrency as ControllingObjectCurrency,
  @Aggregation.default: #SUM
  @Semantics: { amount : {currencyCode: 'ControllingObjectCurrency'} }  
  AmountInObjectCurrency,

  @ObjectModel.sapObjectNodeTypeReference:'UnitOfMeasure'
  @Semantics.unitOfMeasure:true
  CostSourceUnit,               // RVUNIT
  
  @Aggregation.default: #SUM
  @Semantics: { quantity : {unitOfMeasure: 'CostSourceUnit'} }  
  ValuationQuantity,

  @Aggregation.default: #SUM
  @Semantics: { quantity : {unitOfMeasure: 'CostSourceUnit'} }  
  ValuationFixedQuantity,

  @ObjectModel.sapObjectNodeTypeReference:'UnitOfMeasure'
  @Semantics.unitOfMeasure:true
  ReferenceQuantityUnit,        // RRUNIT
  @Aggregation.default: #SUM
  @Semantics: { quantity : {unitOfMeasure: 'ReferenceQuantityUnit'} }  
  ReferenceQuantity,

  @ObjectModel.sapObjectNodeTypeReference:'Currency'
  @Semantics.currencyCode:true
  FreeDefinedCurrency1 as FreeDefinedCurrency1,
  @Aggregation.default: #SUM
  @Semantics: { amount : {currencyCode: 'FreeDefinedCurrency1'} }  
  AmountInFreeDefinedCurrency1,

  @ObjectModel.sapObjectNodeTypeReference:'Currency'
  @Semantics.currencyCode:true
  FreeDefinedCurrency2 as FreeDefinedCurrency2,
  @Aggregation.default: #SUM
  @Semantics: { amount : {currencyCode: 'FreeDefinedCurrency2'} }  
  AmountInFreeDefinedCurrency2,

  @ObjectModel.sapObjectNodeTypeReference:'Currency'
  @Semantics.currencyCode:true
  FreeDefinedCurrency3 as FreeDefinedCurrency3,
  @Aggregation.default: #SUM
  @Semantics: { amount : {currencyCode: 'FreeDefinedCurrency3'} }  
  AmountInFreeDefinedCurrency3,

  @ObjectModel.sapObjectNodeTypeReference:'Currency'
  @Semantics.currencyCode:true
  FreeDefinedCurrency4 as FreeDefinedCurrency4,
  @Aggregation.default: #SUM
  @Semantics: { amount : {currencyCode: 'FreeDefinedCurrency4'} }  
  AmountInFreeDefinedCurrency4,

  @ObjectModel.sapObjectNodeTypeReference:'Currency'
  @Semantics.currencyCode:true
  FreeDefinedCurrency5 as FreeDefinedCurrency5,
  @Aggregation.default: #SUM
  @Semantics: { amount : {currencyCode: 'FreeDefinedCurrency5'} }  
  AmountInFreeDefinedCurrency5,

  @ObjectModel.sapObjectNodeTypeReference:'Currency'
  @Semantics.currencyCode:true
  FreeDefinedCurrency6 as FreeDefinedCurrency6,
  @Aggregation.default: #SUM
  @Semantics: { amount : {currencyCode: 'FreeDefinedCurrency6'} }  
  AmountInFreeDefinedCurrency6,

  @ObjectModel.sapObjectNodeTypeReference:'Currency'
  @Semantics.currencyCode:true
  FreeDefinedCurrency7 as FreeDefinedCurrency7,
  @Aggregation.default: #SUM
  @Semantics: { amount : {currencyCode: 'FreeDefinedCurrency7'} }  
  AmountInFreeDefinedCurrency7,

  @ObjectModel.sapObjectNodeTypeReference:'Currency'
  @Semantics.currencyCode:true
  FreeDefinedCurrency8 as FreeDefinedCurrency8,
  @Aggregation.default: #SUM
  @Semantics: { amount : {currencyCode: 'FreeDefinedCurrency8'} }  
  AmountInFreeDefinedCurrency8,

  @ObjectModel.sapObjectNodeTypeReference:'UnitOfMeasure'
  @Semantics.unitOfMeasure:true
  BaseUnit,                     // RUNIT
  @Aggregation.default: #SUM
  @Semantics: { quantity : {unitOfMeasure: 'BaseUnit'} }  
  Quantity,                     // MSL

  @ObjectModel.sapObjectNodeTypeReference:'UnitOfMeasure'
  @Semantics.unitOfMeasure:true
  AdditionalQuantity1Unit,      // QUNIT1
  @Aggregation.default: #SUM
  @Semantics: { quantity : {unitOfMeasure: 'AdditionalQuantity1Unit'} }  
  AdditionalQuantity1,          // QUANT1

  @ObjectModel.sapObjectNodeTypeReference:'UnitOfMeasure'
  @Semantics.unitOfMeasure:true
  AdditionalQuantity2Unit,      // QUNIT2
  @Aggregation.default: #SUM
  @Semantics: { quantity : {unitOfMeasure: 'AdditionalQuantity2Unit'} }  
  AdditionalQuantity2,          // QUANT2

  @ObjectModel.sapObjectNodeTypeReference:'UnitOfMeasure'
  @Semantics.unitOfMeasure:true
  AdditionalQuantity3Unit,      // QUNIT3
  @Aggregation.default: #SUM
  @Semantics: { quantity : {unitOfMeasure: 'AdditionalQuantity3Unit'} }  
  AdditionalQuantity3,          // QUANT3

  /////////////////////////////////////////////////////////////////////////////
  // .INCLUDE ACDOC_SI_FIX  Unified Journal Entry: Mandatory fields for G/L
  ////////////////////////////////////////////////////////////////////////////
  
  @ObjectModel.sapObjectNodeTypeReference:'JournalEntryCategory'
  AccountingDocumentCategory,   // BSTAT
  
  FiscalPeriod,                 // POPER
  
  @ObjectModel.sapObjectNodeTypeReference:'FiscalYearVariant'
  FiscalYearVariant,            // PERIV
  
  cast( cast(FiscalYearPeriod as abap.char(7)) as fis_jahrper_c preserving type ) as FiscalYearPeriod,

  ChartOfAccounts,              // KTOPL

  @ObjectModel.text.element: ['PlantName']
  Plant,                        // WERKS
  PlantName,

  @ObjectModel.text.element: ['CustomerName']
  Customer,                     // KUNNR
  CustomerName,

  @ObjectModel.sapObjectNodeTypeReference:'ControllingDebitCreditCode'
  ControllingDebitCreditCode,   // CO_BELKZ

  ProjectExternalID,

  @ObjectModel.text.element: ['ProjectDescription']
  Project,                      // PS_PSPID
  @Semantics.text: true
  ProjectDescription,

  WBSElementExternalID,
  
  @ObjectModel.text.element: ['WBSElementDescription']
  WBSElement,                   // PS_POSID
  @Semantics.text: true
  WBSElementDescription,

  @ObjectModel.text.element: ['PartnerCompanyCodeName']
  PartnerCompanyCode,           // PBUKRS
  PartnerCompanyCodeName,

  @ObjectModel.text.element: ['CostCtrActivityTypeName']
  CostCtrActivityType,          // LSTAR
  CostCtrActivityTypeName,

  OrderID,                      // AUFNR

  PartnerOrder_2 as PartnerOrder, // PAUFNR

  @ObjectModel.text.element: ['PartnerCostCtrActivityTypeName']
  PartnerCostCtrActivityType,   // PLSTAR
  PartnerCostCtrActivityTypeName,

  @ObjectModel.text.element: ['PartnerProjectDescription']
  PartnerProject,               // PPS_PSPID
  PartnerProjectDescription,

  @ObjectModel.text.element: ['PartnerWBSElementDescription']
  PartnerWBSElement,            // PPS_POSID
  @Semantics.text: true
  PartnerWBSElementDescription,

  @ObjectModel.text.element: ['SalesOrganizationName']
  SalesOrganization,            // VKORG
  SalesOrganizationName,

  @ObjectModel.text.element: ['DistributionChannelName']
  DistributionChannel,          // VTWEG
  DistributionChannelName,

  @ObjectModel.text.element: ['DivisionName']
  OrganizationDivision,         // SPART
  DivisionName,

  @ObjectModel.text.element: ['ProductName']
  Product,
  ProductName,

  @ObjectModel.text.element: ['SoldMaterialName']
  SoldMaterial,                 // MATNR_COPA
  SoldMaterialName,

  @ObjectModel.text.element: ['MaterialGroupName']
  MaterialGroup,                // MATKL
  MaterialGroupName,

  @ObjectModel.sapObjectNodeTypeReference:'CustomerGroup'
  @ObjectModel.text.element: ['CustomerGroupName']
  CustomerGroup,                // KDGRP
  CustomerGroupName,

  @ObjectModel.sapObjectNodeTypeReference:'Country'
  @ObjectModel.text.element: ['CustomerSupplierCountryName']
  CustomerSupplierCountry,      // LAND1
  CustomerSupplierCountryName,

  @ObjectModel.sapObjectNodeTypeReference:'CustomerSupplierIndustry'
  @ObjectModel.text.element: ['CustomerSupplierIndustryName']
  CustomerSupplierIndustry,     // BRSCH
  CustomerSupplierIndustryName,

  @ObjectModel.text.element: ['SalesDistrictName']
  SalesDistrict,                // BZIRK
  SalesDistrictName,

  FinancialManagementArea,
  Fund,
  GrantID,
  BudgetPeriod,

  SponsoredProgram,
  SponsoredClass,
  GteeMBudgetValidityNumber,

  I_JournalEntryItemCube.JointVenture,
  I_JournalEntryItemCube.JointVentureEquityGroup,
  I_JournalEntryItemCube.JointVentureCostRecoveryCode,
  I_JournalEntryItemCube.JointVenturePartner,
  I_JournalEntryItemCube.JointVentureBillingType,
  I_JournalEntryItemCube.JointVentureEquityType,
  I_JournalEntryItemCube.JointVentureProductionDate,
  I_JournalEntryItemCube.JointVentureBillingDate,
  I_JournalEntryItemCube.JointVentureOperationalDate,
  I_JournalEntryItemCube.CutbackRun,
  I_JournalEntryItemCube.JointVentureAccountingActivity,
  I_JournalEntryItemCube.PartnerVenture,
  I_JournalEntryItemCube.PartnerEquityGroup,
  I_JournalEntryItemCube.SenderCostRecoveryCode,
  I_JournalEntryItemCube.CutbackAccount,
  I_JournalEntryItemCube.CutbackCostObject,

  REBusinessEntity,
  RealEstateBuilding,
  RealEstateProperty,
  RERentalObject,
  RealEstateContract,
  REServiceChargeKey,
  RESettlementUnitID,
  SettlementReferenceDate,

  _CompanyCode,
  _CurrentProfitCenter,
  _CurrentCostCenter,
  _GLAccountInChartOfAccounts
}