cleanoutcome <- function(x) {
    ##First ensure all the letters in the input are lower case, then capitalize them
    names <- c("Hospital.Name", "State", "Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack", "Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure", "Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia")
    newNames <-c("Name", "State", "heart attack", "heart failure", "pneumonia")
    wanteddata <- x[, names]
    colnames(wanteddata) <- newNames
    wanteddata
}