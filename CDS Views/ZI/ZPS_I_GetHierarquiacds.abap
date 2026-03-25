@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Busca Hierarquia Elemento PEP'
@Metadata.ignorePropagatedAnnotations: true
define view entity ZPS_I_GETHIERARQUIACDS
  as select from ZPS_I_GETUNIONPRHICDS as a
    inner join   prps                  as filho   on a.pepFilho = filho.pspnr
    inner join   prps                  as pai     on a.pepPai = pai.pspnr
    inner join   proj                  as projeto on filho.psphi = projeto.pspnr
{
  projeto.pspid                        as Projeto,
  cast(filho.posid as abap.char(100))  as ElementoPepFilho,
  cast(filho.stufe as abap.int1(3) )   as NivelPepFilho,
  filho.post1                          as DescricaoPepFilho,
  cast( pai.posid  as  abap.char(100)) as ElementoPepPai,
  cast(pai.stufe   as abap.int1(3) )   as NivelPepPai,
  pai.post1                            as DescricaoPepPai
}
