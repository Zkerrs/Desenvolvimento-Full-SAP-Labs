@AbapCatalog.sqlViewName: 'ZVCOSP'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Busca Valores da COSP'
@Metadata.ignorePropagatedAnnotations: true
define view ZPS_I_GETCOSPCDS
  as select from cosp
{
  key objnr                                          as objnr,
  key kstar                                          as kstar,
      versn                                          as versao,

      cast( concat( '01.', gjahr ) as abap.char(7) ) as Competencia,
      @Semantics.amount.currencyCode: 'Moeda'
      cast( wtg001  as abap.dec(23, 2))              as ValorPrevisto,
      twaer                                          as Moeda
}
where
      wrttp  = '01'
  and wtg001 is not initial

union all

select from cosp
{
  key objnr                                          as objnr,
  key kstar                                          as kstar,
      versn                                          as versao,
      cast( concat( '02.', gjahr ) as abap.char(7) ) as Competencia,
      @Semantics.amount.currencyCode: 'Moeda'
      cast( wtg002     as abap.dec(23, 2))           as ValorPrevisto,
      twaer                                          as Moeda
}
where
      wrttp  = '01'
  and wtg002 is not initial

union all

select from cosp
{
  key objnr                                          as objnr,
  key kstar                                          as kstar,
      versn                                          as versao,
      cast( concat( '03.', gjahr ) as abap.char(7) ) as Competencia,
      @Semantics.amount.currencyCode: 'Moeda'
      cast( wtg003     as abap.dec(23, 2))           as ValorPrevisto,
      twaer                                          as Moeda
}
where
      wrttp  = '01'
  and wtg003 is not initial

union all

select from cosp
{
  key objnr                                          as objnr,
  key kstar                                          as kstar,
      versn                                          as versao,
      cast( concat( '04.', gjahr ) as abap.char(7) ) as Competencia,
      @Semantics.amount.currencyCode: 'Moeda'
      cast( wtg004    as abap.dec(23, 2))            as ValorPrevisto,
      twaer                                          as Moeda
}
where
      wrttp  = '01'
  and wtg004 is not initial

union all

select from cosp
{
  key objnr                                          as objnr,
  key kstar                                          as kstar,
      versn                                          as versao,
      cast( concat( '05.', gjahr ) as abap.char(7) ) as Competencia,
      @Semantics.amount.currencyCode: 'Moeda'
      cast( wtg005    as abap.dec(23, 2))            as ValorPrevisto,
      twaer                                          as Moeda
}
where
      wrttp  = '01'
  and wtg005 is not initial

union all

select from cosp
{
  key objnr                                          as objnr,
  key kstar                                          as kstar,
      versn                                          as versao,
      cast( concat( '06.', gjahr ) as abap.char(7) ) as Competencia,
      @Semantics.amount.currencyCode: 'Moeda'
      cast( wtg006    as abap.dec(23, 2))            as ValorPrevisto,
      twaer                                          as Moeda
}
where
      wrttp  = '01'
  and wtg006 is not initial

union all

select from cosp
{
  key objnr                                          as objnr,
  key kstar                                          as kstar,
      versn                                          as versao,
      cast( concat( '07.', gjahr ) as abap.char(7) ) as Competencia,
      @Semantics.amount.currencyCode: 'Moeda'
      cast( wtg007    as abap.dec(23, 2))            as ValorPrevisto,
      twaer                                          as Moeda
}
where
      wrttp  = '01'
  and wtg007 is not initial

union all

select from cosp
{
  key objnr                                          as objnr,
  key kstar                                          as kstar,
      versn                                          as versao,
      cast( concat( '08.', gjahr ) as abap.char(7) ) as Competencia,
      @Semantics.amount.currencyCode: 'Moeda'
      cast( wtg008    as abap.dec(23, 2))            as ValorPrevisto,
      twaer                                          as Moeda
}
where
      wrttp  = '01'
  and wtg008 is not initial

union all

select from cosp
{
  key objnr                                          as objnr,
  key kstar                                          as kstar,
      versn                                          as versao,
      cast( concat( '09.', gjahr ) as abap.char(7) ) as Competencia,
      @Semantics.amount.currencyCode: 'Moeda'
      cast( wtg009    as abap.dec(23, 2))            as ValorPrevisto,
      twaer                                          as Moeda
}
where
      wrttp  = '01'
  and wtg009 is not initial

union all

select from cosp
{
  key objnr                                          as objnr,
  key kstar                                          as kstar,
      versn                                          as versao,
      cast( concat( '10.', gjahr ) as abap.char(7) ) as Competencia,
      @Semantics.amount.currencyCode: 'Moeda'
      cast( wtg010    as abap.dec(23, 2))            as ValorPrevisto,
      twaer                                          as Moeda
}
where
      wrttp  = '01'
  and wtg010 is not initial

union all

select from cosp
{
  key objnr                                          as objnr,
  key kstar                                          as kstar,
      versn                                          as versao,
      cast( concat( '11.', gjahr ) as abap.char(7) ) as Competencia,
      @Semantics.amount.currencyCode: 'Moeda'
      cast( wtg011    as abap.dec(23, 2))            as ValorPrevisto,
      twaer                                          as Moeda
}
where
      wrttp  = '01'
  and wtg011 is not initial

union all

select from cosp
{
  key objnr                                          as objnr,
  key kstar                                          as kstar,
      versn                                          as versao,
      cast( concat( '12.', gjahr ) as abap.char(7) ) as Competencia,
      @Semantics.amount.currencyCode: 'Moeda'
      cast( wtg012    as abap.dec(23, 2))            as ValorPrevisto,
      twaer                                          as Moeda
}
where
      wrttp  = '01'
  and wtg012 is not initial
