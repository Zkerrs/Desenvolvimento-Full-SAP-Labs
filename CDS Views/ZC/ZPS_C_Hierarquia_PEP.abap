@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Dimensão: Hierarquia Elemento PEP'
@Metadata.ignorePropagatedAnnotations: true

@VDM.viewType: #CONSUMPTION
@Analytics.dataCategory: #DIMENSION 
@OData.publish: true

define view entity ZPS_C_HIERARQUIA_PEP
  as select from ZPS_I_GETHIERARQUIACDS
{
  key Projeto,
  key ElementoPepFilho,
      
      NivelPepFilho,
      DescricaoPepFilho,
      
      ElementoPepPai,
      NivelPepPai,
      DescricaoPepPai
}
