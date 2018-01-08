library(parallel)

Lloyd <- function(distanceMatrix, recenterFunction, k){

  # Check if k parameter was supplied
  if(missing(k)) {
    k <- 2
  }

  # get wordlist from distanceMatrix
  wordlist <- colnames(distanceMatrix)

  # Select random centers
  randomCenters <- sample(wordlist, k, replace = FALSE)
  clusterNames=c(1:k)
  center=randomCenters

  # Create taxonomy table
  taxonomy <- data.frame(
    string=wordlist,
    cluster=0,
    distanceToCenter=0
  )

  # define columntypes for taxonomy table
  taxonomy$string <- as.character(taxonomy$string)
  taxonomy$cluster <- as.integer(taxonomy$cluster)
  taxonomy$distanceToCenter <- as.numeric(taxonomy$distanceToCenter)

  # Create hierarchy table with k clusters
  hierarchy <- data.frame(
    cluster=clusterNames,
    partOf=0,
    center=center,
    variance=0,
    sumOfSquares=0,
    count=1
  )

  # define columntypes for hierarchy table
  hierarchy$center <- as.character(hierarchy$center)
  hierarchy$cluster <- as.integer(hierarchy$cluster)
  hierarchy$variance <- as.numeric(hierarchy$variance)
  hierarchy$sumOfSquares <- as.numeric(hierarchy$sumOfSquares)
  hierarchy$count <- as.integer(hierarchy$count)

  # Update taxonomy table to contain the clusternumber for the randomly selected center-words
  apply( hierarchy, 1, function(row) { taxonomy[ taxonomy$string == row[["center"]], ]$cluster <<- as.integer(row[["cluster"]]) } )

  for( iteration in 0:10) {

      # Add each word (exept the centers) to the cluster for which the variance is increased the least
      apply(
        taxonomy,
        1,
        function(row) {
          string <- row[["string"]]

          if(string %in% hierarchy$center) {
            return
          }

          currentOfCluster <- as.numeric(row[["cluster"]])
          if(currentOfCluster != 0) {
            hierarchy[hierarchy$cluster == currentOfCluster, ]$count <<- hierarchy[hierarchy$cluster == currentOfCluster, ]$count - 1
            hierarchy[hierarchy$cluster == currentOfCluster, ]$sumOfSquares <<- hierarchy[hierarchy$cluster == currentOfCluster, ]$sumOfSquares - as.numeric(row[["distanceToCenter"]])^2
          }

          edges <- apply(hierarchy, 1, function(cluster) {
            distance <- distanceMatrix[ string, cluster[["center"]] ]
            # sumOfSquares <- distance^2
            # variance <- sqrt((as.numeric(cluster[["sumOfSquares"]]) + sumOfSquares)/(as.numeric(cluster[["count"]]) + 1))
            # error <- variance - as.numeric(cluster[["variance"]])
            # clust <- cluster[["cluster"]]
            # list(distance=distance, sumOfSquares=sumOfSquares, variance=variance, error=error, cluster=clust)
            list(distance=distance)
          })

          # errors <- lapply(edges, function(item) { item$error })
          errors <- lapply(edges, function(item) { item$distance })
          closestCluster <- which.min(errors)

          if(length(closestCluster) == 0) {
            print("ERROR: Can't Cluster, because for some reason the cluster with lowest can't be determined.")
            print(paste("String: \"", string, "\" can't be compared with cluster centers"))
            exit(1)
          }

          distance <- edges[[closestCluster]]$distance
          taxonomy[taxonomy$string == string, ]$cluster <<- closestCluster
          taxonomy[taxonomy$string == string, ]$distanceToCenter <<- distance
          hierarchy[hierarchy$cluster == closestCluster, ]$count <<-  hierarchy[hierarchy$cluster == closestCluster, ]$count + 1
          hierarchy[hierarchy$cluster == closestCluster, ]$sumOfSquares <<- hierarchy[hierarchy$cluster == closestCluster, ]$sumOfSquares + (distance^2)
        }
      )

      hierarchy <<- recenterFunction(taxonomy, hierarchy, distanceMatrix)

      print(paste("Finished iteration", iteration))
      # end of iteration
  }

  return( list(hierarchy=hierarchy, taxonomy=taxonomy) )
}

# clusterResult <- Lloyd(distanceMatrix, recenter.optimal, 200)

