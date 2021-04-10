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

library(cmprsk)

cr <- with(dtmin, cuminc(time, status))

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


# library(forestmodel)
# forest_model(coxph(Surv(time, event) ~ status + age + sex, dtmin))
# forest_model(coxph(Surv(time, event) ~ status + stat.tja + outcome, dtmin))
