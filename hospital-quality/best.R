source('cleanoutcome.R')
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