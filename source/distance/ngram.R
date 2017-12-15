library('stringdist')

UniGram <- function(a, b) {
  return( stringdist(a, b, method="qgram", q=1) )
}

BiGram <- function(a, b) {
  return( stringdist(a, b, method="qgram", q=2) )
}

TriGram <- function(a, b) {
  return( stringdist(a, b, method="qgram", q=3) )
}

FourGram <- function(a, b) {
  return( stringdist(a, b, method="qgram", q=4) )
}
