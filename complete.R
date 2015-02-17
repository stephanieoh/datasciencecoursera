complete <- function(directory, id = 1:332) {
  files <- list()
  for(i in id){
    idnum <- sprintf("%03d.csv", i)
    files<- rbind(files, read.csv(paste("/Users/stephanieo/Projects/datasciencecoursera", directory, idnum, sep = "/")))   
  }
  
  nobs <- c()
  for(i in id){
    badsulfate <- is.na(files[which(files$"ID"==i), ][, "sulfate"])
    badnitrate <- is.na(files[which(files$"ID"==i), ][, "nitrate"])
    badpollutant <- badsulfate | badnitrate
    nobs <- c(nobs, sum(badpollutant == FALSE))
  }
  
  df = data.frame(id, nobs)
  df
}