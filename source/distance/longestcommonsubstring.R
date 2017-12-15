library('stringdist')

LongestCommonSubstring <- function(a, b) {
  return( stringdist(a, b, method="lcs"))
}