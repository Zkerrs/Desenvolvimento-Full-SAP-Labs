@AbapCatalog.sqlViewName: 'ZCSQL_MVI_DEV_CP'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Analytics Contas a Pagar'
@Metadata.ignorePropagatedAnnotations: true

@VDM.viewType: #CONSUMPTION  
@Analytics.query: true       
@OData.publish: true

define view ZC_Contas_Pagar
  as select from ZI_Contas_Pagar
{
  key CompanyCode,
  key DocumentNumber,
  key DocumentItem,
  key FiscalYear,
  key Supplier,
  key GLAccount,

      @EndUserText.label: 'Mandante'
      MandanteCod,

      Branch,
      CompanyName,
      VendorName,
      DocType,
      PostingDate,
      DocumentDate,
      DueDate,
      DocumentText,
      ClearingDocument,
      ClearingDate,
      CostCenter,
      CNPJ,
      TipoDespesa,
      DocEstorno,
      DocumentStatus,
      DebitCredit,
      PostingKey,
      Currency,

      @EndUserText.label: 'C/Contrapartida (GKONT)'
      @AnalyticsDetails.query.display: #KEY
      GKONT,

      @EndUserText.label: 'Tp. C/Contrapartida (GKOAR)'
      @AnalyticsDetails.query.display: #KEY
      GKOAR,

      @DefaultAggregation: #SUM
      AmountLocalCurrency,

      @DefaultAggregation: #SUM
      AmountDocumentCurrency,

      @DefaultAggregation: #SUM
      @EndUserText.label: 'Total em Aberto'
      ValorTotalAberto,

      @DefaultAggregation: #SUM
      @EndUserText.label: 'Total Compensado'
      ValorTotalCompensado

}
