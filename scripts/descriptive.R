source('scripts/input.R', encoding = 'UTF-8')

time <- 24
digits <- 1
pvdigits <- 3
t_unit <- "months"

duration(fivenum(dtmin$time), units = t_unit)
