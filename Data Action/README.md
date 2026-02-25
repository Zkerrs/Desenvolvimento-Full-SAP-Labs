# 📂 SAP Analytics Cloud - Data Actions

> <sub>Este diretório serve como repositório central para os scripts de **Data Actions** (Advanced Formulas) desenvolvidos para o ambiente de **SAP Analytics Cloud (SAC)**.</sub>

## 🎯 Objetivo

> <sub>O objetivo desta pasta é versionar e documentar as regras de negócio utilizadas nos Modelos de Planejamento. Os scripts armazenados cobrem diferentes lógicas de cálculo, desde agregações e limpezas de dados até cálculos complexos em cascata.</sub>

## 📜 Scripts Disponíveis

> <sub>*Abaixo estão os códigos fontes de **Advanced Formulas** (Data Actions) mantidos neste repositório:*</sub>

* **`Script_Agregacao_Noh_Pai.cs`**: Realiza a agregação automática de valores dos níveis inferiores para os nós pais da hierarquia.
* **`Script_Calculo_Cascata.cs`**: Executa cálculos sequenciais onde o resultado de uma etapa serve de base para a próxima (ex: Receita -> Margem).
* **`Script_Indica_Valor.cs`**: Atribui valores ou indicadores específicos (flags) a determinadas contas para controle de regras de negócio.
* **`Script_Limpa Dados.cs`**: Rotina de limpeza (CLEAR) para zerar dados de versões ou períodos específicos antes de novos cálculos.
* **`Script_Replic_Val_Mes_Ant.cs`**: Copia os valores do mês anterior para o mês atual (rolling forecast) ou projeta dados históricos.
* **`Script_Saldo_Acumulado.cs`**: Calcula o saldo acumulado (Year to Date) somando os movimentos mensais ao saldo inicial.

---
<div align="center">
  <sub>SAP Analytics Cloud | Planning Models | Advanced Formulas</sub>
</div>
