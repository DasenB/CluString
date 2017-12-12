rm(list = ls(.GlobalEnv), envir = .GlobalEnv)

source("Cluster.R")
source("stringDistance.R")
source("wortschatz.R")



# TEST Cluster
# words <- wortschatz(100)
# 
# result <- Lloyd(words, 2, levenshtein)


# Benchmark stringDistance
words <- wortschatz(100)

distance <- c()

for (word in words) {
  distance <- c(distance, dist.levenshtein(word, "Telemetrie"))
}

print("done")
View(distance)
