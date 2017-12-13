# Textmining
Clustern von Strings auf Basis von Substrings.


# 0. Datenstrukturen

```r
words <- c("word1", "word2")
cluster <- Cluster(strings=words, children=c(), silblings=c())
```

# 1. Wortschatz

```r
wortschatz <- function(language, size) { return( words ) }
```
# 2. Abstandsmaß

  1. Editierdistanz nach Levenshtein
  2. Damerau–Levenshtein distance
  3. Sørensen–Dice coefficient
  4. Longest common substring
  5. Jaro–Winkler distance
  6. 2-Gramme
  7. 3-Gramme
  8. 4-Gramme

```r
stringDistance <- function(stringA, stringB) { return( [0.0, 1.0] ) }
```

# 3. Clustering
  1. Lloyd-Algorithmus (k-Means)
  2. MacQueen’s Algorithmus (k-Means)
  3. SingleLink (Hierarchisch)
  4. Ward (Hierarchisch)
  5. Divisive Analysis Clustering (Hierarchisch)

```r
analyseCluster <- function(words, distanceFunction, kMeans) { return( cluster ) }
```

# 4. Display
  1. Dendogram
  2. ?

```r
displayCluster <- function(cluster) {}
```

# I. Preprocess

Die Abstandsmaße werden vor dem Clustern berechnet, um wiederholte Berechnung von Abstandsmaßen zu vermeiden.

# II. Lookuptable

Um einen Datensatz nicht mehrfach preprocessen zu müssen, lassen sich die Daten abspeichern und laden.

```r
loadLookuptable <- function(file) { return( data.frame ) }
```

```r
saveLookuptable <- function(file) { }
```