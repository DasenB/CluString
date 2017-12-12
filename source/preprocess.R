rm(list = ls(.GlobalEnv), envir = .GlobalEnv)

setwd("source")
source("stringDistance.R")
source("wortschatz.R")


preprocess <- function(words) {  
  wordA <- c()
  wordB <- c()
  levenshtein <- c()
  sorendice <- c()
  longestcommonsubstring <- c()
  jarowinkler <- c()
  dameraulevenshtein <- c()
  zweiGramme <- c()
  dreiGramme <- c()
  vierGramme <- c()
  
  testWord <- "Landzuteilungen"
  
  for (word in words) {
    wordA <- append(wordA, testWord)
    wordB <- append(wordB, word)
    levenshtein <- append(levenshtein, dist.levenshtein(word, testWord))
    sorendice <- append(sorendice, dist.sorendice(word, testWord))
    longestcommonsubstring <- append(longestcommonsubstring, dist.longestcommonsubstring(word, testWord))
    jarowinkler <- append(jarowinkler, dist.jarowinkler(word, testWord))
    dameraulevenshtein <- append(dameraulevenshtein, dist.dameraulevenshtein(word, testWord))
    nGramLenght <- 2
    zweiGramme <- append(zweiGramme, dist.ngramme(word, testWord))
    nGramLenght <- 3
    dreiGramme <- append(dreiGramme, dist.ngramme(word, testWord))
    nGramLenght <- 4
    vierGramme <- append(vierGramme, dist.ngramme(word, testWord))
  }
  
  lookuptable <- data.frame(wordA = wordA, wordB = wordB, levenshtein = levenshtein, sorendice = sorendice, longestcommonsubstring = longestcommonsubstring, jarowinkler = jarowinkler, dameraulevenshtein = dameraulevenshtein, zweiGramme=zweiGramme, dreiGramme=dreiGramme, vierGramme=vierGramme)

  return(lookuptable)  
}

system.time( wordList <- wortschatz(1000) )
system.time( lookuptable <- preprocess(wordList) )

m <- expand.grid(wordList, wordList)

View(m)

View(lookuptable)
