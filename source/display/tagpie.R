display.tagpie <- function(taxonomy, hierarchy, outDir){

  newPath <- paste("data/display/tagpie/", outDir, sep = "")

  if(!dir.exists(newPath)){
    dir.create(newPath, showWarnings = TRUE, recursive = FALSE, mode = "0777")
  }

  TagPieDataString <- "var data = {\n"

  # for(i in 1:max(as.numeric(hierarchy$cluster))) {
  for(i in 1:50) {
  # for(i in 64:64) {

    if(length(taxonomy[taxonomy$cluster == i, ]$string) == 0) {
      next()
    }

    TagPieDataString <- paste0(TagPieDataString, "'cluster-", i,"': [{")
    TagPieDataString <- paste0(TagPieDataString, "'major': { 'key': '", as.character(hierarchy[hierarchy$cluster == i, ]$center), "', 'value': 20 },")

    TagPieDataString <- paste0(TagPieDataString, "'data': [")

    for(string in taxonomy[taxonomy$cluster == i, ]$string) {
      # if(as.character(hierarchy[hierarchy$cluster == i, ]$center) == string) {
      #   next()
      # }
      TagPieDataString <- paste0(TagPieDataString, "{'key': '", string, "', 'value': 10 },")

    }
    TagPieDataString <- substr(TagPieDataString,1,nchar(TagPieDataString)-1)
    TagPieDataString <- paste0(TagPieDataString, "]")


    TagPieDataString <- paste0(TagPieDataString, "}]")
    if(i != max(as.numeric(hierarchy$cluster))) {
      TagPieDataString <- paste0(TagPieDataString, ",")
    }
  }

  TagPieDataString <- paste0(TagPieDataString, "};")
  cat(TagPieDataString)



  tempDir <- tempfile()
  dir.create(tempDir)
  htmlFile <- file.path(tempDir, "index.html")

  # (code to write some content to the file)
  viewer <- getOption("viewer")
  viewer(htmlFile)
}


display.tagpie( clusterResult[["taxonomy"]], clusterResult[["hierarchy"]], "test2")
