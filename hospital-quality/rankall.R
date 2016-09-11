source('cleanoutcome.R')
source('checkstateoutcome.R')
rankall <- function(outcome, num = "best") {
    outcomes <- read.csv('./data/outcome-of-care-measures.csv', na.strings = 'Not Available', stringsAsFactors = FALSE)
    cleanoutcomes <- cleanoutcome(outcomes)
    results <- NULL
    for (state in sort(unique(cleanoutcomes$State))) {
        completes <- checkstateoutcome(cleanoutcomes, state, outcome)
        orderedcompletes <- completes[order(completes[,outcome], completes[, 'Name']), ]
        if (num == "best") {
            result <- cbind(head(orderedcompletes, 1)[, "Name"], state)
        }else if (num == "worst"){
            result <- cbind(tail(orderedcompletes, 1)[, "Name"], state)
        }else if (num > nrow(orderedcompletes)){
            result <- cbind(NA, state)
        }else{
            result <- cbind(orderedcompletes[num, "Name"], state)
        }
        results <- rbind(results, result)
    }
    results
}