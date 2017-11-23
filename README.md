# Textmining
Clustering words based on substrings.


# 0. Datenstrukturen

```r
words <- c("word1", "word2")
cluster <- c("word1", "word2", c("word3", "word4"), c("word5", c("word6")) )
```

# 1. Wortschatz

```r
wortschatz <- function(language, size) { words }
```
# 2. Abstandsmaß

  1. Editierdistanz nach Levenshtein
  2. Damerau–Levenshtein distance
  3. Sørensen–Dice coefficient
  4. Longest common substring
  5. Jaro–Winkler distance

```r
stringDistance <- function(stringA, stringB) { return [0.0, 1.0]}
```

# 3) Clustering
  1. Lloyd-Algorithmus (k-Means)
  2. MacQueen’s Algorithmus (k-Means)
  3. SingleLink (Hierarchisch)
  4. Ward (Hierarchisch)
  5. Divisive Analysis Clustering (Hierarchisch)

```r
analyseCluster <- function(kMeans, words) { return cluster }
```

# 4) Display
  1. Dendogram
  2. ?

```r
displayCluster <- function(cluster) {}
```

