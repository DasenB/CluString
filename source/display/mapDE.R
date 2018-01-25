library(ggplot2)
library(ggmap)


display.mapDE <- function(taxonomy, hierarchy, selection) {

    selection <- as.character(selection)
    View( taxonomy[taxonomy$cluster %in% selection, ] )

    germany <- read.csv2("data/location/GEO-AZ.csv", sep=",", header = FALSE, encoding = "Latin-1")
    germany <- data.frame(city = germany$V1, lat=as.double(as.character(germany$V2)), lon=as.double(as.character(germany$V3)))
    germany <- germany[!is.null(germany$lat) && !is.null(germany$lon) ,]
    germany <- germany[!is.na(germany$lat) && !is.na(germany$lon) ,]
    germany <- merge(germany, taxonomy, by.x = "city", by.y="string")

    pointsDE <- data.frame(lat=germany$lat, lon=germany$lon, cluster=as.character(germany$cluster))

    pointsDE <- pointsDE[pointsDE$cluster %in% selection, ]

    Germany.map = get_map(location = "Germany", zoom = 6, color="bw")
    map <- ggmap(Germany.map)
    map <- map + geom_point(data = pointsDE, aes(x = lon, y = lat, color=cluster), size=5)
    map  + theme(axis.title=element_blank(),
               axis.text=element_blank(),
               # legend.position="none",
               axis.ticks=element_blank()) + ggtitle("Städte Deutschlands im Cluster")

}
