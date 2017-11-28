# 1. Editierdistanz nach Levenshtein
levenshtein <- function(stringA, stringB) {
  return(stringdist(stringA,stringB, method="lv"))
}

# 3. Sørensen–Dice coefficient
sorendice <- function(stringA, stringB) {
  # todo
  return(NULL)
}

# 4. Longest common substring
longestcommonsubstring <- function(stringA, stringB) {
  return(stringdist(stringA,stringB, method="lcs"))
}

# 5. Jaro–Winkler distance
jarowinkler <- function(stringA, stringB) {
  return(stringdist(stringA,stringB, method="jw"))
}

# 2. Damerau–Levenshtein distance
dameraulevenshtein <- function(stringA, stringB) {
  return(stringdist(stringA,stringB, method="dl"))
}
