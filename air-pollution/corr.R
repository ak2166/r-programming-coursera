source("complete.R")
corr <- function(directory, threshold = 0){
    completes <- complete(directory)
    cors <- numeric()
    for(case in 1:nrow(completes)){
        if(completes[case, 'nobs'] > threshold){
            file <- list.files(directory, pattern="*.csv", full.names=TRUE)[completes[case, 'id']]
            df <- read.csv(file)
            clean_df <- df[complete.cases(df),]
            cors <- c(cors, cor(clean_df['sulfate'], clean_df['nitrate']))
        }
    }
    cors
}