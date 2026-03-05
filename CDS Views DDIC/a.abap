@AbapCatalog.sqlViewName: 'ZIGLABLFLOWDDIC'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Fluxo Contábil'
@Metadata.ignorePropagatedAnnotations: true

@VDM.viewType: #COMPOSITE     
@Analytics.dataCategory: #CUBE 
@OData.publish: true

define view ZI_GLAccountBalanceFlow_DDIC
  as select from acdoca

    -- SKAT: Textos da Conta do Razão
    left outer join skat  on  acdoca.ktopl = skat.ktopl
                          and acdoca.racct = skat.saknr
                          and skat.spras   = $session.system_language

    -- SKA1: Mestre da Conta do Razão (Plano de Contas)
    left outer join ska1  on  acdoca.ktopl = ska1.ktopl
                          and acdoca.racct = ska1.saknr

    -- CSKT: Textos de Centro de Custo
    left outer join cskt  on  acdoca.kokrs = cskt.kokrs
                          and acdoca.rcntr = cskt.kostl
                          and cskt.spras   = $session.system_language
                          and cskt.datbi   >= '99991231'

    -- CEPCT: Textos de Centro de Lucro
    left outer join cepct on  acdoca.kokrs = cepct.kokrs
                          and acdoca.prctr = cepct.prctr
                          and cepct.spras  = $session.system_language
                          and cepct.datbi  >= '99991231'

    -- KNA1 e LFA1: Clientes e Fornecedores
    left outer join kna1  on  acdoca.kunnr = kna1.kunnr
    left outer join lfa1  on  acdoca.lifnr = lfa1.lifnr

    -- ANKT: Textos do Imobilizado
    left outer join ankt  on  acdoca.bukrs = ankt.bukrs
                          and acdoca.anln1 = ankt.anln1
                          and acdoca.anln2 = ankt.anln2
                          and ankt.spras   = $session.system_language

    -- MAKT: Textos de Material
    left outer join makt  on  acdoca.matnr = makt.matnr
                          and makt.spras   = $session.system_language

    -- T001W: Centro
    left outer join t001w on  acdoca.werks = t001w.werks

    -- PRPS: Elemento PEP (WBS)
    left outer join prps  on  acdoca.ps_psp_pnr = prps.pspnr

{
  key acdoca.bukrs,
  key acdoca.rldnr,         -- Ledger
  key acdoca.belnr,
  key acdoca.docln,         -- LedgerGLLineItem
  key acdoca.gjahr,

      acdoca.gkont,         -- OffsettingAccount
      acdoca.gkoar,         -- OffsettingAccountType

      acdoca.poper,         -- FiscalPeriod
      acdoca.ktopl,         -- ChartOfAccounts
      acdoca.racct,         -- GLAccount
      skat.txt20            as txt20_gl,       -- Nome da Conta (Alias necessário)

      ska1.glaccount_type,
      ska1.ktoks,           -- AccountGroup

      acdoca.koart,         -- AccountType (Ativo 'A', Material 'M', Fornecedor 'K')

      acdoca.kokrs,         -- ControllingArea
      acdoca.rcntr,         -- CostCenter
      cskt.ktext            as ktext_cc,       -- Nome Centro Custo
      acdoca.prctr,         -- ProfitCenter
      cepct.ktext           as ktext_pc,       -- Nome Centro Lucro
      acdoca.rfarea,        -- FunctionalArea
      acdoca.rbusa,         -- BusinessArea
      acdoca.segment,

      acdoca.kunnr,
      kna1.name1            as name1_kna1,     -- Nome Cliente
      acdoca.lifnr,
      lfa1.name1            as name1_lfa1,     -- Nome Fornecedor

      acdoca.anln1,         -- MasterFixedAsset
      acdoca.anln2,         -- FixedAssetSub
      ankt.txa50,           -- AssetName
      acdoca.bwasl,         -- AssetTrxType

      acdoca.budat,         -- PostingDate
      acdoca.bldat,         -- DocumentDate
      acdoca.netdt,         -- NetDueDate
      acdoca.augdt,         -- ClearingDate
      acdoca.cpudt,         -- CreationDate

      acdoca.blart,         -- DocumentType
      acdoca.sgtxt,         -- ItemText
      acdoca.zuonr,         -- Assignment
      acdoca.awref,         -- ReferenceID (XBLNR/NF)
      acdoca.awtyp,         -- RefDocType
      acdoca.augbl,         -- ClearingDoc

      acdoca.matnr,         -- Product
      makt.maktx,           -- MaterialName
      acdoca.werks,         -- Plant
      t001w.name1           as name1_werks,    -- Nome do Centro
      acdoca.vbeln,         -- SoldProduct (Sales Doc)

      acdoca.ps_psp_pnr,    -- WBSElement (ID interno)
      prps.posid,           -- WBSShortID (ID visível)
      prps.post1,           -- WBSDescription
      
      acdoca.hbkid,         -- HouseBank
      acdoca.hktid,         -- HouseBankAccount

      acdoca.drcrk,         -- DebitCreditCode

      acdoca.rhcur,         -- Currency da Empresa (Company Code Currency)

      @Semantics.amount.currencyCode: 'rhcur'
      @DefaultAggregation: #SUM
      acdoca.hsl,           -- AmountInCompanyCodeCurrency

      acdoca.ruom,          -- BaseUnit

      @Semantics.quantity.unitOfMeasure: 'ruom'
      @DefaultAggregation: #SUM
      acdoca.msl            -- Quantity
}