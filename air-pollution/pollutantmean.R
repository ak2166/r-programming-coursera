pollutantmean <- function(directory, pollutant, id = 1: 332) {
	df <- readfiles(directory, id)
	calculatemean(df, pollutant)
}

readfiles <- function(directory, id) {
	files_queried <- list.files(directory, pattern="*.csv", full.names=TRUE)[id]
	total_df <- data.frame()
	for (file in files_queried){
    	df <- read.csv(file)
        total_df <- rbind(total_df, df)	    
	}
	total_df
}

calculatemean <- function(dataframe, pollutant){
    pollutants_vec <- dataframe[!is.na(dataframe[pollutant]), pollutant]
    mean(pollutants_vecpollutantmean("specdata", "sulfate", 1:10))
}