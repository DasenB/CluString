rm(list = ls(.GlobalEnv), envir = .GlobalEnv)

setwd("source")
source("stringDistance.R")
source("wortschatz.R")

preprocess <- function(words) {
  print("preprocess apply: ")
  wordlist <- expand.grid(words, words)
  print("   - finished expand.grid ...")
  
  wordlist$levenshtein <- apply(wordlist,1,function(row) dist.levenshtein(row[1], row[2]))
  print("   - finished levenshtein")
  
  wordlist$sorendice <- apply(wordlist,1,function(row) dist.sorendice(row[1], row[2]))
  print("   - finished sorendice")
  
  wordlist$longestcommonsubstring <- apply(wordlist,1,function(row) dist.longestcommonsubstring(row[1], row[2]))
  print("   - finished longestcommonsubstring")
  
  wordlist$jarowinkler <- apply(wordlist,1,function(row) dist.jarowinkler(row[1], row[2]))
  print("   - finished jarowinkler")
  
  wordlist$dameraulevenshtein <- apply(wordlist,1,function(row) dist.dameraulevenshtein(row[1], row[2]))
  print("   - finished dameraulevenshtein")
  
  nGramLenght <- 2
  wordlist$zweiGramme <- apply(wordlist,1,function(row) dist.ngramme(row[1], row[2]))
  print("   - finished zweiGramme")
  
  nGramLenght <- 3
  wordlist$dreiGramme <- apply(wordlist,1,function(row) dist.ngramme(row[1], row[2]))
  print("   - finished dreiGramme")
  
  nGramLenght <- 4
  wordlist$vierGramme <- apply(wordlist,1,function(row) dist.ngramme(row[1], row[2]))
  print("   - finished vierGramme")
  
  print("Done")
  
  return(wordlist)
}

words <- wortschatz(1000)

system.time(lookuptable <- preprocess(words))

write.table(lookuptable, "../preprocessed/lookuptable.csv")