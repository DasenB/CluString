# library(wordcloud2)
# library("htmlwidgets")
# library(webshot)

# webshot::install_phantomjs()

display.wordcloud <- function(taxonomy, hierarchy, outDir){

  newPath <- paste("data/results/wordcloud/", outDir, sep = "")
  dir.create(newPath, showWarnings = TRUE, recursive = FALSE, mode = "0777")

    for(i in 1:max(as.numeric(hierarchy$cluster))) {
      print(i)

      cluster <- taxonomy[taxonomy$cluster == i, ]
      center <- cluster[cluster$distanceToCenter == 0, ]

      if(length(center$string) != 1) {
        print(paste("Ups, Error while iterating cluster ", i, "of length ", length(cluster$string)))
        return()
      }

      center <- as.character(center$string[[1]])

      cluster <- data.frame(string=as.character(cluster[["string"]]), cluster=as.numeric(cluster[["distanceToCenter"]]))
      cloud <- wordcloud2(cluster, size=0.5)

      newFile <- paste(newPath, "/", center, ".png", sep="")
      saveWidget(cloud, "tmp.html", selfcontained = F)
      webshot("tmp.html", newFile, delay=5, vwidth=480, vheight=480)

  }


}
#
#   for(row in taxonomy[taxonomy$distanceToCenter == 0 , ]) {
#     # cluster <- taxonomy[taxonomy$cluster == row$cluster, ]
#     # cluster <- data.frame(string=as.character(cluster[["string"]]), cluster=as.numeric(cluster[["distanceToCenter"]]))
#     # cloud <- wordcloud2(cluster, size=0.5)
#     View(row)
#
#   }

  # for (clusterID in hierarchy$cluster) {
  #     cluster <- taxonomy[taxonomy$cluster == clusterID, ]
  #     cluster <- data.frame(string=as.character(cluster[["string"]]), cluster=as.numeric(cluster[["distanceToCenter"]]))
  #     cloud <- wordcloud2(cluster, size=0.5)
  #     print(cluster[cluster$distanceToCenter == 0,])
      # newFile <- paste(cluster[cluster$distanceToCenter == 0,]$string, ".pdf", sep = "")
      # print(newFile)
#       saveWidget(cloud,"tmp.html",selfcontained = F)
#       webshot("tmp.html",newFile, delay =5, vwidth = 480, vheight=480)



