## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

##makeCacheMatrix stores input matrix in memory, also has 4 functions to handle 
##it

makeCacheMatrix <- function(x = matrix()) {
        inverseM <- NULL
        set <- function(y) {
                x <<- y
                inverseM <<- NULL
        }
        get <- function() x
        setInverseM <- function(NewInverseM) inverseM <<- NewInverseM
        getInverseM <- function() inverseM
        list(set = set, get = get,
             setInverseM = setInverseM,
             getInverseM = getInverseM)
}


## Write a short comment describing this function

##cacheSolve checks whether we have pre-calculated incerse matrix, if so -
##load it from cache, otherwise - calcuate inverse matrix and put it into cache

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
        inverseM <- x$getInverseM()
        if(!is.null(inverseM)) {
                message("getting cached `inverse Matrix")
                return(inverseM)
        }
        data <- x$get()
        inverseM <- solve(data, ...)
        x$setInverseM(inverseM)
        inverseM
}
