
StC.Representative <- function(str, cluster, clusterHierarchy, clusterTaxonomy, distanceMatrix) {

  center <- clusterHierarchy[clusterHierarchy$cluster == cluster, ]$center
  distance <- distanceMatrix[ str, center ]

  return(distance)
}

# StC.Representative("Gemme", 1, clusterResult$hierarchy, clusterResult$taxonomy, distanceMatrix)
