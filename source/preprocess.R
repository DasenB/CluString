rm(list = ls(.GlobalEnv), envir = .GlobalEnv)

source("stringDistance.R")
source("wortschatz.R")


words <- wortschatz(100)

wordA <- c()
wordB <- c()
levenshtein <- c()
sorendice <- c()
longestcommonsubstring <- c()
jarowinkler <- c()
dameraulevenshtein <- c()

testWord <- "Telemetrie"
for (word in words) {
  wordA <- c(wordA, testWord)
  wordB <- c(wordB, word)
  levenshtein <- c(levenshtein, dist.levenshtein(word, testWord))
  sorendice <- c(sorendice, dist.sorendice(word, testWord))
  longestcommonsubstring <- c(longestcommonsubstring, dist.longestcommonsubstring(word, testWord))
  jarowinkler <- c(jarowinkler, dist.jarowinkler(word, testWord))
  dameraulevenshtein <- c(dameraulevenshtein, dist.dameraulevenshtein(word, testWord))
}

lookuptable <- data.frame(wordA = wordA, wordB = wordB, levenshtein = levenshtein, sorendice = sorendice, longestcommonsubstring = longestcommonsubstring, jarowinkler = jarowinkler, dameraulevenshtein = dameraulevenshtein)

View(lookuptable)