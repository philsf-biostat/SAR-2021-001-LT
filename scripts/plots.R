# setup -------------------------------------------------------------------

library(survminer)

xlabel <- "Time (years)"
pval.coord <- c(150, 0.10)

# main figure -------------------------------------------------------------

gg.overal <- ggsurvplot(
  survfit(se ~ 1, dtmin),
  dtmin, risk.table = TRUE
  ) +
  ggtitle(
    label = "Deaths caused by PJI after TJA",
    ) +
  xlab(xlabel)

# additional figures ------------------------------------------------------

gg.sex <- ggsurvplot(
  survfit(se ~ sex, dtmin),
  dtmin,
  pval = TRUE, pval.coord = pval.coord, pval.size = pval.size
  ) +
  ggtitle("Survival by sex") +
  xlab(xlabel)

gg.sirs <- ggsurvplot(
  survfit(se ~ sirs, dtmin),
  dtmin,
  pval = TRUE, pval.coord = pval.coord, pval.size = pval.size
  ) +
  ggtitle("Survival by Confirmed SIRS") +
  xlab(xlabel)

gg.complication <- ggsurvplot(
  survfit(se ~ complication, dtmin),
  dtmin,
  pval = TRUE, pval.coord = pval.coord, pval.size = pval.size
  ) +
  ggtitle("Survival given complications") +
  xlab(xlabel)

gg.joint <- ggsurvplot(
  survfit(se ~ joint, dtmin),
  dtmin,
  pval = TRUE, pval.coord = pval.coord, pval.size = pval.size
  ) +
  ggtitle("Survival by operated joint") +
  xlab(xlabel)

gg.surg.success <- ggsurvplot(
  survfit(se ~ surg.success, dtmin),
  dtmin,
  pval = TRUE, pval.coord = pval.coord, pval.size = pval.size
  ) +
  ggtitle("Survival by surgery success") +
  xlab(xlabel)

gg.surg.type <- ggsurvplot(
  survfit(se ~ surg.type, dtmin),
  dtmin,
  pval = TRUE, pval.coord = pval.coord, pval.size = pval.size
  ) +
  ggtitle("Survival by surgery type") +
  xlab(xlabel)

# gg.comp.type <- ggsurvplot(
#   survfit(se ~ comp.type, dtmin),
#   dtmin,
#   pval = TRUE, pval.coord = pval.coord, pval.size = pval.size
#   ) +
#   ggtitle("Survival by type of complication") +
#   xlab(xlabel)

# boxplot(dtmin$time, ylab = "Time (years)", main = "Distribution of follow-up time in the cohort")

# competing risks ---------------------------------------------------------

gg.cr <- ggcompetingrisks(
  # cr,
  sfm,
  # conf.int = TRUE,
  multiple_panels = FALSE
  ) +
  ggtitle("Competing risks for causes of death after TJA") +
  xlab(xlabel)

