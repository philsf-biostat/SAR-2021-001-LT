library(readxl)
library(data.table)
library(dplyr)
dt.raw <- read_excel("dataset/2021-02-12 Edit_LUcio_ von 210207 Data PJI Westerholt.xlsx", na = c("NA", "t.b.d.", "unknown"))
dt.raw <- data.table(dt.raw)

# data cleaning -----------------------------------------------------------
library(stringr)

dt.raw <- dt.raw[!is.na(`Case ID`)] # remove 3 junk lines on the tail
dt.raw[`Results Joint`=="spacer"]$`Results Joint` <- "Spacer"
dt.raw$Sex <- toupper(dt.raw$Sex)
dt.raw$`Success/Failure TJA` <- str_to_title(dt.raw$`Success/Failure TJA`)

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
dt.raw$time <- interval(start = dt.raw$`Date PJI`, end = dt.raw$`Date Last F/U`)/dyears(1)

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
  Age=`Age at PJI`,
  Sex=factor(Sex),
  time,# timep, timei, timet,
  event,
  death,
  Joint=factor(`Joint komb.`),
  Complication=factor(COMPLICATION),
  # comp.type=factor(`TYPE Complication`),
  SIRS=factor(SIRS),
  Multigerm=factor(MULTIGERM),
  surg.type=factor(`Results Joint`),
  surg.success=factor(`Success/Failure TJA`)
  )]

# Date cols
summary(dt.raw[, .(`Date PJI`, `Date Last F/U`, `Date Index`, `Date Last Procedure`, `Date Last TJA`)])

# dtmin <- dtmin[death != "Other"]
# dtmin <- dtmin[death != "PJI"]

analytical_mockup <- tibble( id = c( "1", "2", "3", "...", as.character(nrow(dtmin)) ) ) %>%
  left_join(dtmin %>% head(0), by = "id") %>%
  mutate_all(as.character) %>%
  replace(is.na(.), "")
