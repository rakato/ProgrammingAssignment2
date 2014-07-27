## first write a function called CacheMatrix to be able to take inverse of a matrix

CacheMatrix <- function( m = matrix() ) {

# create inverse property
    i <- NULL

    make <- function( matrix ) {
            m <<- matrix
            i <<- NULL
    }

 # how to retrieve matrix
 
    retrieve <- function() {
      m 
    }

  #  Set the inverse
    makeInverse <- function(inverse) {
        i <<- inverse
    }

  # Retrieve inverse 
    
        retrieveInverse <- function() {
        	
  # Return the inverse
        i
    }

    # Return a list of the methods
    list(make = make, retrieve = retrieve,
         makeInverse = makeInverse,
         retrieveInverse = retrieveInverse)
}


#CacheSolve does following:
#Checks to see if inverse of previous matrix already calculated by CacheMatrix
#if not the function goes ahead and takes the inverse
#if inverse has been cached, casheSolve returns the already computed inverse

cacheSolve <- function(x, ...) {

    ## Return a matrix that is the inverse of 'x'
    m <- x$retrieveInverse()

    ## return the inverse if its already calculated
    if( !is.null(m) ) {
            message("retrieving already cached data")
            return(m)
    }

    ## Get the matrix from our object
    data <- x$make()

  # Calculate the inverse using mxm mult
    m <- solve(data) %*% data

    ## Set the inverse to the object
    x$makeInverse(m)

    ## Return the matrix
    m
}