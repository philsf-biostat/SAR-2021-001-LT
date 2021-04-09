library(survival)

source('scripts/input.R', encoding = 'UTF-8')

se <- Surv(dtmin$time, dtmin$event) # time since PJI
se.p <- Surv(dtmin$timep, dtmin$event) # time since last procedure
se.t <- Surv(dtmin$timei, dtmin$event) # time since last TJA # NA: 7
se.i <- Surv(dtmin$timei, dtmin$event) # time since index # NA: 7


sf <- survfit(se ~ 1, data = dtmin)
sf.p <- survfit(se.p ~ 1, data = dtmin)
sf.t <- survfit(se.t ~ 1, data = dtmin)
sf.i <- survfit(se.i ~ 1, data = dtmin)
sfm <- survfit(Surv(time, status) ~ 1, data = dtmin)

# plot(sf, ylim = c(0, .8))

plot(sfm,
     col = 2:3,
     lty = 1:2,
     lwd = c(2, 1.5),
     # xscale = 12,
     main = "Competing risks of death after TJA",
     ylim = c(0, .8),
     xlab = "Months post PJI diagnosis",
     ylab = "Cumulative incidence"
     )
legend(
  0, .5,
  c("PJI confirmed death", "Other causes of death"),
  col = 2:3,
  lty = 1:2,
  lwd = c(2, 1.5),
  # title = "Competing risks",
  bty = "n"
)

library(cmprsk)

cr <- with(dtmin, cuminc(time, status))

plot(cr,
     curvlab = c("Survived", "Other causes of death", "PJI confirmed death"),
     lwd = c(1, 2, 2),
     col = c(1, 3, 2),
     lty = 3:1,
     main = "Competing risks of death after TJA",
     xlab = "Months post PJI diagnosis",
     ylab = "Cumulative incidence"
     )

# sf.pji <- survfit(se ~ status, data = dtmin)
# sf.p.pji <- survfit(se.p ~ status, data = dtmin)

# sf.adj <- 
sf.1 <- survfit(se ~ 1, dtmin)
sf.sex <- survfit(se ~ sex, dtmin) # p = 0.32
sf.sirs <- survfit(se ~ sirs, dtmin) # p = 0.038
sf.comp <- survfit(se ~ comp, dtmin) # p = 0.013
sf.joint <- survfit(se ~ joint, dtmin) # p = 0.71
sf.stat.tja <- survfit(se ~ stat.tja, dtmin) # p = < 0.0001
sf.outcome <- survfit(se ~ outcome, dtmin) # p < 0.0001
sf.multigerm <- survfit(se ~ multigerm, dtmin) # p = 98
sf.comp.type <- survfit(se ~ comp.type, dtmin) # p = 0.24
sf.status <- survfit(se ~ status, dtmin) # p < 0.0001

sd.sex <- survdiff(se ~ sex, dtmin) # p = 0.32
sd.sirs <- survdiff(se ~ sirs, dtmin) # p = 0.038
sd.comp <- survdiff(se ~ comp, dtmin) # p = 0.013
sd.joint <- survdiff(se ~ joint, dtmin) # p = 0.71
sd.stat.tja <- survdiff(se ~ stat.tja, dtmin) # p = < 0.0001
sd.outcome <- survdiff(se ~ outcome, dtmin) # p < 0.0001
sd.multigerm <- survdiff(se ~ multigerm, dtmin) # p = 98
sd.comp.type <- survdiff(se ~ comp.type, dtmin) # p = 0.24
sd.status <- survdiff(se ~ status, dtmin) # p < 0.0001


# boxplot(dtmin$time, ylab = "Time (years)", main = "Distribution of follow-up time in the cohort")

library(survminer)
ggsurvplot(survfit(se ~ 1, dtmin), dtmin)
# ggsurvplot(survfit(se ~ status, dtmin), dtmin, pval = TRUE, pval.coord = c(70, 0.10)) + ggtitle("Mortality confirmed to PJI") + xlab("Time (months)")
ggsurvplot(survfit(se ~ sex, dtmin), dtmin, pval = TRUE) + ggtitle("Survival by sex") + xlab("Time (months)")
ggsurvplot(survfit(se ~ sirs, dtmin), dtmin, pval = TRUE) + ggtitle("Survival by Confirmed SIRS") + xlab("Time (months)")
ggsurvplot(survfit(se ~ comp, dtmin), dtmin, pval = TRUE) + ggtitle("Survival given complications") + xlab("Time (months)")
ggsurvplot(survfit(se ~ joint, dtmin), dtmin, pval = TRUE) + ggtitle("Survival by operated joint") + xlab("Time (months)")
ggsurvplot(survfit(se ~ stat.tja, dtmin), dtmin, pval = TRUE) + ggtitle("Survival by success of TJA") + xlab("Time (months)")
ggsurvplot(survfit(se ~ outcome, dtmin), dtmin, pval = TRUE) + ggtitle("Survival by surgery outcome") + xlab("Time (months)")
ggsurvplot(survfit(se ~ multigerm, dtmin), dtmin, pval = TRUE) + ggtitle("Survival in the presence of multigerm infection") + xlab("Time (months)")
ggsurvplot(survfit(se ~ comp.type, dtmin), dtmin, pval = TRUE) + ggtitle("Survival by type of complication") + xlab("Time (months)")

ggsurvplot(survfit(se ~ status, dtmin), dtmin, risk.table = TRUE, surv.median.line = "hv", pval = TRUE, pval.coord = c(75, 0.10), pval.size = 4) + ggtitle("Survival confirmed to PJI") + xlab("Time (months)")

# library(forestmodel)
# forest_model(coxph(Surv(time, event) ~ status + age + sex, dtmin))
# forest_model(coxph(Surv(time, event) ~ status + stat.tja + outcome, dtmin))
