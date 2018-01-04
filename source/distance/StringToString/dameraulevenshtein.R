library('stringdist')

DamerauLevenshtein <- function(a, b) {
  return( stringdist(a, b, method="dl") )
}
