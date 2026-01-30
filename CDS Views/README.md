# 📂 SAP ABAP CDS Views

Este diretório contém as **Core Data Services (CDS) Views** desenvolvidas para relatórios analíticos e operacionais. As views estão estruturadas para suportar análises financeiras (Balanço, DRE, Fluxo de Caixa) e gestão de estoques/custos.

## 🏗️ Estrutura de Naming Convention

O projeto segue a convenção de nomenclatura padrão VDM (Virtual Data Model):

* **`ZI_` (Interface Views):** Views de base/compostas que acessam tabelas standard (ACDOCA, MARA, BSEG, etc.) e realizam as primeiras transformações.
* **`ZC_` (Consumption Views):** Views de consumo final, prontas para serem consumidas por **SAP Analytics Cloud (SAC)**, **Fiori** ou **Analysis for Office**. Geralmente possuem anotações de `@Analytics.query: true`.

---

## 📊 Catálogo de Views

### 💰 Finanças & Contabilidade (FI/CO)

Views focadas na demonstração contábil e gestão de fluxo financeiro.

| Interface View (Base) | Consumption View (Final) | Descrição Funcional |
| :--- | :--- | :--- |
| `ZI_Balanco_Patrimonial` | `ZC_Balanco_Patrimonial` | Estrutura hierárquica do Balanço Patrimonial (Ativo/Passivo). |
| `ZI_Fluxo_Caixa` | `ZC_Fluxo_Caixa` | Demonstração do Fluxo de Caixa (Método Direto/Indireto). |
| `ZI_Contas_Pagar` | `ZC_Contas_Pagar` | Posição de contas a pagar (Fornecedores), aging list. |
| `ZI_Contas_Receber` | `ZC_Contas_Receber` | Posição de contas a receber (Clientes), aging list. |
| `ZI_Imobilizado` | `ZC_Imobilizado` | Gestão de Ativo Fixo (Aquisições, Depreciação, Baixas). |
| `ZI_Impostos_FlowCB` | `ZC_Impostos` | Análise fiscal e fluxo de impostos. |
| `ZI_GLAccountBalanceFlow`| *N/A* | View auxiliar de fluxo de saldos de contas do Razão. |

### 📦 Materiais & Custos (MM/CO-PC)

Views voltadas para valorização de estoque e controle de materiais.

| Interface View (Base) | Consumption View (Final) | Descrição Funcional |
| :--- | :--- | :--- |
| `ZI_Custo_Material_STK` | `ZC_Custo_Material_STK` | Valorização do estoque atual e histórico de custos. |
| `ZI_Custo_Mat_Base` | *Uso Interno* | Base de cálculo para composição do custo unitário. |
| `ZI_Material_Bop` | `ZC_Material_Bop` | Relatórios de Backorder Processing ou Balanço de Materiais. |

---

## 🛠️ Requisitos Técnicos

* **Linguagem:** ABAP CDS (Core Data Services)
* **Compatibilidade:** S/4HANA
* **Front-end Sugerido:** SAP Analytics Cloud (SAC) ou Power BI (via conector SAP BW).

## 🚀 Como Implementar

1.  Clone este repositório.
2.  No **Eclipse ADT** (ABAP Development Tools), crie as views na ordem de dependência:
    1.  Primeiro as `ZI_` (Interface Views).
    2.  Depois as `ZC_` (Consumption Views).
3.  Ative os objetos no servidor de aplicação.