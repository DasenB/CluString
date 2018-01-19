library("ggmap")
# library(maptools)
# library(maps)

source("source/clustring.R")


pipe <- function() {

  worldmap <<- read.csv2("data/wordlist/worldmap.csv", sep=",")
  worldmap <<- data.frame(city = worldmap$city, lat=worldmap$lat, lng=worldmap$lng, country=worldmap$country)

  wordlist <<- worldmap$city

  distanceMatrix <<- preprocess(wordlist, StoS.TriGram)
  clusterResult <<- Lloyd(distanceMatrix, recenter.Heuristical, 200)
  #View(clusterResult)

  # MAPSECTION

  city <- worldmap$city
  lat_city <- worldmap$lat
  lng_city <- worldmap$lng

  #Using GGPLOT, plot the Base World Map
  mp <- NULL
  mapWorld <- borders("world", colour="gray50", fill="gray50") # create a layer of borders
  mp <- ggplot() +   mapWorld

  #Now Layer the cities on top
  mp <- mp+ geom_point(aes(x=lat.city, y=lng.city) ,color="blue", size=3)
  mp



}
