complete <- function(directory, id = 1:332){
    files_queried <- list.files(directory, pattern="*.csv", full.names=TRUE)[id]
    getcompletes(files_queried, id)
}

getcompletes <- function(files, id){
    completes <- data.frame()
    for (file in files){
        row <- completerow(file, files, id)
        completes <- rbind(completes, row)
    }
    colnames(completes) <- c("id", "nobs")
    completes
}

completerow <- function(file, files, id){
    complete_vec = 	complete.cases(read.csv(file))   
    cbind (id[match(file, files)], sum(complete_vec, na.rm=TRUE))
}