corr <- function(directory, threshold = 0) {
        
        source("complete.R")
        source("iFileName.R")
        measurments <- complete(directory, 1:332)
        sulfate <- numeric()
        nitrate <- numeric()
        result <- numeric()
        
        for (i in measurments$id[measurments$nobs > threshold]) {
                filename <- iFileName(directory, i)
                data <- read.csv(filename)
                result <- c(result, cor(data$sulfate, data$nitrate, use="complete.obs"))
        }
        
        result
}