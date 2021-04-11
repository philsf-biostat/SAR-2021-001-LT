---
title: "Análise Estatística de ..."
author: '**De:** Felipe Figueiredo **Para:** ___'
date: '**Data: ** dd/mm/aaaa'
output:
  html_document:
    fig_caption: yes
    fig_height: 6
    fig_width: 6
    keep_md: yes
    number_sections: yes
    toc: yes
  word_document:
    fig_caption: yes
    fig_height: 6
    fig_width: 6
    reference_docx: misc/style.docx
    toc: yes
  pdf_document:
    number_sections: yes
    toc: yes
subtitle: 'REPORT: analise_dados_LT_2021-v01'
# toc-title: "Sumário"
---



---

**Document version**


|Version |Alterations     |
|:-------|:---------------|
|01      |Initial version |

---

<!-- # Signatures -->

<!-- ```{r, echo=FALSE} -->
<!-- sig.field <- "__________________________" -->
<!-- date.field <- "_____________" -->
<!-- Stat <- c("Elaborador", "Nome", "Função", sig.field, date.field) -->
<!-- Reviewer <- c("Revisado por", "", "", sig.field, date.field) -->
<!-- Approver <- c("Verificado por", "", "", sig.field, date.field) -->
<!-- Final.Approver <- c("Aprovação final", "", "", sig.field, date.field) -->

<!-- sigs <- rbind( -->
<!--   Stat -->
<!--   , Reviewer -->
<!--   , Approver -->
<!--   , Final.Approver -->
<!--   ) -->
<!-- rownames(sigs) <- NULL -->
<!-- colnames(sigs) <- c("Papel", "Nome", "Função", "Assinatura", "Data") -->

<!-- # pander(sigs, split.cells = c(9, 14, 14, 16, 8), split.table = Inf) -->
<!-- kable(sigs) -->
<!-- ``` -->

# Abbreviations

- PJI:
- SD: standard deviation
- SIRS: systemic inflammatory response
- TJA:

# Introduction

## Objectives

Perform a Kaplan-Meier survival analysis on the deaths caused by PJI after a TJA surgical procedure.
Additionally, explore possible risk factor for PJI mortality in bi-variate analyses.

## Data reception and cleaning

**Analytical data-set**

1. id
1. age; continuous
1. sex; binary
1. sirs; binary
1. joint; binary
1. surgery success; binary
1. surgery type; categorical
1. multi-germ infection; binary
1. complication; binary
1. time (date PJI diagnosis -- date last follow up)
1. event (death due to PJI)
1. death (all causes)

Obs: Complication Type was considered for analysis, but could not be safely converted to a categorical variable.
It was dropped.

# Methods



## Outcome and covariates

### Event and time definition

- event: death due to PJI
  - deaths due to other causes were censored
- time: between PJI diagnosis and event

The event of interest for this analysis is death caused by the PJI.
For the main analysis patients that died from other causes were censored.
The time to event was defined as the number of years between the diagnosis of PJI and the last follow up noted.

There were multiple outcomes to consider regarding the mortality in PJI patients.
These causes were categorized as being caused by PJI (event of interest), other causes of death and survival (censored).
This multi-state outcome was used to assess the competing risks of death under the PJI risk.
The follow up time of all participants was considered in the person-year at risk.

### Covariates

- sex; binary
- sirs; binary
- joint; binary
- surgery success; binary
- surgery type; categorical
- multi-germ infection; binary
- complication; binary

## Statistical analyses

- descriptive analysis of study population
- Kaplan-Meier estimates for 2-year survival
- bi-variate analyses of covariates with log-rank test
- significance alpha = 0.05

Demographic characteristics were described with mean (SD) or proportions, where appropriate.
Kaplan-Meier curves were computed for the at-risk study population for the event of interest.
For all covariates considered the 2-year survival rates were computed for the event of interest.
The all-cause mortality was assessed using the competing risks overall figure.
Bi-variate analyses were performed using the log-rank test for all covariates considered.
All statistical analyses considered the significance level of 5%.

### Statistical packages

This analysis was performed using statistical software `R` version 4.0.5.
Packages used for survival analyses were `survival` version 3.2.10 and `survminer` version 0.4.9.

# Results

## Study population and follow up

- n = 54, 239 person-years
- sex: males: 21 (39%), females: 33 (61%)
- age: min = 32, max = 88
  - mean 64.3 years (SD 11.6)
- follow up time: min = 4 days, max = 16.35 years

## Mortality

- mortality: 5 PJI + 5 Other
- no median time for deaths
  - deaths times: PJI 4 days -- 2.13 years
  - Other 2.37 years -- 13.17 years

![](../figures/death_all.png)
Fig 1: Mortality due to all causes.

![](../figures/death_PJI.png)
Fig 2: Mortality confirmed to be caused by PJI.

## 2-year survival rates


