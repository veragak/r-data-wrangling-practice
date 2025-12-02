# Assignment 8 – Quadratic Functions in Base R

This assignment implements two functions in base R to work with quadratic expressions and equations. The focus is on function design, input validation, error handling, and verification of results.

---

## Repository Structure

- `Assignment08_analysis.R` – main script containing:
    - definition of quadratic()
    - definition of solve_quadratic()
    - all required test calls
- `README.md` – project description and usage instructions

---

## Project Overview

1. quadratic(x, a = 1, b = 1, c = 0)

- Computes the expression ax^2 + bx + c
- Uses default values a = 1, b = 1, c = 0
- Only accepts numeric inputs; otherwise returns an error
- Works on numeric vectors of any length

Example usage:

quadratic(x = 1:5)
quadratic(x = 1:5, a = 5, b = -3, c = 1)
# quadratic("text")    # produces an error

2. solve_quadratic(a = 1, b = 1, c = 0)

Solves the quadratic equation:

𝑎𝑥2+𝑏𝑥+𝑐=0  using the quadratic formula.

Function behavior:

Validates numeric inputs

Computes the discriminant

If D < 0: stops with an informative error (“No real roots”)

If D == 0: returns the repeated root twice and displays a message

If D > 0: returns two distinct real roots

Example usage:

solve_quadratic()
solve_quadratic(a = 40, b = 11, c = -7)
solve_quadratic(a = 1, b = 2, c = 1)

3. ✔️ Verification Tests

The script verifies correctness by plugging the roots back into the quadratic function.
For correct implementation, the output must be:

quadratic(solve_quadratic())
quadratic(
  solve_quadratic(a = 1, b = 2, c = 1),
  a = 1, b = 2, c = 1
)


Expected result:

[1] 0 0

---

## How to Run

1. Open ´Assignment08_analysis.R´ in RStudio
2. Run the file from top to bottom
3. Output will show:
   - Function results
   - All required test cases
   - Error handling for invalid cases

No external packages are required.
This assignment uses base R only.
