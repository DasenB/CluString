library('stringdist')

uniGram <- function(a, b) {
  return( stringdist(a, b, method="qgram", q=1) )
}

biGram <- function(a, b) {
  return( stringdist(a, b, method="qgram", q=2) )
}

triGram <- function(a, b) {
  return( stringdist(a, b, method="qgram", q=3) )
}

fourGram <- function(a, b) {
  return( stringdist(a, b, method="qgram", q=4) )
}
