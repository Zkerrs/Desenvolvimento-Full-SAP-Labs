@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Hierarquia PEP ajustada para SAC'
@Metadata.ignorePropagatedAnnotations: true

define view entity ZPS_I_HIER_PEP_SAC 
  as select from prhi as hierarquia
    inner join prps as filho on hierarquia.posnr = filho.pspnr
    left outer join prps as pai on hierarquia.up = pai.pspnr
{
    key filho.psphi as ProjetoID,
    
    -- usando o POSID_EDIT para trazer os pontos e hifens
    key cast(filho.posid_edit as abap.char(100)) as ElementoPepFilho,
        filho.post1                              as DescricaoPepFilho,
        cast(filho.stufe as abap.int1(3))        as NivelPepFilho,
        
        case 
          when pai.posid_edit is null or pai.posid_edit = filho.posid_edit 
          then cast('' as abap.char(100))
          else cast(pai.posid_edit as abap.char(100))
        end as ElementoPepPai,
        
        cast(pai.stufe as abap.int1(3))          as NivelPepPai,
        pai.post1                                as DescricaoPepPai
}
