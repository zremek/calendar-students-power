# install.packages("calendR")

library(calendR)
library(tidyverse)

as_num_difftime <- function(end, beginning) {
  as.numeric(difftime(as.POSIXct(end),
                      as.POSIXct(poczatek),
                      units = "days") 
             + 1)
}

poczatek <- "2020-12-01"
koniec <- "2021-02-28"
rekrutacja_start <- "2020-12-05"
rekrutacja_stop <- "2021-01-08"
zaczynasz <- "2021-02-08"

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

ggsave(filename = paste(poczatek, koniec, ".png", sep = "_"),
       plot = cal, units = "cm", width = 15, height = 10)
