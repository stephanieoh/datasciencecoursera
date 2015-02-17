corr <- function(directory, threshold = 0){
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  
  df <- complete(directory, 1:332)
  id <- df[df$"nobs" > threshold, "id"]
  
  if(length(id) == 0) return(vector('numeric'))
  
 
  completecases <- function(id){
    path <- file.path(getwd(), directory, sprintf("%03d.csv", id))
    file <- read.csv(path)
    file[complete.cases(file), ]
  }
  
  corrrr <- function(id){
    cor(completecases(id)[, "sulfate"], completecases(id)[, "nitrate"])
  }
  
  sapply(id, corrrr)
  
  ## 'threshold' is a numeric vector of length 1 indicating the
  ## number of completely observed observations (on all
  ## variables) required to compute the correlation between
  ## nitrate and sulfate; the default is 0
  
  ## Return a numeric vector of correlations
  
}