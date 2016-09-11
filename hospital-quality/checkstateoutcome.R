checkstateoutcome <- function(cleanoutcomes, state, outcome) {
    if (!state %in% cleanoutcomes$State){
        stop('invalid state')
    }else if (!outcome %in% colnames(cleanoutcomes)){
        stop('invalid outcome')
    }
    outcomescorrectstate <- cleanoutcomes[cleanoutcomes[, 'State'] == state, c('Name', outcome)]
    outcomescorrectstate[complete.cases(outcomescorrectstate[, outcome]), ]
}