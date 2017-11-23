# 1. Editierdistanz nach Levenshtein
levenshtein <- function(stringA, stringB) {
  return (stringdist(stringA,stringB, method="lv"))
}

# 2. Damerau–Levenshtein distance
dameraulevenshtein <- function(stringA, stringB) {
  return (stringdist(stringA,stringB, method="dl"))
}

# 3. Sørensen–Dice coefficient
#todo
# 4. Longest common substring
longestcommonsubstring <- function(stringA, stringB) {
  return (stringdist(stringA,stringB, method="lcs"))
}

# 5. Jaro–Winkler distance
longestcommonsubstring <- function(stringA, stringB) {
  return (stringdist(stringA,stringB, method="jw"))
}





dameraulevenshtein("haasdflo", "halo")