rm(list = ls(.GlobalEnv), envir = .GlobalEnv)

setwd("source")
source("stringDistance.R")
source("wortschatz.R")


preprocess <- function(words) {  
  print("preprocess for: ")
  
  wordlist <- expand.grid(words, words)
  
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
  
  rowcount <- NROW(wordlist)
  for (i in 1:rowcount) {
    if(i %% 4096 == 0) {
      str <- paste(i, " von ", rowcount, sep="")
      print(str)
    }
    wordA <- append(wordA, wordlist[i][0])
    wordB <- append(wordB, wordlist[i][1])
    levenshtein <- append(levenshtein, dist.levenshtein(wordlist[i][0], wordlist[i][1]))
    sorendice <- append(sorendice, dist.sorendice(wordlist[i][0], wordlist[i][1]))
    longestcommonsubstring <- append(longestcommonsubstring, dist.longestcommonsubstring(wordlist[i][0], wordlist[i][1]))
    jarowinkler <- append(jarowinkler, dist.jarowinkler(wordlist[i][0], wordlist[i][1]))
    dameraulevenshtein <- append(dameraulevenshtein, dist.dameraulevenshtein(wordlist[i][0], wordlist[i][1]))
    nGramLenght <- 2
    zweiGramme <- append(zweiGramme, dist.ngramme(wordlist[i][0], wordlist[i][1]))
    nGramLenght <- 3
    dreiGramme <- append(dreiGramme, dist.ngramme(wordlist[i][0], wordlist[i][1]))
    nGramLenght <- 4
    vierGramme <- append(vierGramme, dist.ngramme(wordlist[i][0], wordlist[i][1]))
  }
  
  lookuptable <- data.frame(wordA = wordA, wordB = wordB, levenshtein = levenshtein, sorendice = sorendice, longestcommonsubstring = longestcommonsubstring, jarowinkler = jarowinkler, dameraulevenshtein = dameraulevenshtein, zweiGramme=zweiGramme, dreiGramme=dreiGramme, vierGramme=vierGramme)
  
  return(lookuptable)  
}



words <- wortschatz(1000)

system.time( lookuptable <- preprocess(words) )




