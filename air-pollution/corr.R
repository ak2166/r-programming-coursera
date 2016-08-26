source("complete.R")

corr <- function(directory, threshold = 0){
    files_queried <- getcompleteframe(directory, threshold)
    calculatecors(files_queried, 'sulfate', 'nitrate')
}

getcompleteframe <- function(directory, threshold){
    completes <- complete(directory)
    list.files(directory, pattern="*.csv", full.names=TRUE)[completes[(completes['nobs'] > threshold),"id"]]
}

calculatecors <- function(files, pollutant_one, pollutant_two){
    cors <- numeric()
    for(file in files){
        df <- read.csv(file)
        clean_df <- df[complete.cases(df),]
        cors <- c(cors, cor(clean_df[pollutant_one], clean_df[pollutant_two]))
    }
    cors
}