| Characteristic |  2-year survival  |   p   |
|:--------------:|:-----------------:|:-----:|
|    Overall     |  92% (85%, 100%)  |       |
|      sex       |                   | 0.275 |
|       F        |  93% (85%, 100%)  |       |
|       M        |  90% (79%, 100%)  |       |
|      sirs      |                   | 0.056 |
|       N        |  97% (92%, 100%)  |       |
|       Y        |  77% (57%, 100%)  |       |
|     joint      |                   | 0.703 |
|      Hip       |  92% (83%, 100%)  |       |
|      Knee      |  92% (82%, 100%)  |       |
|  surg.success  |                   | 0.060 |
|    Failure     |  84% (67%, 100%)  |       |
|    Success     | 100% (100%, 100%) |       |
|   surg.type    |                   | 0.002 |
|   Amputation   |     — (—, —)      |       |
|  Arthrodesis   | 100% (100%, 100%) |       |
| Exarticulation | 100% (100%, 100%) |       |
|  Girdlestone   |  67% (30%, 100%)  |       |
|     Spacer     |  50% (19%, 100%)  |       |
|      TJA       |  97% (93%, 100%)  |       |
|   multigerm    |                   | 0.938 |
|       N        |  92% (84%, 100%)  |       |
|       Y        |  92% (77%, 100%)  |       |
|  complication  |                   | 0.038 |
|       N        | 100% (100%, 100%) |       |
|       Y        |  82% (68%, 100%)  |       |

Table: **Table 1** Survival rates for 2-year.

# Exceptions and Observations

# Conclusions


# References

# Appendix

## Exploratory data analysis

<!-- ```{r fig3, fig.height=12, fig.width=8} -->
<!-- ggarrange(gg.sex$plot, gg.sirs$plot, gg.joint$plot, gg.stat.tja$plot, gg.outcome$plot, gg.comp$plot, labels = "AUTO", ncol = 2, nrow = 3) -->
<!-- ``` -->

![](../figures/sex.png)
Fig 3: Mortality by sex.

![](../figures/sirs.png)
Fig 4: Mortality by SIRS.

![](../figures/joint.png)
Fig 5: Mortality by joint.

![](../figures/surg_success.png)
Fig 6: mortality by status of the TJA.

![](../figures/surg_type.png)
Fig 7: Mortality by surgery outcome.

![](../figures/complication.png)
Fig 8: Mortality under presence of surgical complication.

<!-- ![](../figures/comp_type.png) -->
<!-- Fig 9: Mortality by complication type. -->

## Alternative results table


| Characteristic |  1-year survival  |  2-year survival  |   p   |
|:--------------:|:-----------------:|:-----------------:|:-----:|
|    Overall     |  96% (91%, 100%)  |  92% (85%, 100%)  |       |
|      sex       |                   |                   | 0.275 |
|       F        | 100% (100%, 100%) |  93% (85%, 100%)  |       |
|       M        |  90% (79%, 100%)  |  90% (79%, 100%)  |       |
|      sirs      |                   |                   | 0.056 |
|       N        | 100% (100%, 100%) |  97% (92%, 100%)  |       |
|       Y        |  85% (67%, 100%)  |  77% (57%, 100%)  |       |
|     joint      |                   |                   | 0.703 |
|      Hip       |  96% (89%, 100%)  |  92% (83%, 100%)  |       |
|      Knee      |  96% (89%, 100%)  |  92% (82%, 100%)  |       |
|  surg.success  |                   |                   | 0.060 |
|    Failure     |  93% (80%, 100%)  |  84% (67%, 100%)  |       |
|    Success     | 100% (100%, 100%) | 100% (100%, 100%) |       |
|   surg.type    |                   |                   | 0.002 |
|   Amputation   | 100% (100%, 100%) |     — (—, —)      |       |
|  Arthrodesis   | 100% (100%, 100%) | 100% (100%, 100%) |       |
| Exarticulation | 100% (100%, 100%) | 100% (100%, 100%) |       |
|  Girdlestone   | 100% (100%, 100%) |  67% (30%, 100%)  |       |
|     Spacer     |  50% (19%, 100%)  |  50% (19%, 100%)  |       |
|      TJA       | 100% (100%, 100%) |  97% (93%, 100%)  |       |
|   multigerm    |                   |                   | 0.938 |
|       N        |  98% (93%, 100%)  |  92% (84%, 100%)  |       |
|       Y        |  92% (77%, 100%)  |  92% (77%, 100%)  |       |
|  complication  |                   |                   | 0.038 |
|       N        | 100% (100%, 100%) | 100% (100%, 100%) |       |
|       Y        |  92% (81%, 100%)  |  82% (68%, 100%)  |       |

Table: **Table 2** Optional version of Table 1, adding 1-year survival rates.

## Analytical data-set

Due to confidentiality the data-set used in this analysis cannot be shared online in the public version of this report.


