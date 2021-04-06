
# Libraries
library(ggplot2)
library(dplyr)
library(lubridate)
library(dygraphs)
library(xts)
library(plotly)
library(tidyverse)
library(readxl)
library(vctrs)



piuhaJuoksu <- read_excel("C:/Users/markaila/Dropbox/tuloksia/piuha_juoksu.xlsx")
isopieniJuoksu <- read_excel("C:/Users/markaila/Dropbox/tuloksia/isopieni_juoksu.xlsx")
kinkkuJuoksu <- read_excel("C:/Users/markaila/Dropbox/tuloksia/kinkku_juoksu.xlsx")
#isokatinenJuoksu <- read_excel("C:/Users/markaila/Dropbox/tuloksia/isokatinen_juoksu.xlsx")
vuohiJuoksu <- read_excel("C:/Users/markaila/Dropbox/tuloksia/vuohi_juoksu.xlsx")
penaJuoksu <- read_excel("C:/Users/markaila/Dropbox/tuloksia/pena_juoksu.xlsx")


piuhaJuoksu <- piuhaJuoksu %>% select(date,matka,juoksija)
isopieniJuoksu <- isopieniJuoksu  %>% select(date,matka,juoksija)
kinkkuJuoksu <- kinkkuJuoksu  %>% select(date,matka,juoksija)
vuohiJuoksu <- vuohiJuoksu  %>% select(date,matka,juoksija)
penaJuoksu <- penaJuoksu  %>% select(date,matka,juoksija)


#juoksut  <- rbind(isopieniJuoksu)

juoksut  <- rbind(piuhaJuoksu, isopieniJuoksu, kinkkuJuoksu, vuohiJuoksu, penaJuoksu)


juoksut <- juoksut %>% group_by(juoksija) %>% mutate(kokonaisMatka = cumsum(matka))


juoksut$pvm <- as.Date(juoksut$date)

write.csv(juoksut,"C:/Users/markaila/Dropbox/tuloksia/juoksut.csv")
