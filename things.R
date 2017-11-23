files <- list.files(path="path/to/dir", pattern="wiki*", full.names=T, recursive=FALSE)

lapply(files, function(inputFile) {
  con  <- file(inputFile, open = "r")
  
  counter <- 0
  while (counter < 2000 && length(oneLine <- readLines(con, n = 1, warn = FALSE)) > 0) {
    print(oneLine)
    counter <- counter + 1
  } 
  print(counter)
  close(con)
})



# inputFile <- "sample.txt"
# con  <- file(inputFile, open = "r")
# 
# counter <- 0
# while (counter < 2000 && length(oneLine <- readLines(con, n = 1, warn = FALSE)) > 0) {
#   print(oneLine)
#   counter <- counter + 1
# } 
# print(counter)
# close(con)

longestCommonSusbtring <- function(a, b) {
  aVec <- unlist(strsplit(a, ""))
  bVec <- unlist(strsplit(b, ""))
  lsc <- LCS(aVec, bVec)
  return(lsc$QSI)
}

longestCommonSusbtring("keks", "ke")