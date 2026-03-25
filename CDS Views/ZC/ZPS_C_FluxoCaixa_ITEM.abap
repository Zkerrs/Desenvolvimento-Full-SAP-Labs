@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Relatório Fluxo de Caixa (Itens)'
@Metadata.ignorePropagatedAnnotations: true

@VDM.viewType: #CONSUMPTION
@Analytics.dataCategory: #CUBE
@OData.publish: true

define view entity ZPS_C_FLUXOCAIXA_ITEM
  as select from ZPS_I_GETFLUXOCAIXAITEMCDS
{
  key Projeto,
  key DescricaoProjeto,
  key ElementoPep,
  key DescricaoElementoPep,
  key Versao,
  key ContaContabil,
  key Competencia,
      
      @DefaultAggregation: #SUM
      ValorPrevisto,

      @DefaultAggregation: #SUM
      ValorRealizado,

      DocumentoRealizado,
      AnoRealizado,
      ItemRealizado,
      DataRealizado,
      PedidoCompra,
      ItemPedidoCompra,
      Material,
      DescriMaterial,
      Fornecedor,
      DescriFornecedor,
      ContaContabilRealizado,
      DescriContaContabil,
      NumeroNotafiscal,
      Adiantamento
}
