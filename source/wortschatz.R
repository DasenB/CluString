# wortschatz <- function(language, size) {
#   return(words) 
# }

wortschatz <- function(size) {
  allWords <- read.table("../wortschatz/deu_wikipedia_2016_1M-words.txt", sep="\t", quote="", colClasses = c(rep("NULL", 1),rep("character", 1), rep("NULL", 2)))
  words <- sample(allWords$V2, size, replace = F)
  return(words)
}

