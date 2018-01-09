library(parallel)

recenter.Heuristical <- function(taxonomy, hierarchy, distanceMatrix) {

  # Prepare parallelisation
  dedicatedCores <- detectCores() - 1
  parallelWorker <- makeCluster(dedicatedCores)

  # Parallel recenter all clusters
  for(n in hierarchy$cluster) {

    clusterTaxonomyTable <- taxonomy[taxonomy$cluster == as.character(n),]

    clusterSize <- length(clusterTaxonomyTable$string)

    if(clusterSize > 30) {
      clusterSize <- 30
    }

    cluster <<- taxonomy[order(taxonomy$distanceToCenter,decreasing=F)[1:clusterSize],]$string

    cluster <<- append(cluster, as.character(hierarchy[hierarchy$cluster == as.character(n), ]$center))
    cluster <<- unique(cluster)

    if(length(cluster) == 0) {
      next
    }

    clusterExport(parallelWorker, varlist = c("distanceMatrix", "cluster"), envir = .GlobalEnv)

    distanceSums <- parLapply(
      parallelWorker,
      cluster,
      function(stringA) {
        distancesToAllOtherStrings <- sapply( cluster , function(stringB) { distanceMatrix[[stringA, stringB]] * distanceMatrix[[stringA, stringB]] })
        sum(distancesToAllOtherStrings)
      }
    )

    newCenterWordIndex <- which.min(distanceSums)
    # hierarchy[hierarchy$cluster == n , ]$center <- cluster[[1]][[newCenterWordIndex]] ## vermutlich nicht error save
    hierarchy[hierarchy$cluster == n , ]$center <- cluster[newCenterWordIndex]
    hierarchy[hierarchy$cluster == n , ]$sumOfSquares <- distanceSums[[newCenterWordIndex]]
  }

  # Stop parallelisation
  stopCluster(parallelWorker)
  return(hierarchy)

}

