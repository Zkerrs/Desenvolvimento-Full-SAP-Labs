@AbapCatalog.sqlViewName: 'ZSQL_MVI_DEV_FXC'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Fluxo de Caixa Previsto'
@Metadata.ignorePropagatedAnnotations: true
@Analytics.dataCategory: #CUBE

define view ZCDS_MVISOUZA_DEV_FXC
  as select from I_OperationalAcctgDocItem as bseg
  
    // T001: Nome da Empresa
    left outer join t001 on bseg.CompanyCode = t001.bukrs

{
  key bseg.CompanyCode,
  key bseg.AccountingDocument                                  as DocumentNumber,
  key bseg.AccountingDocumentItem                              as DocumentItem,
  key bseg.FiscalYear,

      // Dimensões
      t001.butxt                                               as CompanyName,
      bseg.FinancialAccountType                                as AccountType, -- D=Cliente, K=Fornecedor
      
      // Datas Importantes
      cast(bseg.PostingDate as abap.sstring( 8 ))              as PostingDate,
      cast(bseg.NetDueDate as abap.sstring( 8 ))               as ForecastDate,

      // Classificação do Fluxo
      case bseg.FinancialAccountType
        when 'D' then 'Recebimento (Cliente)'
        when 'K' then 'Pagamento (Fornecedor)'
        else          'Outros'
      end                                                      as FlowCategory,

      case bseg.FinancialAccountType
        when 'D' then 'IN'  
        when 'K' then 'OUT' 
        else          'N/A'
      end                                                      as FlowDirection,

      // Cálculos de Valores
      @DefaultAggregation: #SUM
      cast(bseg.AmountInCompanyCodeCurrency as abap.dec(16,2)) as Amount,
      
      bseg.CompanyCodeCurrency                                 as Currency,
      
      // Status (Aberto ou Compensado)
      case 
        when bseg.ClearingJournalEntry <> '' then 'Realizado' 
        else 'Previsto'                                     
      end as CashFlowStatus

}
where
  bseg.FinancialAccountType = 'D' or bseg.FinancialAccountType = 'K'
  
  
  
