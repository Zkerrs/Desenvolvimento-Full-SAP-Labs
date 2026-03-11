@AbapCatalog.sqlViewName: 'ZICNTRECDDIC'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Relatório Contas a Receber'
@Metadata.ignorePropagatedAnnotations: true

@VDM.viewType: #COMPOSITE
@Analytics.dataCategory: #CUBE
@OData.publish: true

define view ZI_Contas_Receber_DDIC
  as select from bseg

  -- BKPF: Documento para datas e tipo
  association [1..1] to bkpf       on  bseg.bukrs = bkpf.bukrs
                                   and bseg.belnr = bkpf.belnr
                                   and bseg.gjahr = bkpf.gjahr

  -- T001: Empresa
  association [0..1] to t001       on  bseg.bukrs = t001.bukrs

  -- KNA1: Cliente
  association [0..1] to kna1       on  bseg.kunnr = kna1.kunnr

  -- T003T: Textos do Tipo de Documento
  association [0..1] to t003t      on  bkpf.blart = t003t.blart
                                   and t003t.spras = $session.system_language

  -- J_1BBRANCH: Filial
  association [0..1] to j_1bbranch on  bseg.bukrs = j_1bbranch.bukrs
                                   and bseg.bupla = j_1bbranch.branch
{
  key bseg.bukrs,
  key bseg.belnr,
  key bseg.buzei,
  key bseg.gjahr,
  key bseg.kunnr,
  key bseg.hkont,

      bseg.gsber,
      t001.butxt,
      kna1.name1,
      bkpf.blart,
      bkpf.budat,
      bkpf.bldat,
      bseg.zfbdt,
      bkpf.monat,

      @Semantics.amount.currencyCode: 'waers'
      @DefaultAggregation: #SUM
      bseg.dmbtr,

      bseg.shkzg,

      @Semantics.amount.currencyCode: 'waers'
      @DefaultAggregation: #SUM
      cast(bseg.dmbtr as abap.dec(16,2)) as wrbtr_calc, -- Funções (CAST) ainda exigem o uso do "as"

      @Semantics.currencyCode: true
      t001.waers,

      bseg.bschl,
      bseg.umskz,
      bseg.umsks,
      bseg.zumsk,
      
      bseg.sgtxt,
      bseg.augbl,
      bseg.augdt,
      
      bseg.prctr,
      bseg.vbeln,
      bseg.gkont,
      bseg.gkoar,

      j_1bbranch.stcd1,
      t003t.ltext,
      bseg.rebzg,

      case
        when bseg.augbl is not initial then 'Compensado'
        else 'Aberto'
      end as status_doc,

      @Semantics.amount.currencyCode: 'waers'
      @DefaultAggregation: #SUM
      case
        when bseg.augbl is initial
        then cast(bseg.dmbtr as abap.dec(16,2))
        else cast(0 as abap.dec(16,2))
      end as valor_aberto,

      @Semantics.amount.currencyCode: 'waers'
      @DefaultAggregation: #SUM
      case
        when bseg.augbl is not initial
        then cast(bseg.dmbtr as abap.dec(16,2))
        else cast(0 as abap.dec(16,2))
      end as valor_compensado
}
where
      bseg.koart = 'D'
  and bseg.kunnr is not initial

