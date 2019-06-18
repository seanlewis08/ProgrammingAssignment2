## Finding the inverse of a matrix is a tedious computation.
## Below are two functions allowing a matrix to be defined 
## with a cached inverse. 



## makeCacheMatrix: defines a matrix which has it's 
## inverse stored in memory for easy retrieval.

makeCacheMatrix <- function(x = matrix()) {
  cashM <- NULL
  
  set <- function(new_Matrix){
    x <<- new_Matrix
    
    cashM <- NULL
  }
  
  get <- function() {
    x
  }
  
  setInverse <- function(inv) {
    cashM <<-inv
  }
  
  getInverse <- function() {
    cashM
  }
  
  
  list(define = set, retrieve = get, changeInv = setInverse, findInv = getInverse)
}


## cacheSolve: takes a cacheMatrix and returns its inverse
## and saving the inverse to the cache.

cacheSolve <- function(x, ...) {
  
  cash_inv <- x$findInv()
  
  if(!is.null(cash_inv)) {
    
    message("getting inverse from the cache")
    return(cash_inv)
    
  }
  
  temp <- x$retrieve()
  cash_inv <- solve(temp, ...)
  x$changeInv(cash_inv)
  
  cash_inv
}
