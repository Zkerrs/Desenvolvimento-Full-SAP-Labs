@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Relatório de Fluxo de Caixa (Header)'
@Metadata.ignorePropagatedAnnotations: true

@VDM.viewType: #CONSUMPTION
@Analytics.dataCategory: #CUBE
@OData.publish: true

define view entity ZPS_C_FLUXOCAIXA_HDR
  as select from ZPS_I_GETFLUXOCAIXAHEADERCDS
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
      ValorRealizado
}
