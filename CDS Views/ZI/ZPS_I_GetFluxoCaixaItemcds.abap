@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'CDS Busca dados nível item Fluxo de Caixa.'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity ZPS_I_GETFLUXOCAIXAITEMCDS
  as select from    I_Project                  as proj
    inner join      I_WBSElement               as prps      on proj.ProjectInternalID = prps.ProjectInternalID
    inner join      ZPS_I_GETCOSPCDS           as cosp      on prps.WBSElementObject = cosp.objnr
    left outer join ZPS_I_GETVALORREALIZADOCDS as realizado on  prps.WBSElementInternalID = realizado.ElementoPep
                                                            and cosp.Competencia          = concat(
      substring(
        realizado.Data, 5, 2
      ), concat(
        '.', substring(
          realizado.Data, 1, 4
        )
      )
    )

{
  key    cast(proj.ProjectWithCodingMask  as abap.char(100))     as Projeto,
  key    proj.ProjectDescription                                 as DescricaoProjeto,
  key    cast(prps.WBSElementWithCodingMask  as  abap.char(100)) as ElementoPep,       
  key    prps.WBSDescription                                     as DescricaoElementoPep,
  key    cosp.versao                                             as Versao,
  key    cosp.kstar                                              as ContaContabil,
  key    cosp.Competencia                                        as Competencia,
         cosp.ValorPrevisto                                      as ValorPrevisto,
         realizado.ValorRealizado                                as ValorRealizado,
         realizado.Documento                                     as DocumentoRealizado,
         realizado.Ano                                           as AnoRealizado,
         realizado.item                                          as ItemRealizado,
         realizado.Data                                          as DataRealizado,
         realizado.PedidoCompra                                  as PedidoCompra,
         realizado.ItemPedidoCompra                              as ItemPedidoCompra,
         realizado.Material                                      as Material,
         realizado.DescriMaterial                                as DescriMaterial,
         realizado.Fornecedor                                    as Fornecedor,
         realizado.DescriFornecedor                              as DescriFornecedor,
         realizado.ContaContabil                                 as ContaContabilRealizado,
         realizado.DescriContaContabil                           as DescriContaContabil,
         realizado.NumeroNotafiscal                              as NumeroNotafiscal,
         cast( realizado.Adiantamento   as abap.char(1)  )       as Adiantamento
}

union all

select distinct from I_Project                  as proj
  inner join         I_WBSElement               as prps      on proj.ProjectInternalID = prps.ProjectInternalID
  inner join         ZPS_I_GETVALORREALIZADOCDS as realizado on prps.WBSElementInternalID = realizado.ElementoPep
  inner join         ZPS_I_GETVALORPREVISTOCDS  as previsto  on  previsto.Projeto              =  proj.Project
                                                             and previsto.DescricaoProjeto     =  proj.ProjectDescription
                                                             and previsto.ElementoPep          =  prps.WBSElement
                                                             and previsto.DescricaoElementoPep =  prps.WBSDescription
                                                             and realizado.Documento           <> previsto.DocumentoRealizado

  inner join         bseg                       as bg        on  bg.projk   = prps.WBSElementInternalID
                                                             and bg.ebeln   = realizado.PedidoCompra
                                                             and bg.ebelp   = realizado.ItemPedidoCompra
                                                             and bg.h_blart = 'WE'
                                                             and bg.shkzg   = 'S'


{
  key    cast(proj.ProjectWithCodingMask  as abap.char(100))     as Projeto,
  key    proj.ProjectDescription                                 as DescricaoProjeto,
  key    cast(prps.WBSElementWithCodingMask  as  abap.char(100)) as ElementoPep,
  key    prps.WBSDescription                                     as DescricaoElementoPep,
  key    cast('000' as abap.char(3))                             as Versao,
  key    bg.hkont                                                as ContaContabil,
  key    concat(
    substring(
      realizado.Data, 5, 2
    ), concat(
      '.', substring(
        realizado.Data, 1, 4
      )
    )
  )                                                              as Competencia,
         cast('000' as abap.dec(23, 2))                          as ValorPrevisto,
         realizado.ValorRealizado                                as ValorRealizado,
         realizado.Documento                                     as DocumentoRealizado,
         realizado.Ano                                           as AnoRealizado,
         realizado.item                                          as ItemRealizado,
         realizado.Data                                          as DataRealizado,
         realizado.PedidoCompra                                  as PedidoCompra,
         realizado.ItemPedidoCompra                              as ItemPedidoCompra,
         realizado.Material                                      as Material,
         realizado.DescriMaterial                                as DescriMaterial,
         realizado.Fornecedor                                    as Fornecedor,
         realizado.DescriFornecedor                              as DescriFornecedor,
         realizado.ContaContabil                                 as ContaContabilRealizado,
         realizado.DescriContaContabil                           as DescriContaContabil,
         realizado.NumeroNotafiscal                              as NumeroNotafiscal,
         cast( realizado.Adiantamento  as abap.char(1))          as Adiantamento
}
