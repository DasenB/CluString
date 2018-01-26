
locations <- function(size) {

  path <- "data/location/GEO-AZ.csv"

  wordTable <- read.table( path, sep=",", quote="")

  words <- wordTable$V1

  if(!is.null(size)) {
    if(size > nrow(wordTable)) {
      print("Error: Samplesize is bigger than the number of provided words.")
    } else {
      words <- sample(wordTable$V1, size, replace = F)
    }
  }

  return(words)
}
