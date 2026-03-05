@AbapCatalog.sqlViewAppendName: 'ZXIOPDOCZUM'
@EndUserText.label: 'Extensão para incluir ZUMSK'

extend view I_OperationalAcctgDocItem with ZX_OPERDOCITEM_ZUMSK
{
  P_BSEG_COM.zumsk as ZUMSK
}
