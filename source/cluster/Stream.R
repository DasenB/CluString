
Cluster.Stream <- function(distanceMatrix, recenterFunction, ...) {

  arguments <- list(...)

  bias <- 3
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

  wordlist <- colnames(distanceMatrix)

  taxonomy <- data.frame(
    string=wordlist,
    cluster=0,
    distanceToCenter=0
  )

  hierarchy <- data.frame(
    cluster=1,
    partOf=0,
    center=0,
    variance=0,
    sumOfSquares=0,
    count=1
  )

  counter = 1

  for (word in wordlist) {

    if(counter == 1) {
      hierarchy[hierarchy$cluster == 1, ]$center <- word
    }

    distanceThreashold <- bias + 1
    bestFit <- -1


    # Find
    for(cl in hierarchy$cluster) {

      clNr <- as.numeric(cl$cluster)

      distance <- StC(word, clNr, hierarchy, taxonomy, distanceMatrix)

      if(distance < distanceThreashold) {
        distanceThreashold <- distance
        bestFit <- clNr
      }
    }

    if(bestFit == -1) {
      newLine <- data.frame(
        cluster=clNr,
        partOf=0,
        center=word,
        variance=0,
        sumOfSquares=0,
        count=1
      )

      hierarchy <- rbind(hierarchy, newLine)
      taxonomy[taxonomy$string == word, ]$cluster <- clNr
    } else {
      taxonomy[taxonomy$string == word, ]$cluster <- clNr
      hierarchy
    }


    hierarchy <- recenterFunction(taxonomy, hierarchy, distanceMatrix)

    counter = counter + 1
  }


}
