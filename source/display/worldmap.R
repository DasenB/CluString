
#source("source/clustring.R")


#pipe <- function() {

  germany <<- read.csv2("data/location/GEO-AZ.csv", sep=",", header = FALSE, encoding = "Latin-1")
  germany <<- data.frame(city = germany$V1, lat=germany$V2, long=germany$V3)

  germanyCities <<- germany$city

  #distanceMatrix <<- preprocess(wordlist, StoS.TriGram)
  #clusterResult <<- Lloyd(distanceMatrix, recenter.Heuristical, 200)
  #View(clusterResult)


  # MAPSECTION

  #cityLat <- germany$lat
  #cityLong <- germany$long

  library(ggmap)

  Germany.map = get_map(location = "Germany", zoom = 6, color="bw")  ## get MAP data

  p <- ggmap(Germany.map)



#}



