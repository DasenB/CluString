library(parallel)

StoC.Full <- function(str, cluster, clusterHierarchy, clusterTaxonomy, distanceMatrix) {

  cluster <- clusterTaxonomy[clusterTaxonomy$cluster == as.character(cluster), ]$string

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

# StoC.Full("Bodenwischer", 69, clusterResult[["hierarchy"]], clusterResult[["taxonomy"]], distanceMatrix)
