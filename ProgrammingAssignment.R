### to solve this problem there is only need to change a little bit of the original code###

makeCacheMatrix <- function(x = matrix()) {
    matrixinv <- NULL
    set <- function(y) {
        x <<- y
        matrixinv <<- NULL
        }  get <- function() x
        setInverse <- function(inverse) matrixinv <<- inverse
        getInverse <- function() matrixinv
        list(set = set,
         get = get,
         setInverse = setInverse,
         getInverse = getInverse)
}


cacheSolve <- function(x, ...) {
    matrixinv <- x$getInverse()
    if (!is.null(matrixinv)) {
        message("getting cached data")
        return(matrixinv)
    } mat <- x$get()
        matrixinv <- solve(mat, ...)
        x$setInverse(matrixinv)
        matrixinv
}


test_matrix <- makeCacheMatrix(matrix(rep(1:4), 2,2))

cacheSolve(test_matrix)


