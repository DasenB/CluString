
#source("source/clustring.R")


#pipe <- function() {

  germany <<- read.csv2("data/location/GEO-AZ.csv", sep=",", header = FALSE, encoding = "Latin-1")
  germany <<- germany[!is.na(germany$V2) && !is.na(germany$V3) ,]
  germany <<- data.frame(city = as.character(germany$V1), lat=as.numeric(as.character(germany$V2)), lon=as.numeric(as.character(germany$V3)))
  germanyCities <<- germany$city

  #distanceMatrix <<- preprocess(wordlist, StoS.TriGram)
  #clusterResult <<- Lloyd(distanceMatrix, recenter.Heuristical, 200)
  #View(clusterResult)


  # MAPSECTION

  cityLat <- germany$lat
  cityLon <- germany$lon

  ggplot(mtcars, aes(mpg, hp)) +
    geom_point()

  Germany.map = get_map(location = "Germany", zoom = 6, color="bw")  ## get MAP data

  p <- ggmap(Germany.map)
  p <- p + geom_point(data=germany, aes(x=lon, y=lat), color=c("red"))
  p <- p + scale_color_gradient(low = "yellow", high = "red")
  p  + theme(axis.title=element_blank(),
             axis.text=element_blank(),
             axis.ticks=element_blank()) + ggtitle("Städte Deutschlands im Cluster")



