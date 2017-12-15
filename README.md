# Clustring


# 0. Datenstrukturen

## wordlist : Vector

```r
wordlist <- c("Haus", "Graus", "Flugzeug")
```

## distanceMatrix : Matrix

|       | word1 | word2 | word3 |
|-------|-------|-------|-------|
| word1 | 0     | x     | y     |
| word2 | x     | 0     | z     |
| word3 | y     | z     | 0     |



## hierarchy  : Dataframe

|   cluster   | partOf  | center | sumOfDistances |  count  |
|-------------|---------|--------|----------------|---------|
| integer ≠ 0 | integer | string | double         | integer |

## taxonomy : Dataframe

| string  | cluster  | distanceToCenter |
|---------|----------|------------------|
| string  | integer  | double           |


# 1. Vocabulary

A list of words is generated from an inputfile.

```r
vocabulary( filename, ?size ) -> wordlist
```

# 2. Preprocess

To prevent redundant computation a matrix containing the stringdistances is precomputed.
The measure of stringdistance can be chosen.

```r
preprocess(wordlist, distanceFunction) -> distanceMatrix
```

### String to String Distance Functions
  1. Levenshtein
  2. Damerau–Levenshtein
  3. Sørensen–Dice
  4. Longest common substring
  5. Jaro–Winkler
  6. 2-Gram
  7. 3-Gram
  8. 4-Gram


# 3. Cluster

Similar strings are aggregated in clusters by a chosen clustering-algorithm.

```r
cluster(distanceMatrix, clusterFunction, ?recenterFunction, ?stringToClusterDistanceFunction, ?clusterToClusterDistanceFunction, ?kMeans) -> list(taxonomy=taxonomy, hierarchy=hierarchy)
```

### Cluster Functions
  1. Lloyd-Algorithm (k-means)
  2. MacQueen’s Algorithm (k-means)
  3. SingleLink (hierarchical)
  4. Ward (hierarchical)
  5. Divisive Analysis Clustering (hierarchical)

### Recenter Functions
  1. Optimal
  2. Heuristical.1 (Pick best from 30 random elements)
  3. Heuristical.2 (Pick best from 30 strings closest to current center)
  4. Generative (Generate a string that represents the clusters mean)
  
### String to Cluster Distance Functions
  1. use center
  2. use mean of random sample
  3. use mean of all strings
  4. Generative (Generate a string that represents the clusters mean)
  
### Cluster to Cluster Distance Functions
  1. use center
  2. use mean of random sample
  3. use mean of all strings
  4. Generative (Generate a string that represents the clusters mean)

# 4. Display
  1. Dendogram
  2. TagSphere
  3. TagPie

```r
displayCluster(taxonomy, hierarchy) -> {}
```

```r
loadLookuptable <- function(file) { return( data.frame ) }
```

```r
saveLookuptable <- function(file) { }
```
