
memory.loadDistanceMatrix <- function(filename) {
  filePath <- paste("data/distanceMatrix/", filename, sep="")
  distanceMatrix <- read.csv2(filePath, header=TRUE)
  row.names(distanceMatrix) <- distanceMatrix[[1]]
  distanceMatrix[[1]] <- NULL
  return(distanceMatrix)
}

memory.saveDistanceMatrix <- function(filename, distanceMatrix) {
  filePath <- paste("data/distanceMatrix/", filename, sep="")
  write.csv2(distanceMatrix, filePath)
}
