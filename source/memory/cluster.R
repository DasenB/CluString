
memory.loadCluster <- function(filename) {
  filePath <- paste("data/cluster/", filename, sep = "")
  taxonomy <- read.csv2(paste(filePath,"/taxonomy.csv", sep=""))
  hierarchy <- read.csv2(paste(filePath,"/hierarchy.csv", sep=""))
  return( list(hierarchy=hierarchy, taxonomy=taxonomy) )
}

memory.saveCluster <- function(filename, cluster) {
  filePath <- paste("data/cluster/", filename, sep = "")

  if(!dir.exists(filePath)) {
    dir.create(filePath, showWarnings = TRUE, recursive = FALSE, mode = "0777")
  }

  write.csv2(cluster[["taxonomy"]], file=paste(filePath,"/taxonomy.csv", sep=""))
  write.csv2(cluster[["hierarchy"]], file=paste(filePath,"/hierarchy.csv", sep=""))
}
