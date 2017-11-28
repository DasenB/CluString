mydata = read.table("wortschatz/deu_wikipedia_2016_1M-words.txt", sep="\t", quote="", colClasses = c(rep("NULL", 1),rep("character", 1), rep("NULL", 2)))


longestCommonSusbtring <- function(a, b) {
  aVec <- unlist(strsplit(a, ""))
  bVec <- unlist(strsplit(b, ""))
  lsc <- LCS(aVec, bVec)
  return(lsc$QSI)
}

longestCommonSusbtring("keks", "ke")
