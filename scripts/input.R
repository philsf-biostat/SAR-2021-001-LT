library(readxl)
library(data.table)
dt.raw <- read_excel("dataset/2021-02-12 Edit_LUcio_ von 210207 Data PJI Westerholt.xlsx", na = c("NA", "t.b.d."))
dt.raw <- data.table(dt.raw)

# KM vars -----------------------------------------------------------------

# deaths
# EVENT is death confirmed caused by PJI (KM)
# DEATH is any death (CR)
dt.raw$event <- as.numeric(NA)
dt.raw$death <- factor(NA, levels = c("Survive", "PJI", "Other"))

dt.raw[`Death related to PJI` %in% c("NA", NA), ]$event <- 1
dt.raw[`Death related to PJI` %in% c("NA", NA)]$death <- 1
dt.raw[`Death related to PJI` %in% c("N"), ]$event <- 1
dt.raw[`Death related to PJI` %in% c("N")]$death <- 3
dt.raw[`Death related to PJI` == c("Y")]$death <- 2
dt.raw[`Death related to PJI` %in% c("Y"), ]$event <- 2

# times
library(lubridate)

# time since PJI
dt.raw$time <- interval(start = dt.raw$`Date PJI`, end = dt.raw$`Date Last F/U`)/dmonths(1)

# # time since last procedure
# dt.raw$timep <- interval(start = dt.raw$`Date Last Procedure`, end = dt.raw$`Date Last F/U`)/dmonths(1)
# 
# # time since index
# dt.raw$timei <- interval(start = dt.raw$`Date Index`, end = dt.raw$`Date Last F/U`)/dmonths(1)
# 
# # time last tja
# dt.raw$timet <- interval(start = dt.raw$`Date Last TJA`, end = dt.raw$`Date Last F/U`)/dmonths(1)

# analytical dataset ------------------------------------------------------

dtmin <- dt.raw[, .(
  id=factor(`Case ID`),
  age=`Age at PJI`,
  event,
  death,
  time,# timep, timei, timet,
  sex=factor(Sex),
  complication=factor(COMPLICATION),
  comp.type=factor(`TYPE Complication`),
  sirs=factor(SIRS),
  joint=factor(`Joint komb.`),
  surg.type=factor(`Results Joint`),
  multigerm=MULTIGERM,
  surg.success=factor(`Success/Failure TJA`)
  )]

# Date cols
summary(dt.raw[, .(`Date PJI`, `Date Last F/U`, `Date Index`, `Date Last Procedure`, `Date Last TJA`)])

# dtmin <- dtmin[death != "Other"]
# dtmin <- dtmin[death != "PJI"]
