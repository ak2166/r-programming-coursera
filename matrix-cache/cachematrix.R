## This set of functions will create a cached version of a matrix in a different
## environment, and then subsequently calculate the inverse of that matrix.

## This function takes a generic R matrix, and creates a cached version of it
## We want the functionn to create a cached version in a separate environment from the function
## We can then use the self-described functions to override the cached values.
## For example we can call cachedX <- makeCacheMatrix(x)
## This will define the other functions, as well as set m, the cached invers to NULL

makeCacheMatrix <- function(x = matrix()) {
    m <- NULL
    set <- function(y) {
        x <<- y
        m <<- NULL
    }
    get <- function() x
    setInv <- function(inv) m <<- inv
    getInv <- function() m
    list(set = set, get = get,
         setInv = setInv,
         getInv = getInv)
}


## This next function calls previously (and automatically) defined functions on a cached Matrix
## First it will try to get the inverse, however if m has never been calculated, or x was reset it will calculate the inverse
## At the end, either the old inverse is returned, or the new inverse is calculated and set as the cached object's inverse property 

cacheSolve <- function(x, ...) {
    ## Return a matrix that is the inverse of 'x'
    m <- x$getInv()
    if(!is.null(m)) {
        message("getting cached data")
        return(m)
    }
    data <- x$get()
    m <- solve(data, ...)
    x$setInv(m)
    m
}
