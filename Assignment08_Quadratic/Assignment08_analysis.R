#################
## Assignment 8 ##
#################

###############
## Question A ##
###############

# Function: quadratic()
# Computes ax^2 + bx + c
# Defaults: a = 1, b = 1, c = 0
# Returns an error for non-numeric input

quadratic <- function(x, a = 1, b = 1, c = 0) {
  
  # Check numeric inputs
  if (!is.numeric(x) || !is.numeric(a) || !is.numeric(b) || !is.numeric(c)) {
    stop("Input must be numeric")
  }
  
  # Compute result
  result <- a * x^2 + b * x + c
  return(result)
}

# REQUIRED TESTS
quadratic(x = 1:5)
quadratic(x = 1:5, a = 5, b = -3, c = 1)

# This should produce an error:
# quadratic(x = "char", a = 5, b = -3, c = 1)


###############
## Question B ##
###############

# Function: solve_quadratic()
# Computes the real roots of ax^2 + bx + c = 0
# If discriminant < 0 → stops with an error

solve_quadratic <- function(a = 1, b = 1, c = 0) {
  
  # Inputs already numeric by default, but check anyway:
  if (!is.numeric(a) || !is.numeric(b) || !is.numeric(c)) {
    stop("Inputs a, b, c must be numeric")
  }
  
  # Compute discriminant
  D <- b^2 - 4 * a * c
  
  ###############
  ## Question C ##
  ###############
  # If discriminant < 0 → no real roots
  if (D < 0) {
    stop("No real roots exist (discriminant < 0)")
  }
  
  # If discriminant = 0 → one repeated root
  if (D == 0) {
    root <- -b / (2 * a)
    message("One repeated real root (discriminant = 0).")
    return(c(root, root))
  }
  
  # Otherwise, two distinct real roots
  root1 <- (-b + sqrt(D)) / (2 * a)
  root2 <- (-b - sqrt(D)) / (2 * a)
  
  return(c(root1, root2))
}

# REQUIRED TESTS
solve_quadratic()                         # default case
solve_quadratic(a = 40, b = 11, c = -7)
solve_quadratic(a = 1, b = 2, c = 1)      # repeated root

# Verification tests (quadratic at the roots should equal 0)
quadratic(solve_quadratic())
quadratic(solve_quadratic(a = 1, b = 2, c = 1), a = 1, b = 2, c = 1)
