# install.packages("calendR")

library(calendR)
library(tidyverse)


as_num_difftime <- function(end, beginning) {
  round(as.numeric(difftime(as.POSIXct(end),
                      as.POSIXct(beginning),
                      units = "days") 
             + 1))
}

poczatek <- "2021-07-01"
koniec <- "2021-09-30"
rekrutacja_start <- "2021-07-03"
rekrutacja_stop <- "2021-08-06"
zaczynasz <- "2021-09-06"

my_fills <- rep(
  NA,
  as_num_difftime(koniec, poczatek)
)


# Add the events to the desired days
my_fills[as_num_difftime(
  rekrutacja_start,
  poczatek):as_num_difftime(
    rekrutacja_stop,
    poczatek)] <- "czas na zgłoszenie"

my_fills[as_num_difftime(zaczynasz,
                         poczatek)] <- "zaczynasz staż"

# Add a legend if desired


cal <- calendR(start_date = poczatek, end_date = koniec,
               special.days = my_fills,
               special.col = c("#b6b2ae", "#e5881b"),    
               legend.pos = "bottom",
               start = "M",
               # font.family = "Roboto",
               title = "Kalendarz stażowy",
               lty = 1,
               col = "white",
               day.size = 4
)

ggsave(filename = paste(poczatek, koniec, "_macos_test.png", sep = "_"),
       plot = cal, units = "cm", width = 15, height = 10)

