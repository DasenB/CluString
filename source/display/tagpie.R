display.tagpie <- function(taxonomy, hierarchy, outDir){

  newPath <- paste("data/display/tagpie/", outDir, sep = "")

  if(!dir.exists(newPath)){
    dir.create(newPath, showWarnings = TRUE, recursive = FALSE, mode = "0777")
  }

  TagPieDataString <- "tagPieData = ["

  for(i in 1:max(as.numeric(hierarchy$cluster))) {
    TagPieDataString <- paste(TagPieDataString, "{")
    TagPieDataString <- paste(TagPieDataString, "'major': { 'key': '", as.character(hierarchy[hierarchy$cluster == i, ]$center), "', 'value': 100 },", sep="")

    TagPieDataString <- paste(TagPieDataString, "'data': [")

    # 'data': [ {'key': 'tag1', 'value': 10 }, {'key': 'tag2', 'value': 10 }]
    # print(as.character(hierarchy[hierarchy$cluster == i, ]$center))
    # taxonomy[taxonomy$cluster == i, ]

    for(row in 1:length(taxonomy[taxonomy$cluster == 64, ])) {
      TagPieDataString <- paste(TagPieDataString, "{")
    }

    TagPieDataString <- paste(TagPieDataString, "']")


    TagPieDataString <- paste(TagPieDataString, "}")
    if(i != max(as.numeric(hierarchy$cluster))) {
      TagPieDataString <- paste(TagPieDataString, ",")
    }
  }

  TagPieDataString <- paste(TagPieDataString, "]")
  print(TagPieDataString)

  tempDir <- tempfile()
  dir.create(tempDir)
  htmlFile <- file.path(tempDir, "index.html")

  # (code to write some content to the file)
  viewer <- getOption("viewer")
  viewer(htmlFile)
}


display.tagpie( taxonomy, hierarchy, "test2")
