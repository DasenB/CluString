
library('stringdist')

# 1. Editierdistanz nach Levenshtein
dist.levenshtein <- function(stringA, stringB) {
  return(stringdist(stringA,stringB, method="lv"))
}

# 2. Damerau–Levenshtein distance
dist.dameraulevenshtein <- function(stringA, stringB) {
  return(stringdist(stringA,stringB, method="dl"))
}

# 3. Sørensen–Dice coefficient
dist.sorendice <- function(stringA, stringB) {
  x <- unique( substring(stringA, seq(1,nchar(stringA),1), seq(1,nchar(stringA),1)) )
  y <- unique( substring(stringB, seq(1,nchar(stringB),1), seq(1,nchar(stringB),1)) )
  wordlaengen <- length(stringA) + length(stringB)
  schnittmenge <- 2*length(union(x, y))
  similarity <- schnittmenge/wordlaengen
  return(similarity)
}

# 4. Longest common substring
dist.longestcommonsubstring <- function(stringA, stringB) {
  return(stringdist(stringA,stringB, method="lcs"))
}

# 5. Jaro–Winkler distance
dist.jarowinkler <- function(stringA, stringB) {
  return(stringdist(stringA,stringB, method="jw"))
}

# N-Gramme
dist.ngramme <- function(stringA, stringB) {
  if(!exists("nGramLenght")){
    nGramLenght <- 2
  }
  return(stringdist(stringA,stringB, method="qgram", q=nGramLenght))
}
