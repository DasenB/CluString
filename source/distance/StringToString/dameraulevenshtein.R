library('stringdist')

StoS.DamerauLevenshtein <- function(a, b) {
  return( stringdist(a, b, method="dl") )
}
