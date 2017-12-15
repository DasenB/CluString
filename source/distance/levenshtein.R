library('stringdist')

Levenshtein <- function(a, b) {
  return( stringdist(a, b, method="lv") )
}