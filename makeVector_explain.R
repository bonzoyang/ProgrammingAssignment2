makeVector <- function(x = numeric()) {
        # Declare a variable "m" in the environment of 
        # makeVector which is initialised to NULL.
        # The variable "m" is NULL to indicate that we have not 
        # calculated the cached mean yet. 
        m <- NULL

        # The variable "x" is also a variable in the environment
        # of makeVector because it is an argument to makeVector. 

        # Declare a function to set the underlying vector to the value
        # of the argument "y".
        # Note that we must invalidate the cached mean so we 
        # re-calculate it the next time cachemean is called. 
        set <- function(y) {
                # Search the enclosing environment for the variable "x" and
                # set it to the value of the function argument "y".
                x <<- y         
                
                # Search the enclosing environment for the variable "m" and
                # set it to NULL.
                m <<- NULL 
        }

        # Declare a function to return the underlying vector "x".
        get <- function() x     

        # Declare a function to search the enclosing environment for the
        # variable "m" and set it to the value of the argument "mean".
        setmean <- function(mean) m <<- mean  

        getmean <- function() m  

        # Return a list object that contains the function objects we have just defined.
        # Note that the function objects have an environment associated with them
        # that includes a reference to their enclosing environment 
        # (i.e. the makeVector environment)
        list(set = set, get = get, setmean = setmean, getmean = getmean)
} 
