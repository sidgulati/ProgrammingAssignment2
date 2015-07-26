## The idea here is to write a pair of functions that cache the inverse of a matrix.

## This function creates a special "matrix" object that can cache its inverse.

makeCacheMatrix <- function(x = matrix()) {
## Initial setup to clear the working variable
    z <- NULL
    set <- function(y) {
        x <<- y
        z <<- NULL
    }
    get <- function() x 
## This stores the inverse result and puts it in the z
    setInverse <- function(inverse) z <<- inverse
## This gets the inverse result, if it exists, stored in variable z
    getInverse <- function() z
    list(set = set, get = get,
         setInverse = setInverse,
         getInverse = getInverse)
}

## This function computes the inverse of the special "matrix" returned by makeCacheMatrix above. 
## If the inverse has already been calculated (and the matrix has not changed), then the cachesolve 
## should retrieve the inverse from the cache.

cacheSolve <- function(x, ...) {
    ## This returns a matrix that is the inverse of x
    z <- x$getInverse()
    if(!is.null(z)) {
        message("getting cached data")
        return(z)
    }
    data <- x$get()
    ## This calculates the inverse of the matrix x and then caches the resulting output in z 
    z <- solve(data, ...)
    x$setInverse(z)
    z
}
