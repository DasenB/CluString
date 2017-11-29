
library('stringdist')

# 1. Editierdistanz nach Levenshtein
dist.levenshtein <- function(stringA, stringB) {
  return(stringdist(stringA,stringB, method="lv"))
}

# 3. Sørensen–Dice coefficient
dist.sorendice <- function(stringA, stringB) {
  # todo
  return(0.0)
}

# 4. Longest common substring
dist.longestcommonsubstring <- function(stringA, stringB) {
  return(stringdist(stringA,stringB, method="lcs"))
}

# 5. Jaro–Winkler distance
dist.jarowinkler <- function(stringA, stringB) {
  return(stringdist(stringA,stringB, method="jw"))
}

# 2. Damerau–Levenshtein distance
dist.dameraulevenshtein <- function(stringA, stringB) {
  return(stringdist(stringA,stringB, method="dl"))
}
