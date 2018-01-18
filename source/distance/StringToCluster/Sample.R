library(parallel)

StoC.Sample <- function(str, cluster, clusterHierarchy, clusterTaxonomy, distanceMatrix) {
  cluster <- clusterTaxonomy[clusterTaxonomy$cluster == as.character(cluster), ]$string

  clusterLength <- length(cluster)

  if(clusterLength > 30) {
    clusterLength = 30
  }

  cluster <- sample(cluster, clusterLength, replace = FALSE)

  dedicatedCores <- detectCores() - 1
  parallelWorker <- makeCluster(dedicatedCores)

  clusterExport(parallelWorker, varlist = c("distanceMatrix", "str"), envir = environment())


  distances <- parSapply(
    parallelWorker,
    cluster,
    function(stringA) {
      distanceMatrix[ str, stringA ]
    }
  )
  stopCluster(parallelWorker)

  median(distances)
}

# StoC.Sample("Bodenwischer", 69, clusterResult[["hierarchy"]], clusterResult[["taxonomy"]], distanceMatrix)
