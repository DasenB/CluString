# loading the required packages
library(ggplot2)
library(ggmap)


worldmap <<- read.csv("data/wordlist/worldmap.csv")
worldmap <<- data.frame(city=worldmap$city, lat=worldmap$lat, lng=worldmap$lng)

# hier muss durch jede stadt geloopt
by(dataFrame, 1:nrow(dataFrame), function(row) dostuff)
worldmapping <- function(x, output){
  
}
  
  # lat setzen
  # lng setzen 

  #plotten der punkte

# distanceMatrix <<- preprocess(wordlist, StoS.TriGram)
# clusterResult <<- Lloyd(distanceMatrix, recenter.Heuristical, 200)



# creating a sample data.frame with your lat/lon points
lon <- c(-38.31,-35.5)
lat <- c(40.96, 37.5)
df <- as.data.frame(cbind(lon,lat))

# getting the map
mapgilbert <- get_map(location = c(lon = mean(df$lon), lat = mean(df$lat)), zoom = 4,
                      maptype = "satellite", scale = 2)

# plotting the map with some points on it
ggmap(mapgilbert) +
  geom_point(data = df, aes(x = lon, y = lat, fill = "red", alpha = 0.8), size = 5, shape = 21) +
  guides(fill=FALSE, alpha=FALSE, size=FALSE)