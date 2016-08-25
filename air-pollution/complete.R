complete <- function(directory, id = 1:332){
    files_queried <- list.files(directory, pattern="*.csv", full.names=TRUE)[id]
    completes <- data.frame()
    for (file in files_queried){
        df <- read.csv(file)
        complete_vec = 	complete.cases(df)   
        row <- cbind (id[match(file, files_queried)], sum(complete_vec, na.rm=TRUE))
        completes <- rbind(completes, row)
    }
    colnames(completes) <- c("id", "nobs")
    completes
}