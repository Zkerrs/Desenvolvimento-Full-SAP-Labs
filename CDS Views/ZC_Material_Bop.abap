@AbapCatalog.sqlViewName: 'ZCMATBOP'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Analítico BOP e Custo Material'
@Metadata.ignorePropagatedAnnotations: true

@VDM.viewType: #CONSUMPTION
@Analytics.query: true
@OData.publish: true

define view ZC_Material_Bop
  as select from ZI_Material_Bop
{
    key CompanyCode,
    key Ledger,
    key FiscalYear,
    key AccountingDocument,
    key LedgerLineItem,

    @EndUserText.label: 'Material'
    Material,
    @EndUserText.label: 'Descrição do Material'
    MaterialName,
    @EndUserText.label: 'Tipo de Material'
    TipoMaterial,
    
    @EndUserText.label: 'Planta'
    Plant,

    @EndUserText.label: 'Fornecedor'
    Supplier,
    
    @EndUserText.label: 'Nome do Fornecedor'
    SupplierName,

    @EndUserText.label: 'Conta do Razão'
    ContaContabil,
    
    @EndUserText.label: 'Nome C/Razão'
    GLAccountName,
    
    @EndUserText.label: 'Centro de Custo'
    CentroCusto,
    
    @EndUserText.label: 'Nome do Centro de Custo'
    CostCenterName,
    
    @EndUserText.label: 'Centro de Lucro'
    CentroLucro,
 
    @EndUserText.label: 'Nome do Centro de Lucro'
    ProfitCenterName,

    @EndUserText.label: 'Data de Lançamento'
    DataLancamento,

    @EndUserText.label: 'Mês Fiscal'
    FiscalPeriod,

    @EndUserText.label: 'Tipo de Preço'
    TipoPreco,

    @EndUserText.label: 'Moeda'
    CompanyCodeCurrency,

    @DefaultAggregation: #SUM
    @EndUserText.label: 'Valor Total (Saldo)'
    AmountValue,

    @DefaultAggregation: #SUM
    @EndUserText.label: 'Valor Entrada (Compras)'
    ValorEntrada_Compras,

    @DefaultAggregation: #SUM
    @EndUserText.label: 'Valor Saída (Consumo)'
    ValorSaida_Consumo,

    @EndUserText.label: 'Unidade'
    BaseUnit,

    @DefaultAggregation: #SUM
    @EndUserText.label: 'Quantidade (Saldo)'
    QuantidadeTotal
}
