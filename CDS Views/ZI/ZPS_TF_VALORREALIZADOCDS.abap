@EndUserText.label: 'Table Function Busca valores BSEG'
define table function ZPS_TF_VALORREALIZADOCDS
  with parameters
    @Environment.systemField: #CLIENT
    p_clnt : abap.clnt
returns
{
  mandt           : abap.clnt;
  belnr           : belnr_d;
  gjahr           : gjahr;
  buzei           : buzei;
  augdt           : augdt;
  dmbtr_realizado : dmbtr;
  projk           : ps_posnr;
  ebeln           : ebeln;
  ebelp           : ebelp;
  matnr           : matnr;
  lifnr           : lifnr;
  sakto           : saknr;
  adiantamento    : char1;
  txt50           : txt50;
  name1           : name1_gp;
  maktg           : maktx;
  nfnum           : j_1bnfnum9;
}
implemented by method
  zclps_valor_realizado=>get_realizado_rateio;