source("source/clustring.R")

# 1. Selection
wordlist <- locations(200)

# 2. Preprocessing
distanceMatrix <- preprocess(wordlist, distanceFunction = StoS.TriGram)

# 3. Clustering
clusterResult <- Cluster.Lloyd(distanceMatrix, recenter.Optimal, k = 20)

#4. Visualize

View(clusterResult[["taxonomy"]])

display.tagpie(clusterResult[["taxonomy"]], clusterResult[["hierarchy"]], c(1:20))

display.mapDE(clusterResult[["taxonomy"]], clusterResult[["hierarchy"]], c(7))
