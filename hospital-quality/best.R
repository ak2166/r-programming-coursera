best <- function(state, outcome) {
    ## Read outcome data
    outcomes <- read.csv('./data/outcome-of-care-measures.csv', na.strings = 'Not Available', stringsAsFactors = FALSE)
    cleanoutcomes <- cleanoutcome(outcomes)
    ## Check that state and outcome are valid
    if (!state %in% cleanoutcomes$State){
        stop('invalid state')
    }else if (!outcome %in% colnames(cleanoutcomes)){
        stop('invalid outcome')
    }
    outcomescorrectstate <- cleanoutcomes[cleanoutcomes[, 'State'] == state, c('Name', outcome)]
    completes <- outcomescorrectstate[complete.cases(outcomescorrectstate[, outcome]), ]
    min(completes[completes[, outcome] == min(completes[,outcome]), 'Name'])
}

cleanoutcome <- function(x) {
    ##First ensure all the letters in the input are lower case, then capitalize them
    names <- c("Hospital.Name", "State", "Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack", "Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure", "Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia")
    newNames <-c("Name", "State", "heart attack", "heart failure", "pneumonia")
    wanteddata <- x[, names]
    colnames(wanteddata) <- newNames
    wanteddata
}