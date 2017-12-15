
preprocess <- function(words, distanceFunction) {

  distanceMatrix <- outer(words, words , FUN=function(a, b) distanceFunction(a, b) )
  colnames(distanceMatrix) <- words
  rownames(distanceMatrix) <- words
  return(distanceMatrix)

}
