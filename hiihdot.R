
# Libraries
library(ggplot2)
library(dplyr)
library(lubridate)
library(dygraphs)
library(xts)
library(plotly)
library(tidyverse)
library(readxl)


piuha <- read_excel("C:/Users/markaila/Dropbox/tuloksia/piuha.xlsx")
isopieni <- read_excel("C:/Users/markaila/Dropbox/tuloksia/isopieni.xlsx")
kinkku <- read_excel("C:/Users/markaila/Dropbox/tuloksia/kinkku.xlsx")
isokatinen <- read_excel("C:/Users/markaila/Dropbox/tuloksia/isokatinen.xlsx")
vuohi <- read_excel("C:/Users/markaila/Dropbox/tuloksia/vuohi.xlsx")


hiihdot  <- rbind(piuha , isopieni, kinkku, isokatinen, vuohi)
dim(hiihdot)

hiihdot <- hiihdot %>% group_by(hiihtaja) %>% mutate(kokonaisMatka = cumsum(matka))


hiihdot$pvm <- as.Date(hiihdot$date)

write.csv(hiihdot,"C:/Users/markaila/Dropbox/tuloksia/hiihdot.csv")
