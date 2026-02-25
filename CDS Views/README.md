# 📂 SAP ABAP CDS Views

> <sub>Este diretório contém as **Core Data Services (CDS) Views** desenvolvidas para relatórios analíticos e operacionais. As views estão estruturadas para suportar análises financeiras (Balanço, DRE, Fluxo de Caixa) e gestão de estoques/custos.</sub>

## 🏗️ Estrutura

> <sub>O projeto segue a convenção de nomenclatura padrão VDM (Virtual Data Model):</sub>

* **`ZI_` (Interface Views):** Views de base/compostas que acessam tabelas standard (ACDOCA, MARA, BSEG, etc.) e realizam as primeiras transformações.
* **`ZC_` (Consumption Views):** Views de consumo final, prontas para serem consumidas por **SAP Analytics Cloud (SAC)**, **Fiori** ou **Analysis for Office**. Geralmente possuem anotações de `@Analytics.query: true`.

---

## 📊 Sobre as Views

### 💰 Finanças & Contabilidade (FI/CO)

> <sub>*Views focadas na demonstração contábil, gestão de fluxo financeiro e resultados.*</sub>

| Interface View (Base) | Consumption View (Final) | Descrição Funcional |
| :--- | :--- | :--- |
| `ZI_Balanco_Patrimonial` | `ZC_Balanco_Patrimonial` | Estrutura hierárquica do Balanço Patrimonial (Ativo/Passivo). |
| `ZI_DRE` | `ZC_DRE` | Demonstração do Resultado do Exercício (P&L/Lucros e Perdas). |
| `ZI_Fluxo_Caixa` | `ZC_Fluxo_Caixa` | Demonstração do Fluxo de Caixa (Método Direto/Indireto). |
| `ZI_Dividendos` | `ZC_Dividendos` | Cálculo e distribuição de dividendos aos acionistas. |
| `ZI_Royalties` | `ZC_Royalties` | Gestão e cálculo de pagamentos/recebimentos de Royalties. |
| `ZI_Contas_Pagar` | `ZC_Contas_Pagar` | Posição de contas a pagar (Fornecedores), aging list. |
| `ZI_Contas_Receber` | `ZC_Contas_Receber` | Posição de contas a receber (Clientes), aging list. |
| `ZI_Imobilizado` | `ZC_Imobilizado` | Gestão de Ativo Fixo (Aquisições, Depreciação, Baixas). |
| `ZI_Impostos_FlowCB` | `ZC_Impostos` | Análise fiscal e fluxo de impostos (FlowCB). |
| `ZI_GLAccountBalanceFlow`| *N/A* | View auxiliar de fluxo de saldos de contas do Razão. |

### 📦 Materiais & Custos (MM/CO-PC)

> <sub>*Views voltadas para valorização de estoque e controle de materiais.*</sub>

| Interface View (Base) | Consumption View (Final) | Descrição Funcional |
| :--- | :--- | :--- |
| `ZI_Custo_Material_STK` | `ZC_Custo_Material_STK` | Valorização do estoque atual e histórico de custos. |
| `ZI_Custo_Mat_Base` | *Uso Interno* | Base de cálculo para composição do custo unitário. |
| `ZI_Material_Bop` | `ZC_Material_Bop` | Relatórios de Backorder Processing ou Balanço de Materiais. |

### 🛒 Comercial & Vendas (SD)

> <sub>*Views para análise de precificação e operações de revenda.*</sub>

| Interface View (Base) | Consumption View (Final) | Descrição Funcional |
| :--- | :--- | :--- |
| `ZI_Preco_Venda` | `ZC_Preco_Venda` | Análise de composição e margem do preço de venda. |
| `ZI_Revenda` | `ZC_Revenda` | Gestão de operações e margens de revenda de mercadorias. |

---

## 🛠️ Ferramentas & Requisitos Técnicos

* 💻 **Linguagem:** ABAP CDS (Core Data Services).
* ⚙️ **Compatibilidade:** SAP S/4HANA.
* 🛠️ **IDE (Back-end):** Eclipse com ABAP Development Tools (ADT) para codificação e modelagem.
* 📈 **Front-end (Analytics):** SAP Analytics Cloud (SAC).

<br>

### 🖥️ Transações SAP GUI (T-Codes)

**⚙️ Administração & Dados**
> `SE16N` Navegador de tabelas • `SM12` Gestão de bloqueios • `DB02` Monitoramento do BD

**📦 Transportes**
> `SE09` Transport Organizer • `SE21` Package Builder • `SCC1N` Cópia de Request

**🔌 Integração OData**
> `/IWFND/MAINT_SERVICE` Ativação de serviços • `SICF` Manutenção da árvore HTTP

**📊 Analytics & Testes**
> `RSRT` Execução de relatórios • `RSRTS_ODP_DIS` Preview de TransientProvider

**🗂️ Configurações FI/CO**
> `OB58` Atualização T011 • `KAH1` Grupo de classes • `OKENN` Hierarquia standard

**💰 Análise Financeira**
> `F.01` Balanço/DRE • `FBL1N` Fornecedores • `FBL3N` Conta Razão • `FBL5N` Clientes • `FS10N` Saldos

**📈 Relatórios Standard**
> `S_ALR_87012284` / `S_ALR_87011990` e Série `870133*` (Balanço, Imob. e Custo/Lucro)

**🛒 Logística & Vendas**
> `VA03` Ordem de Venda • `AW01N` Asset Explorer • `CKM3N` Preço do material

---
<div align="center">
  <sub>SAP S/4HANA | ABAP Core Data Services | Virtual Data Model</sub>
</div>
