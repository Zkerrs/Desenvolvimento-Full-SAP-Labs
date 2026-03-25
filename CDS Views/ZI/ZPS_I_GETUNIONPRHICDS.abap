@AbapCatalog.sqlViewName: 'ZVPRHIUNI'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Busca valores UNION PRHI'
@Metadata.ignorePropagatedAnnotations: true
define view ZPS_I_GETUNIONPRHICDS
  as select from ZPS_I_GETPRHICDS
{
  pepFilho,
  pepPai
}

union all

select from  ZPS_I_GETPRHICDS as a
  inner join prhi             as p on a.pepPai = p.posnr
{
  pepFilho,
  pepPai
}

where
      p.up is not null
  and p.up <> '00000000'
