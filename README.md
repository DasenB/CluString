# CluString

![ScreenShot](docs/FlowChart.png?raw=true)


# 0. Datastructures

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
  2. Random: (Pick best from 30 random elements)
  3. Heuristical: (Pick best from 30 strings closest to current center)

### String to Cluster Distance Functions
  1. Center: use center
  2. Sample: use mean of random sample
  3. Full: use mean of all strings

### Cluster to Cluster Distance Functions
  1. Center: use center
  2. Sample: use mean of random sample
  3. Full: use mean of all strings

# 4. Display

```r
displayCluster(taxonomy, hierarchy) -> {}
```

  1. Dendogram
  2. TagSphere
  3. TagPie
