library(survminer)

gg.overal <- ggsurvplot(
  survfit(se ~ 1, dtmin),
  dtmin
  )

gg.sex <- ggsurvplot(
  survfit(se ~ sex, dtmin),
  dtmin,
  pval = TRUE, pval.coord = c(150, 0.10), pval.size = pval.size
  ) +
  ggtitle("Survival by sex") +
  xlab("Time (months)")

gg.sirs <- ggsurvplot(
  survfit(se ~ sirs, dtmin),
  dtmin,
  pval = TRUE, pval.coord = c(150, 0.10), pval.size = pval.size
  ) +
  ggtitle("Survival by Confirmed SIRS") +
  xlab("Time (months)")

gg.comp <- ggsurvplot(
  survfit(se ~ comp, dtmin),
  dtmin,
  pval = TRUE, pval.coord = c(150, 0.10), pval.size = pval.size
  ) +
  ggtitle("Survival given complications") +
  xlab("Time (months)")

gg.joint <- ggsurvplot(
  survfit(se ~ joint, dtmin),
  dtmin,
  pval = TRUE, pval.coord = c(150, 0.10), pval.size = pval.size
  ) +
  ggtitle("Survival by operated joint") +
  xlab("Time (months)")

gg.stat.tja <- ggsurvplot(
  survfit(se ~ stat.tja, dtmin),
  dtmin,
  pval = TRUE, pval.coord = c(150, 0.10), pval.size = pval.size
  ) +
  ggtitle("Survival by success of TJA") +
  xlab("Time (months)")

gg.outcome <- ggsurvplot(
  survfit(se ~ outcome, dtmin),
  dtmin,
  pval = TRUE, pval.coord = c(150, 0.10), pval.size = pval.size
  ) +
  ggtitle("Survival by surgery outcome") +
  xlab("Time (months)")

gg.comp.type <- ggsurvplot(
  survfit(se ~ comp.type, dtmin),
  dtmin,
  pval = TRUE, pval.coord = c(150, 0.10), pval.size = pval.size
  ) +
  ggtitle("Survival by type of complication") +
  xlab("Time (months)")

# boxplot(dtmin$time, ylab = "Time (years)", main = "Distribution of follow-up time in the cohort")

# competing risks ---------------------------------------------------------

gg.cr <- ggcompetingrisks(
  cr,
  # sfm,
  # conf.int = TRUE,
  multiple_panels = FALSE
  ) +
  ggtitle("Competing risks for causes of death after TJA") +
  xlab("Time (months)")

