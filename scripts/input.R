library(readxl)
library(data.table)
dt.raw <- read_excel("dataset/2021-02-12 Edit_LUcio_ von 210207 Data PJI Westerholt.xlsx", na = c("NA", "t.b.d."))
dt.raw <- data.table(dt.raw)

# KM vars -----------------------------------------------------------------

# deaths
# EVENT is death confirmed caused by PJI (KM)
# STATUS is any death (CR)
dt.raw$event <- as.numeric(NA)
dt.raw$status <- factor(NA, levels = c("Survive", "PJI", "Other"))

dt.raw[`Death related to PJI` %in% c("NA", NA), ]$event <- 1
dt.raw[`Death related to PJI` %in% c("NA", NA)]$status <- 1
dt.raw[`Death related to PJI` %in% c("N"), ]$event <- 1
dt.raw[`Death related to PJI` %in% c("N")]$status <- 3
dt.raw[`Death related to PJI` == c("Y")]$status <- 2
dt.raw[`Death related to PJI` %in% c("Y"), ]$event <- 2

# times
library(lubridate)

# time since PJI
dt.raw$time <- interval(start = dt.raw$`Date PJI`, end = dt.raw$`Date Last F/U`)/dmonths(1)

# time since last procedure
dt.raw$timep <- interval(start = dt.raw$`Date Last Procedure`, end = dt.raw$`Date Last F/U`)/dmonths(1)

# time since index
dt.raw$timei <- interval(start = dt.raw$`Date Index`, end = dt.raw$`Date Last F/U`)/dmonths(1)

# time last tja
dt.raw$timet <- interval(start = dt.raw$`Date Last TJA`, end = dt.raw$`Date Last F/U`)/dmonths(1)

# analytical dataset ------------------------------------------------------

dtmin <- dt.raw[, .(
  id=factor(`Case ID`),
  age=`Age at PJI`,
  event,
  status,
  time, timep, timei, timet,
  sex=factor(Sex),
  comp=factor(COMPLICATION),
  comp.type=factor(`TYPE Complication`),
  sirs=factor(SIRS),
  joint=factor(`Joint komb.`),
  outcome=factor(`Results Joint`),
  multigerm=MULTIGERM,
  stat.tja=factor(`Success/Failure TJA`)
  )]

# Date cols
summary(dt.raw[, .(`Date PJI`, `Date Last F/U`, `Date Index`, `Date Last Procedure`, `Date Last TJA`)])

# dtmin <- dtmin[status != "Other"]
# dtmin <- dtmin[status != "PJI"]
