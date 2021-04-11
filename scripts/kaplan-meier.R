# setup -------------------------------------------------------------------

source('scripts/input.R', encoding = 'UTF-8')
library(survival)


# Surv --------------------------------------------------------------------


se <- Surv(dtmin$time, dtmin$event) # time since PJI
# se.p <- Surv(dtmin$timep, dtmin$event) # time since last procedure
# se.t <- Surv(dtmin$timei, dtmin$event) # time since last TJA # NA: 7
# se.i <- Surv(dtmin$timei, dtmin$event) # time since index # NA: 7


# survival objects --------------------------------------------------------


# sf <- survfit(se ~ 1, data = dtmin)
# sf.p <- survfit(se.p ~ 1, data = dtmin)
# sf.t <- survfit(se.t ~ 1, data = dtmin)
# sf.i <- survfit(se.i ~ 1, data = dtmin)

sf.1 <- survfit(se ~ 1, dtmin)
sf.Sex <- survfit(se ~ Sex, dtmin) # p = 0.32
sf.sirs <- survfit(se ~ sirs, dtmin) # p = 0.038
sf.complication <- survfit(se ~ complication, dtmin) # p = 0.013
sf.joint <- survfit(se ~ joint, dtmin) # p = 0.71
sf.surg.success <- survfit(se ~ surg.success, dtmin) # p = < 0.0001
sf.surg.type <- survfit(se ~ surg.type, dtmin) # p < 0.0001
sf.multigerm <- survfit(se ~ multigerm, dtmin) # p = 98
# sf.comp.type <- survfit(se ~ comp.type, dtmin) # p = 0.24

# competing risks ---------------------------------------------------------

sfm <- survfit(Surv(time, death) ~ 1, data = dtmin)

library(cmprsk)

cr <- with(dtmin, cuminc(time, death))


# survival diffs ----------------------------------------------------------


sd.Sex <- survdiff(se ~ Sex, dtmin) # p = 0.32
sd.sirs <- survdiff(se ~ sirs, dtmin) # p = 0.038
sd.complication <- survdiff(se ~ complication, dtmin) # p = 0.013
sd.joint <- survdiff(se ~ joint, dtmin) # p = 0.71
sd.surg.success <- survdiff(se ~ surg.success, dtmin) # p = < 0.0001
sd.surg.type <- survdiff(se ~ surg.type, dtmin) # p < 0.0001
sd.multigerm <- survdiff(se ~ multigerm, dtmin) # p = 98
# sd.comp.type <- survdiff(se ~ comp.type, dtmin) # p = 0.24


# forest plots ------------------------------------------------------------


# library(forestmodel)
# forest_model(coxph(Surv(time, event) ~ death + age + Sex, dtmin))
# forest_model(coxph(Surv(time, event) ~ death + surg.success + surg.type, dtmin))
