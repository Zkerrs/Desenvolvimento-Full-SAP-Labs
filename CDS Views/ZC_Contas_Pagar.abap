@AbapCatalog.sqlViewName: 'ZCSQL_MVI_DEV_CP'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Consumo Analítico do Contas a Pagar'
@Metadata.ignorePropagatedAnnotations: true

@VDM.viewType: #CONSUMPTION  
@Analytics.query: true       
@OData.publish: true

define view ZC_Contas_Pagar
  as select from ZI_Contas_Pagar
{
      @EndUserText.label: 'Empresa'
  key CompanyCode,
  
      @EndUserText.label: 'Nº Documento'
  key DocumentNumber,
  
      @EndUserText.label: 'Item do Documento'
  key DocumentItem,
  
      @EndUserText.label: 'Exercício'
  key FiscalYear,
  
      @EndUserText.label: 'Fornecedor'
  key Supplier,
  
      @EndUserText.label: 'Conta Razão'
  key GLAccount,

      @EndUserText.label: 'Mandante'
      MandanteCod,

      @EndUserText.label: 'Filial'
      Branch,
      
      @EndUserText.label: 'Nome da Empresa'
      CompanyName,
      
      @EndUserText.label: 'Nome do Fornecedor'
      VendorName,
      
      @EndUserText.label: 'Tipo de Documento'
      DocType,
      
      @EndUserText.label: 'Data de Lançamento'
      PostingDate,
      
      @EndUserText.label: 'Data do Documento'
      DocumentDate,
      
      @EndUserText.label: 'Data de Vencimento'
      DueDate,
      
      @EndUserText.label: 'Período Fiscal'
      FiscalPeriod,
      
      @EndUserText.label: 'Texto do Documento'
      DocumentText,
      
      @EndUserText.label: 'Doc. Compensação'
      ClearingDocument,
      
      @EndUserText.label: 'Data de Compensação'
      ClearingDate,
      
      @EndUserText.label: 'Centro de Custo'
      CostCenter,
      
      @EndUserText.label: 'CNPJ'
      CNPJ,
      
      @EndUserText.label: 'Tipo de Despesa'
      TipoDespesa,
      
      @EndUserText.label: 'Doc. Estorno'
      DocEstorno,
      
      @EndUserText.label: 'Status do Documento'
      DocumentStatus,
      
      @EndUserText.label: 'Débito/Crédito'
      DebitCredit,
      
      @EndUserText.label: 'Chave de Lançamento'
      PostingKey,
      
      @EndUserText.label: 'Cód. Razão Especial'
      UMSKZ,
      
      @EndUserText.label: 'Tipo Razão Especial'
      UMSKS,
      
      @EndUserText.label: 'Destino Razão Especial'
      ZUMSK,
      
      @EndUserText.label: 'Moeda'
      Currency,

      @EndUserText.label: 'C/Contrapartida (GKONT)'
      @AnalyticsDetails.query.display: #KEY
      GKONT,

      @EndUserText.label: 'Tp. C/Contrapartida (GKOAR)'
      @AnalyticsDetails.query.display: #KEY
      GKOAR,

      @EndUserText.label: 'Montante Moeda Local'
      @DefaultAggregation: #SUM
      AmountLocalCurrency,

      @EndUserText.label: 'Montante Moeda Doc.'
      @DefaultAggregation: #SUM
      AmountDocumentCurrency,

      @DefaultAggregation: #SUM
      @EndUserText.label: 'Total em Aberto'
      ValorTotalAberto,

      @DefaultAggregation: #SUM
      @EndUserText.label: 'Total Compensado'
      ValorTotalCompensado
}

