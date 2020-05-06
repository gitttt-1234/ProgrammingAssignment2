
## The cachematrix function is used to calculate the inverse of matrix by using the cache memory to avoid performing same computations repeatedly.


# The makeCacheMatrix function initiates the process and returns a list of functions which is given as the input to the cacheInverse function. 
# Setters and getters are defined for both the input matrix and output inverse of the matrix. input is initialised as empty vector.The output is initialised with NULL to clear the cache for any new input
# The get and getinv function takes advantage of "lexical scoping" to retreive the values of input and output

makeCacheMatrix <- function(x = matrix()) {
  mat <- NULL
  set <- function(y) {
    x <<- y
    mat <<- NULL
  }
  get <- function() x
  setinv <- function(inv) mat <<- inv
  getinv <- function() mat
  list(set = set, get = get,
       setinv = setinv,
       getinv = getinv)

}

#the cacheSolve function gets the list of functions from the makeMatrix function.
#the value of inverse is retreived using the getinv function. If it's not NULL, it means the value is available in the cache and hence the value is returned
#if the inverse is NULL, then the inverse is calculated using solve()
#the inverse matrix value is stored back using the setinv function

cacheSolve <- function(x, ...) {
  mat <- x$getinv()
  if(!is.null(mat)) {
    message("getting cached data")
    return(m)
  }
  data <- x$get()
  mat <- solve(data, ...)
  x$setinv(mat)
  mat
}



