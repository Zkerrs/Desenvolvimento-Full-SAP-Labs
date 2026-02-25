# 📂 SAP ABAP CDS Views

Este diretório contém as **Core Data Services (CDS) Views** desenvolvidas para relatórios analíticos e operacionais. As views estão estruturadas para suportar análises financeiras (Balanço, DRE, Fluxo de Caixa) e gestão de estoques/custos.

## 🏗️ Estrutura

O projeto segue a convenção de nomenclatura padrão VDM (Virtual Data Model):

* **`ZI_` (Interface Views):** Views de base/compostas que acessam tabelas standard (ACDOCA, MARA, BSEG, etc.) e realizam as primeiras transformações.
* **`ZC_` (Consumption Views):** Views de consumo final, prontas para serem consumidas por **SAP Analytics Cloud (SAC)**, **Fiori** ou **Analysis for Office**. Geralmente possuem anotações de `@Analytics.query: true`.

---

## 📊 Sobre as Views

### 💰 Finanças & Contabilidade (FI/CO)

Views focadas na demonstração contábil, gestão de fluxo financeiro e resultados.

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

Views voltadas para valorização de estoque e controle de materiais.

| Interface View (Base) | Consumption View (Final) | Descrição Funcional |
| :--- | :--- | :--- |
| `ZI_Custo_Material_STK` | `ZC_Custo_Material_STK` | Valorização do estoque atual e histórico de custos. |
| `ZI_Custo_Mat_Base` | *Uso Interno* | Base de cálculo para composição do custo unitário. |
| `ZI_Material_Bop` | `ZC_Material_Bop` | Relatórios de Backorder Processing ou Balanço de Materiais. |

### 🛒 Comercial & Vendas (SD)

Views para análise de precificação e operações de revenda.

| Interface View (Base) | Consumption View (Final) | Descrição Funcional |
| :--- | :--- | :--- |
| `ZI_Preco_Venda` | `ZC_Preco_Venda` | Análise de composição e margem do preço de venda. |
| `ZI_Revenda` | `ZC_Revenda` | Gestão de operações e margens de revenda de mercadorias. |

---

## 🛠️ Ferramentas & Requisitos Técnicos

### 💻 Core Stack
| Categoria | Tecnologia / Ambiente |
| :--- | :--- |
| **Linguagem** | ABAP CDS (Core Data Services) |
| **Compatibilidade** | SAP S/4HANA |
| **IDE (Back-end)** | Eclipse com ABAP Development Tools (ADT) para codificação. |
| **Front-end** | SAP Analytics Cloud (SAC) |

<br>

### 🖥️ Transações SAP GUI
| Área de Atuação | Transações | Aplicação Prática |
| :--- | :--- | :--- |
| **📦 Transportes & Pacotes** | `SE09`, `SE21`, `SCC1N` | Transport Organizer, Package Builder e Cópia de Request. |
| **📊 Testes & Analytics** | `RSRT`, `RSRTS_ODP_DIS` | Execução de relatórios e Preview de TransientProvider. |
| **🔌 Conectividade OData** | `/IWFND/MAINT_SERVICE`, `SICF` | Ativação de serviços e manutenção da árvore HTTP. |
| **🗂️ Configurações FI/CO** | `OB58`, `KAH1`, `OKENN` | Atualização T011, Grupo de classes e Hierarquia standard. |
| **💰 Análise Financeira** | `FBL1N`, `FBL3N`, `FBL5N`, `FS10N` | Partidas individuais (Fornecedores/Razão/Clientes) e Saldos. |
| **📦 Materiais & Ativos** | `AW01N`, `CKM3N` | Asset Explorer e Análise de preço do material. |

---
<div align="center">
  <sub>SAP S/4HANA | ABAP Core Data Services | Virtual Data Model</sub>
</div>
