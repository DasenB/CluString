# library(wordcloud2)
# library("htmlwidgets")
# library(webshot)
#
# webshot::install_phantomjs()

displayCluster <- function(taxonomy, hierarchy){
  newPath <- paste("data/results/wordcloud/", format(Sys.time(), "%d_%b_%H:%M:%S_%Y"), sep = "")
  dir.create(newPath, showWarnings = TRUE, recursive = FALSE, mode = "0777")

  for (clusterID in hierarchy$cluster) {
      cluster <- taxonomy[taxonomy$cluster == clusterID, ]
      cluster <- data.frame(string=as.character(cluster[["string"]]), cluster=as.numeric(cluster[["distanceToCenter"]]))
      cloud <- wordcloud2(cluster, size=0.5)
      print(cluster[cluster$distanceToCenter == 0,])
      # newFile <- paste(cluster[cluster$distanceToCenter == 0,]$string, ".pdf", sep = "")
      # print(newFile)
#       saveWidget(cloud,"tmp.html",selfcontained = F)
#       webshot("tmp.html",newFile, delay =5, vwidth = 480, vheight=480)


  }

}

