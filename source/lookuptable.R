
loadLookuptable <- function(file) {
  filePath <- paste("../preprocessed/", file, sep="")
  table <- read.csv2(filePath)
  return(table)
}

saveLookuptable <- function(file, lookuptable) {
  filePath <- paste("../preprocessed/", file, sep="")
  write.csv2(lookuptable, filePath)
}
