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

1. ID
1. Age; continuous
1. Sex; binary
1. time (date PJI diagnosis -- date last follow up)
1. event (death due to PJI)
1. death (all causes)
1. Joint; binary
1. SIRS; binary
1. Multi-germ infection; binary
1. Complication; binary
1. Surgery type; categorical
1. Surgery success; binary

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

- Sex; binary
- Joint; binary
- Complication; binary
- SIRS; binary
- Multi-germ infection; binary
- Surgery success; binary
- Surgery type; categorical

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

Of the 54 participants were included, 21 (39%) were male and 33 (61%) were female.
Average (SD) age was 64.3 (11.6) years, ranging from 32 to 88 years.
Time under observation ranged from 4 days to 16.35 years, where all 54 participants contributed with a total of 239 person-years of follow up.

## Mortality

- mortality: 5 PJI + 5 Other
- no median time for deaths
  - deaths times: PJI 4 days -- 2.13 years
  - Other 2.37 years -- 13.17 years

44 of the 54 patients survived until the last follow up observation.
Of the deaths recorded, 5 from other causes and 5 could be attributed to PJI (Fig 1).
All deaths attributed to PJI occurred before the deaths unrelated.

Figure 2 shows the Kaplan-Meier estimate of the mortality rate attributed to PJI.
Times of death ranged from 4 days to 2.13 years.
The survival rate at the end of study follow up was 89.7% so the median time of survival could not be estimated.
The 1-year survival rate was estimated as 96% (91% -- 100%) and the 2-year survival rate was estimated as 92% (85% -- 100%).

Times of deaths unrelated to PJI ranged from 2.37 years to 13.17 years (Fig 1).
It is noticeable that, while this analysis does not give proof that there is a significant difference between times of death between all causes, this sample seem to indicate that most patients die from PJI within 2 years of the diagnosis.

![](../figures/death_all.png)
**Figure 1** Mortality due to all causes.

![](../figures/death_PJI.png)
**Figure 2** Mortality confirmed to be caused by PJI.

## 2-year survival rates


| Characteristic |  2-year survival  |   p   |
|:--------------:|:-----------------:|:-----:|
|    Overall     |  92% (85%, 100%)  |       |
|      Sex       |                   | 0.275 |
|       F        |  93% (85%, 100%)  |       |
|       M        |  90% (79%, 100%)  |       |
|     Joint      |                   | 0.703 |
|      Hip       |  92% (83%, 100%)  |       |
|      Knee      |  92% (82%, 100%)  |       |
|  Complication  |                   | 0.038 |
|       N        | 100% (100%, 100%) |       |
|       Y        |  82% (68%, 100%)  |       |
|      SIRS      |                   | 0.056 |
|       N        |  97% (92%, 100%)  |       |
|       Y        |  77% (57%, 100%)  |       |
|   Multigerm    |                   | 0.938 |
|       N        |  92% (84%, 100%)  |       |
|       Y        |  92% (77%, 100%)  |       |
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

Table: **Table 1** Survival rates for 2-year.

# Exceptions and Observations

# Conclusions


# References

# Appendix

## Exploratory data analysis

<!-- ```{r fig3, fig.height=12, fig.width=8} -->
<!-- ggarrange(gg.sex$plot, gg.sirs$plot, gg.joint$plot, gg.stat.tja$plot, gg.outcome$plot, gg.comp$plot, labels = "AUTO", ncol = 2, nrow = 3) -->
<!-- ``` -->

![](../figures/Sex.png)
**Figure 3** Mortality by Sex.

![](../figures/Joint.png)
**Figure 4** Mortality by joint.

![](../figures/Complication.png)
**Figure 5** Mortality under presence of surgical complication.

![](../figures/Multigerm.png)
**Figure 6** Mortality by Multi-germ.

![](../figures/SIRS.png)
**Figure 7** Mortality by SIRS.

![](../figures/surg_success.png)
**Figure 8** mortality by status of the TJA.

![](../figures/surg_type.png)
**Figure 9** Mortality by surgery outcome.

<!-- ![](../figures/comp_type.png) -->
<!-- Fig 9: Mortality by complication type. -->

## Alternative results table


| Characteristic |  1-year survival  |  2-year survival  |   p   |
|:--------------:|:-----------------:|:-----------------:|:-----:|
|    Overall     |  96% (91%, 100%)  |  92% (85%, 100%)  |       |
|      Sex       |                   |                   | 0.275 |
|       F        | 100% (100%, 100%) |  93% (85%, 100%)  |       |
|       M        |  90% (79%, 100%)  |  90% (79%, 100%)  |       |
|     Joint      |                   |                   | 0.703 |
|      Hip       |  96% (89%, 100%)  |  92% (83%, 100%)  |       |
|      Knee      |  96% (89%, 100%)  |  92% (82%, 100%)  |       |
|  Complication  |                   |                   | 0.038 |
|       N        | 100% (100%, 100%) | 100% (100%, 100%) |       |
|       Y        |  92% (81%, 100%)  |  82% (68%, 100%)  |       |
|      SIRS      |                   |                   | 0.056 |
|       N        | 100% (100%, 100%) |  97% (92%, 100%)  |       |
|       Y        |  85% (67%, 100%)  |  77% (57%, 100%)  |       |
|   Multigerm    |                   |                   | 0.938 |
|       N        |  98% (93%, 100%)  |  92% (84%, 100%)  |       |
|       Y        |  92% (77%, 100%)  |  92% (77%, 100%)  |       |
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

Table: **Table 2** Optional version of Table 1, adding 1-year survival rates.

## Analytical data-set

Due to confidentiality the data-set used in this analysis cannot be shared online in the public version of this report.


