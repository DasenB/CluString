library(parallel)

recenter.optimal <- function(taxonomy, hierarchy, distanceMatrix) {

    # Prepare parallelisation
    dedicatedCores <- detectCores() - 1
    parallelWorker <- makeCluster(dedicatedCores)

    # Parallel recenter all clusters
    for(n in hierarchy$cluster) {

      cluster <<- taxonomy[taxonomy$cluster == as.character(n),]$string

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
