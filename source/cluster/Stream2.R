
Stream <- function(distanceMatrix, recenterFunction, ...) {

  # Read optional parameters
  arguments <- list(...)

  bias <- 4
  StC <- NULL
  maxSize <- NULL

  if(!is.null(arguments$bias)) {
    bias <- arguments$bias
  } else {
    print("Warning: Stream() Bias not set. Defaults to bias=3")
  }

  if(!is.null(arguments$StC)) {
    StC <- arguments$StC
  } else {
    print("Error: Stream() No StC function specified.")
    return(NULL)
  }

  if(!is.null(arguments$maxSize)) {
    maxSize <- arguments$maxSize
  }


  # Create Cluster Tables

  wordlist <- colnames(distanceMatrix)

  taxonomy <- data.frame(
    string=wordlist,
    cluster=0,
    distanceToCenter=0
  )

  hierarchy <- data.frame(
    cluster=integer(),
    partOf=integer(),
    center=character(),
    variance=double(),
    sumOfSquares=double(),
    count=integer()
  )

  # Find best fitting cluster for each word
  for(word in wordlist) {

    # Look at each cluster to determine the best

    bestCluster = -1
    bestDistance = bias

    for(clusterId in hierarchy$cluster) {

      distance <- StC(word, clusterId, hierarchy, taxonomy, distanceMatrix)

      if (distance < bestDistance) {
        bestDistance <- distance
        bestCluster <- clusterId
      }
    }

    # If no good cluster has been found, create a new one
    if(bestCluster == -1) {

      newClusterId <- max(hierarchy$cluster) + 1

      newCluster <- data.frame(
        cluster=newClusterId,
        partOf=0,
        center=word,
        variance=0,
        sumOfSquares=0,
        count=1
      )

      hierarchy <- rbind(hierarchy, newCluster)

    } else {
      hierarchy[hierarchy$cluster == bestCluster, ]$sumOfSquares <- hierarchy[hierarchy$cluster == bestCluster, ]$sumOfSquares + (bestDistance^2)
      hierarchy[hierarchy$cluster == bestCluster, ]$count <- hierarchy[hierarchy$cluster == bestCluster, ]$count + 1
      taxonomy[taxonomy$string == word, ]$cluster <- bestCluster
      taxonomy[taxonomy$string == word, ]$distanceToCenter <- bestDistance
      hierarchy <- recenterFunction(taxonomy, hierarchy, distanceMatrix)
    }

  }

  return( list(hierarchy=hierarchy, taxonomy=taxonomy) )
}
