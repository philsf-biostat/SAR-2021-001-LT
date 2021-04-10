library(survminer)

gg.overal <- ggsurvplot(
  survfit(se ~ 1, dtmin),
  dtmin
  )
ggsave(filename = "figures/overall.png",
       plot = print(gg.overal),
       width = 7, height = 7
       )

gg.sex <- ggsurvplot(
  survfit(se ~ sex, dtmin),
  dtmin,
  pval = TRUE, pval.coord = c(150, 0.10), pval.size = pval.size
  ) +
  ggtitle("Survival by sex") +
  xlab("Time (months)")
ggsave(
  filename = "figures/sex.png",
  plot = print(gg.sex),
  width = 7, height = 7
  )

gg.sirs <- ggsurvplot(
  survfit(se ~ sirs, dtmin),
  dtmin,
  pval = TRUE, pval.coord = c(150, 0.10), pval.size = pval.size
  ) +
  ggtitle("Survival by Confirmed SIRS") +
  xlab("Time (months)")
ggsave(
  filename = "figures/sirs.png",
  device = print(gg.sirs),
  width = 7, height = 7
  )

gg.comp <- ggsurvplot(
  survfit(se ~ comp, dtmin),
  dtmin,
  pval = TRUE, pval.coord = c(150, 0.10), pval.size = pval.size
  ) +
  ggtitle("Survival given complications") +
  xlab("Time (months)")
ggsave(
  filename = "figures/complication.png",
  plot = print(gg.comp),
  width = 7, height = 7
  )

gg.joint <- ggsurvplot(
  survfit(se ~ joint, dtmin),
  dtmin,
  pval = TRUE, pval.coord = c(150, 0.10), pval.size = pval.size
  ) +
  ggtitle("Survival by operated joint") +
  xlab("Time (months)")
ggsave(
  filename = "figures/joint.png",
  plot = print(gg.joint),
  width = 7, height = 7
  )

gg.stat.tja <- ggsurvplot(
  survfit(se ~ stat.tja, dtmin),
  dtmin,
  pval = TRUE, pval.coord = c(150, 0.10), pval.size = pval.size
  ) +
  ggtitle("Survival by success of TJA") +
  xlab("Time (months)")
ggsave(
  filename = "figures/status.png",
  plot = print(gg.stat.tja),
  width = 7, height = 7
  )

gg.outcome <- ggsurvplot(
  survfit(se ~ outcome, dtmin),
  dtmin,
  pval = TRUE, pval.coord = c(150, 0.10), pval.size = pval.size
  ) +
  ggtitle("Survival by surgery outcome") +
  xlab("Time (months)")
ggsave(
  filename = "figures/result.png",
  plot = print(gg.outcome),
  width = 7, height = 7
  )

gg.comp.type <- ggsurvplot(
  survfit(se ~ comp.type, dtmin),
  dtmin,
  pval = TRUE, pval.coord = c(150, 0.10), pval.size = pval.size
  ) +
  ggtitle("Survival by type of complication") +
  xlab("Time (months)")
ggsave(
  filename = "figures/type.png",
  plot = print(gg.comp.type),
  width = 7, height = 7
  )

# boxplot(dtmin$time, ylab = "Time (years)", main = "Distribution of follow-up time in the cohort")


# competing risks ---------------------------------------------------------

png("figures/competing-risks.png", width = 600, height = 600)
plot(cr,
     curvlab = c("Survived", "Other causes of death", "PJI confirmed death"),
     lwd = c(1, 2, 2),
     col = c(1, 3, 2),
     lty = 3:1,
     main = "Competing risks of death after TJA",
     xlab = "Months post PJI diagnosis",
     ylab = "Cumulative incidence"
)
dev.off()
