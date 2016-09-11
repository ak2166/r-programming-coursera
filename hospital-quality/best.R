source('cleanoutcome.R')
source('checkstateoutcome.R')
best <- function(state, outcome) {
    ## Read outcome data
    outcomes <- read.csv('./data/outcome-of-care-measures.csv', na.strings = 'Not Available', stringsAsFactors = FALSE)
    cleanoutcomes <- cleanoutcome(outcomes)
    completes <- checkstateoutcome(cleanoutcomes, state, outcome)
    min(completes[completes[, outcome] == min(completes[,outcome]), 'Name'])
}