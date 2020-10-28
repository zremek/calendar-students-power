# install.packages("calendR")

library(calendR)
library(tidyverse)


poczatek <- "2020-10-01"
koniec <- "2020-12-31"

my_fills <- rep(
  NA, 
  as.numeric(difftime(as.POSIXct(koniec),
                      as.POSIXct(poczatek),
                      units = "days") 
             + 1)
  )

# Add the events to the desired days
my_fills[c(26:sum(26, 11))] <- "czas na zgłoszenie"
my_fills[31 + 30 + 7] <- "zaczynasz staż"

# Add a legend if desired


cal <- calendR(start_date = poczatek, end_date = koniec,
               special.days = my_fills,
               special.col = c("#b6b2ae", "#e5881b"),    # Add as many colors as events
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

# todo: wrap my_fills to function, for calculating indexes iside []