
#source("source/clustring.R")


#pipe <- function() {

  germany <<- read.csv2("data/location/GEO-AZ.csv", sep=",", header = FALSE, encoding = "Latin-1")
  germany <<- data.frame(city = as.character(germany$V1), lat=germany$V2, lon=germany$V3)
  View(germany)
  germanyCities <<- germany$city

  #distanceMatrix <<- preprocess(wordlist, StoS.TriGram)
  #clusterResult <<- Lloyd(distanceMatrix, recenter.Heuristical, 200)
  #View(clusterResult)


  # MAPSECTION

  cityLat <- germany$lat
  cityLon <- germany$lon


  Germany.map = get_map(location = "Germany", zoom = 6, color="bw")  ## get MAP data

  p <- ggmap(Germany.map)
  p <- p + geom_point(data=germany, aes(lat=germany$lat, lon=germany$lon), color=c("red"))
  p <- p +scale_color_gradient(low = "yellow", high = "red", guide=guide_legend(title = "Price"))
  p  + theme(axis.title=element_blank(),
             axis.text=element_blank(),
             axis.ticks=element_blank()) + ggtitle("All Gas Stations along the Autobahn")

#}



