library(survminer)

ggsurvplot(survfit(se ~ 1, dtmin), dtmin)
ggsave("figures/overall.png")
ggsurvplot(survfit(se ~ sex, dtmin), dtmin, pval = TRUE, pval.coord = c(150, 0.10), pval.size = pval.size) + ggtitle("Survival by sex") + xlab("Time (months)")
ggsave("figures/sex.png")
ggsurvplot(survfit(se ~ sirs, dtmin), dtmin, pval = TRUE, pval.coord = c(150, 0.10), pval.size = pval.size) + ggtitle("Survival by Confirmed SIRS") + xlab("Time (months)")
ggsave("figures/sirs.png")
ggsurvplot(survfit(se ~ comp, dtmin), dtmin, pval = TRUE, pval.coord = c(150, 0.10), pval.size = pval.size) + ggtitle("Survival given complications") + xlab("Time (months)")
ggsave("figures/complication.png")
ggsurvplot(survfit(se ~ joint, dtmin), dtmin, pval = TRUE, pval.coord = c(150, 0.10), pval.size = pval.size) + ggtitle("Survival by operated joint") + xlab("Time (months)")
ggsave("figures/joint.png")
ggsurvplot(survfit(se ~ stat.tja, dtmin), dtmin, pval = TRUE, pval.coord = c(150, 0.10), pval.size = pval.size) + ggtitle("Survival by success of TJA") + xlab("Time (months)")
ggsave("figures/status.png")
ggsurvplot(survfit(se ~ outcome, dtmin), dtmin, pval = TRUE, pval.coord = c(150, 0.10), pval.size = pval.size) + ggtitle("Survival by surgery outcome") + xlab("Time (months)")
ggsave("figures/result.png")
ggsurvplot(survfit(se ~ comp.type, dtmin), dtmin, pval = TRUE, pval.coord = c(150, 0.10), pval.size = pval.size) + ggtitle("Survival by type of complication") + xlab("Time (months)")
ggsave("figures/type.png")

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
