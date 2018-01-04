
loadWordlist <- function(filename) {
  filePath <- paste("data/wordlist/", filename, sep="")
  wordlist <- read.csv2(filePath)
  return(as.character(wordlist$x))
}

saveWordlist <- function(filename, wordlist) {
  filePath <- paste("data/wordlist/", filename, sep="")
  write.csv2(wordlist, filePath)
}
