library('stringdist')

StoS.UniGram <- function(a, b) {
  return( stringdist(a, b, method="qgram", q=1) )
}

StoS.BiGram <- function(a, b) {
  return( stringdist(a, b, method="qgram", q=2) )
}

StoS.TriGram <- function(a, b) {
  return( stringdist(a, b, method="qgram", q=3) )
}

StoS.FourGram <- function(a, b) {
  return( stringdist(a, b, method="qgram", q=4) )
}
