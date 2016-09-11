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
            result <- cbind(hospital = head(orderedcompletes, 1)[, "Name"], state = state)
        }else if (num == "worst"){
            result <- cbind(hospital = tail(orderedcompletes, 1)[, "Name"], state = state)
        }else if (num > nrow(orderedcompletes)){
            result <- cbind(NA, state)
        }else{
            result <- cbind(hospital = orderedcompletes[num, "Name"], state = state)
        }
        results <- rbind(results, result)
    }
    as.data.frame(results)
}