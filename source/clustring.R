# rm(list = ls(.GlobalEnv), envir = .GlobalEnv)

# String Distances
source("source/distance/dameraulevenshtein.R")
source("source/distance/jarowinkler.R")
source("source/distance/levenshtein.R")
source("source/distance/longestcommonsubstring.R")
source("source/distance/ngram.R")
source("source/distance/sorendice.R")

# Pipe
source("source/pipe/vocabulary.R")
source("source/pipe/preprocess.R")

# Storage
source("source/storage/wordlist.R")
source("source/storage/distanceMatrix.R")
source("source/storage/cluster.R")

# Cluster
source("source/cluster/Lloyd.R")
