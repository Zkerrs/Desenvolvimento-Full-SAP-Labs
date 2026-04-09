@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'CDS Busca Valor Realizado'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity ZPS_I_GETVALORREALIZADOCDS
  as select from bseg
    inner join   ZPS_TF_VALORREALIZADOCDS( p_clnt: $session.client  ) as tf on  bseg.belnr = tf.belnr
                                                                            and bseg.gjahr = tf.gjahr
                                                                            and bseg.buzei = tf.buzei
{

  key   tf.belnr                                     as Documento,
  key   tf.gjahr                                     as Ano,
        tf.buzei                                     as item,
        tf.augdt                                     as Data,
        cast( tf.dmbtr_realizado as abap.dec(23, 2)) as ValorRealizado,
        tf.projk                                     as ElementoPep,
        tf.ebeln                                     as PedidoCompra,
        tf.ebelp                                     as ItemPedidoCompra,
        tf.matnr                                     as Material,
        tf.maktg                                     as DescriMaterial,
        tf.lifnr                                     as Fornecedor,
        tf.name1                                     as DescriFornecedor,
        tf.sakto                                   as ContaContabil,
        tf.txt50                                     as DescriContaContabil,
        tf.nfnum                                     as NumeroNotafiscal,
        @EndUserText.label: 'Adiantamento'
        tf.adiantamento                              as Adiantamento

}


