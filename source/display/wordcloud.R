library(wordcloud2)
library("htmlwidgets")
library(webshot)

# webshot::install_phantomjs()

display.wordcloud <- function(taxonomy, hierarchy, outDir){

  newPath <- paste("data/location/wordcloud/", outDir, sep = "")
  if(!dir.exists(newPath)){
    dir.create(newPath, showWarnings = TRUE, recursive = FALSE, mode = "0777")
  }

  for(i in 1:max(as.numeric(hierarchy$cluster))) {
  # for(i in c(3, 5, 11, 13, 14, 15, 16, 17)) {

    cluster <- taxonomy[taxonomy$cluster == i, ]
    if(length(cluster$string) < 8) {
      next()
    }
    center <- cluster[cluster$distanceToCenter == 0, ]

    print( paste("Cluster Nr. ", i,": Length=", length(cluster$string), sep=""))

    if(length(center$string) != 1) {
      print(paste("Ups, Error while iterating cluster ", i, "of length ", length(cluster$string)))
      next()
    }

    center <- as.character(center$string[[1]])
    bigestDistance <- cluster[["distanceToCenter"]][[which.max(cluster[["distanceToCenter"]])]]

    importance <- lapply(
      cluster[["distanceToCenter"]],
      function(value) {
        result <- (1 + bigestDistance - value)*3
        print(result)
        return(result)
      }
    )

    clusterCloudData <- data.frame( word=as.character(cluster[["string"]]), freq=importance)
    # View( data.frame(importance=importance, distanceToCenter=cluster[["distanceToCenter"]]) )

    cloud <- wordcloud2(clusterCloudData, size=1, gridSize=1 )

    newFile <- paste(newPath, "/", center, ".png", sep="")
    saveWidget(cloud, "tmp.html", selfcontained = F)
    webshot("tmp.html", newFile, delay=5, vwidth=480, vheight=480)

  }


}
