# setup -------------------------------------------------------------------

source('scripts/input.R', encoding = 'UTF-8')
library(tidyr)

time <- 24
digits <- 1
pval.size <- 3
t_unit <- "months"

duration(fivenum(dtmin$time), units = t_unit)

# survival tables ---------------------------------------------------------

library(gtsummary)

## multistate model - competing events
# tbl_survfit(list(sfm,
#                  survfit(formula = Surv(time, death) ~ Sex, data = dtmin),
#                  survfit(formula = Surv(time, death) ~ sirs, data = dtmin),
#                  survfit(formula = Surv(time, death) ~ Complication, data = dtmin)
#                  ), times = c(12, 24)) %>% add_p()

list_sf <- list(sf.1,
                sf.Sex,
                sf.sirs,
                sf.Joint,
                sf.surg.success,
                sf.surg.type,
                sf.multigerm,
                sf.Complication
                # sf.comp.type
)

# tbl_survfit(dtmin, y = Surv(time, event), include = c(Sex, sirs, Joint, surg.success, surg.type, multigerm, Complication), times= c(12, 24)) %>% add_p()
tbl.2.yr <- tbl_survfit(list_sf, times = c(2)) %>% add_p()
tbl.1.2.yr <- tbl_survfit(list_sf, times = c(1, 2)) %>% add_p()

# report tables -----------------------------------------------------------

tbl_km <- tbl.2.yr$table_body %>% select(
  Characteristic = "label",
  "2-year survival"= "stat_1",
  p = "p.value"
  )
tbl_km$p <- style_pvalue(tbl_km$p, digits = pval.size)
tbl_km <- replace_na(tbl_km, list("2-year survival"="", p=""))

tbl_km2 <- tbl.1.2.yr$table_body %>% select(
  Characteristic = "label",
  "1-year survival"= "stat_1",
  "2-year survival"= "stat_2",
  p = "p.value"
)
tbl_km2$p <- style_pvalue(tbl_km2$p, digits = pval.size)
tbl_km2 <- replace_na(tbl_km2, list("1-year survival"="", "2-year survival"="", p=""))
