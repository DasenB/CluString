
loadDistanceMatrix <- function(filename) {
  filePath <- paste("data/distanceMatrix/", filename, sep="")
  wordlist <- read.csv2(filePath)
  return(wordlist)
}

saveDistanceMatrix <- function(filename, distanceMatrix) {
  filePath <- paste("data/distanceMatrix/", filename, sep="")
  write.csv2(distanceMatrix, filePath)
}
