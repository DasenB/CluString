
vocabulary <- function(filename, size) {
  
  path <- paste("data/vocabulary/", filename, sep="")
  
  wordTable <- read.table( path, sep="\t", quote="", colClasses = c(rep("NULL", 1),rep("character", 1), rep("NULL", 2)))
  
  words <- wordTable$V2
  
  if(!is.null(size)) {
    if(size > nrow(wordTable)) {
      print("Error: Samplesize is bigger than the number of provided words.")
    } else {
      words <- sample(wordTable$V2, size, replace = F)
    }
  }
  
  return(words)
}
