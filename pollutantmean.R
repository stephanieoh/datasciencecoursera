pollutantmean <- function(directory, pollutant, id = 1:332) {
  files <- list()
  for(i in id){
    idnum <- sprintf("%03d.csv", i)
    files<- rbind(files, read.csv(paste("/Users/stephanieo/Projects/datasciencecoursera", directory, idnum, sep = "/")))
  }
  
  bad <- is.na(files[, pollutant])
  mean(files[, pollutant][!bad])
}
