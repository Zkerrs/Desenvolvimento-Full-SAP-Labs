@AbapCatalog.sqlViewName: 'ZVPRHI'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Busca valores PRHI'
@Metadata.ignorePropagatedAnnotations: true
define view ZPS_I_GETPRHICDS
  as select from prhi
{
  posnr as pepFilho,
  posnr as pepPai
}
