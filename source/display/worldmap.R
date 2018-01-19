#=================
# INSTALL PACKAGES
#=================
library(tidyverse)
library(rvest)
library(magrittr)
library(ggmap)
library(stringr)


worldmap <- read.csv2("data/wordlist/worldmap.csv", sep=",")
worldmap <- data.frame(city = worldmap$city, lat=worldmap$lat, lng=worldmap$lng, country=worldmap$country)
View(worldmap)
