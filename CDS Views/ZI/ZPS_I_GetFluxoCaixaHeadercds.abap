@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'CDS Busca dados HEADER do Fluxo de Caixa.'
@Metadata.ignorePropagatedAnnotations: true
define view entity ZPS_I_GETFLUXOCAIXAHEADERCDS
  as select from I_Project                  as proj
    inner join   I_WBSElement               as prps on proj.ProjectInternalID = prps.ProjectInternalID
    inner join   ZPS_I_GETFLUXOCAIXAITEMCDS as item on  proj.ProjectWithCodingMask    = item.Projeto
                                                    and proj.ProjectDescription       = item.DescricaoProjeto
                                                    and prps.WBSElementWithCodingMask = item.ElementoPep
                                                    and prps.WBSDescription           = item.DescricaoElementoPep

{
  key  item.Projeto,
  key  item.DescricaoProjeto,
  key  item.ElementoPep,
  key  item.DescricaoElementoPep,
  key  item.Versao,
  key  item.ContaContabil,
  key  item.Competencia,
       sum(item.ValorPrevisto)  as ValorPrevisto,
       sum(item.ValorRealizado) as ValorRealizado
}

group by
  item.Projeto,
  item.DescricaoProjeto,
  item.ElementoPep,
  item.DescricaoElementoPep,
  item.Versao,
  item.ContaContabil,
  item.Competencia
