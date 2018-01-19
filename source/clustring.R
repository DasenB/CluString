rm(list = ls(.GlobalEnv), envir = .GlobalEnv)

# String To String Distances
source("source/distance/StringToString/dameraulevenshtein.R")
source("source/distance/StringToString/jarowinkler.R")
source("source/distance/StringToString/levenshtein.R")
source("source/distance/StringToString/longestcommonsubstring.R")
source("source/distance/StringToString/ngram.R")
source("source/distance/StringToString/sorendice.R")

# String To Cluster Distances
source("source/distance/StringToCluster/Center.R")

# Cluster To Cluster Distances

# Recenter Functions
source("source/recenter/optimal.R")
source("source/recenter/random.R")
source("source/recenter/heuristical.R")

# Pipe
source("source/pipe/vocabulary.R")
source("source/pipe/preprocess.R")

# Storage
source("source/memory/wordlist.R")
source("source/memory/distanceMatrix.R")
source("source/memory/cluster.R")

# Cluster
source("source/cluster/Lloyd.R")
source("source/cluster/Stream.R")

# Display
source("source/display/wordcloud.R")
