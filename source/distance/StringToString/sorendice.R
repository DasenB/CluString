
StoS.SorenDice <- function(a, b) {
  x <- unique( substring(a, seq(1,nchar(a),1), seq(1,nchar(a),1)) )
  y <- unique( substring(b, seq(1,nchar(b),1), seq(1,nchar(b),1)) )
  wordlaengen <- length(a) + length(b)
  schnittmenge <- 2*length(union(x, y))
  similarity <- schnittmenge/wordlaengen
  return(similarity)
}
