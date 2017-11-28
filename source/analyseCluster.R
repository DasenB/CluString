
Lloyd <- function(words, k, varianz){
  
  # Choose k random centerwords
  centers = sample(words, k, rep=F)
  setdiff(words, centers)
  
  
  
  
  
  # kmeans(selectedData(), 2)
}

words <- c("abc", "bbc", "abb", "wqr", "wrq")

result <- Lloyd(words, 4)