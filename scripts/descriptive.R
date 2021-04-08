source('scripts/input.R', encoding = 'UTF-8')
library(tidyr)

time <- 24
digits <- 1
pvdigits <- 3
t_unit <- "months"

duration(fivenum(dtmin$time), units = t_unit)

tbl_km <- tbl.2.yr$table_body %>% select(
  Characteristic = "label",
  "2-year survival"= "stat_1",
  p = "p.value"
  )
tbl_km$p <- style_pvalue(tbl_km$p, digits = pvdigits)
tbl_km <- replace_na(tbl_km, list("2-year survival"="", p=""))
