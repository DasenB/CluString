library(parallel)

recenter.optimal <- function(taxonomy, hierarchy, distanceMatrix) {

    # Prepare parallelisation
    dedicatedCores <- detectCores() - 1
    parallelWorker <- makeCluster(dedicatedCores)

    # Parallel recenter all clusters
    for(n in clusterNames) {

      cluster <- taxonomy[taxonomy$cluster == as.character(n),]$string

      if(length(cluster) == 0) {
        next
      }

      clusterExport(parallelWorker, "cluster")
      clusterExport(parallelWorker, varlist = "distanceMatrix")

      distanceSums <- parLapply(
        parallelWorker,
        cluster,
        function(stringA) {
          distancesToAllOtherStrings <- sapply( cluster , function(stringB) { distanceMatrix[[stringA, stringB]] })
          sum(distancesToAllOtherStrings)
        }
      )

      # print(length(distanceSums))
      newCenterWordIndex <- which.min(distanceSums)
      print(newCenterWordIndex)
      print(cluster[newCenterWordIndex])
      print(length(distanceSums))
      print("--------------------")
      # print(newCenterWordIndex)
      # hierarchy[hierarchy$cluster == n , ]$center <- cluster[[1]][[newCenterWordIndex]]
      hierarchy[hierarchy$cluster == n , ]$center <- cluster[newCenterWordIndex]
    }
    print("====================")

    # Stop parallelisation
    stopCluster(parallelWorker)

    return(hierarchy)

}
