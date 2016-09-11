source('cleanoutcome.R')
source('checkstateoutcome.R')
rankhospital <- function(state, outcome, num = "best") {
    ## Read outcome data
    outcomes <- read.csv('./data/outcome-of-care-measures.csv', na.strings = 'Not Available', stringsAsFactors = FALSE)
    cleanoutcomes <- cleanoutcome(outcomes)
    ## Check that state and outcome are valid
    completes <- checkstateoutcome(cleanoutcomes, state, outcome)
    orderedcompletes <- completes[order(completes[,outcome], completes[, 'Name']), ]
    ## Return hospital name in that state with the given rank
    ## 30-day death rate
    if (num == "best") {
        head(orderedcompletes, 1)
    }else if (num == "worst"){
        tail(orderedcompletes, 1)
    }else if (num > length(orderedcompletes)){
        NA
    }else{
        orderedcompletes[num]
    }
}