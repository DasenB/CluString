library('stringdist')

StoS.JaroWinkler <- function(a, b) {
  return( stringdist(a, b, method="jw") )
}
