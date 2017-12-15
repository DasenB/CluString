
loadCluster <- function(filename) {
  filePath <- paste("data/cluster/", filename, sep="")
  wordlist <- read.csv2(filePath)
  return(wordlist)
}

saveCluster <- function(filename, cluster) {
  filePath <- paste("data/cluster/", filename, sep="")
  write.csv2(cluster, filePath)
}
