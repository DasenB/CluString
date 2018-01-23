# loading the required packages
library(rworldmap)
newmap <- getMap(resolution = "low")
plot(newmap, xlim = c(-20, 59), ylim = c(35, 71), asp = 1)

worldmap <<- read.csv("data/location/worldmap.csv")
worldmap <<- data.frame(city=worldmap$city, lat=worldmap$lat, lng=worldmap$lng)

points(round(worldmap$lng,4), round(worldmap$lat,4), col = c(1, 2, 3, 4), cex = .6)

# getting the map

# loop through dataset and plot
# apply(
#   worldmap,
#   c(1),
#   function(row) {
#     city <- row[["city"]]
#     lat <- row[["lat"]]
#     lng <- row[["lng"]]
#     df <- as.data.frame(cbind(lng, lat))
#


  # lat setzen
  # lng setzen

  #plotten der punkte

# distanceMatrix <<- preprocess(wordlist, StoS.TriGram)
# clusterResult <<- Lloyd(distanceMatrix, recenter.Heuristical, 200)




