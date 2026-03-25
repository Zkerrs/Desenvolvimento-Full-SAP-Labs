@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Consumo Hierarquia PEP para SAC'
@Metadata.ignorePropagatedAnnotations: true

@OData.publish: true
@Analytics.dataCategory: #DIMENSION

define view entity ZPS_C_HIER_PEP_SAC 
  as select from ZPS_I_HIER_PEP_SAC
{
    key ProjetoID,
    
    @ObjectModel.text.element: ['DescricaoPepFilho']
    key ElementoPepFilho,
    
    DescricaoPepFilho,
    NivelPepFilho,
    ElementoPepPai,
    NivelPepPai,
    DescricaoPepPai
}
