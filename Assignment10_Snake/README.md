# 🐍 Assignment 10 — Random Snake Simulation (Base R)

This project implements a simplified version of the Snake game using **base R only**, following the requirements of Assignment 10.  
The snake moves randomly inside a 30×30 grid, avoiding walls and its own body, until it can no longer move (“RIP Snake”).

---

## Repository Structure
- `Assignment10_analysis.R` # Main script with all required functions
-  `README.md` # Project documentation


---

## Overview

### **A. plotSnake() with headcolor**
- Modified plotting function `plotSnake()`  
- Added `headcolor = "yellow"` for the snake’s head  
- Body is drawn in red, head in yellow  

### **B. is_valid() Function**
Checks if a potential next position is valid:
- Inside grid borders  
- Not overlapping with the snake  

Returns: `TRUE` / `FALSE`.

### **C. moveSnake() Function**
Implements the movement logic:
1. Identifies current snake head  
2. Creates four possible moves (north, south, east, west)  
3. Evaluates valid moves using `is_valid()`  
4. Handles 3 cases:
   - **No moves** → return `NULL`  
   - **1 move** → take it  
   - **Multiple moves** → sample one randomly  
5. Builds the updated snake (drops tail, adds new head)  
6. Returns updated snake  

### **D. Simulation Loop**
Runs up to 1000 iterations:
- Plots the grid and the snake  
- Updates the snake with `moveSnake()`  
- If no valid move exists → prints **"RIP Snake"** and stops  

---

## How to Run

1. Open **`Assignment10.R`** in RStudio  
2. Ensure no packages are loaded (this assignment uses *base R only*)  
3. Run the script from start to finish  
4. The plotting window will display the snake moving  
5. When the snake is trapped, output will show:
   RIP SNAKE

   
---

## ✔️ Assignment Requirements Check
- Uses base R only
- Modified `plotSnake()` with headcolor
- Correct implementation of `is_valid()`
- Working `moveSnake()` logic
- Simulation loop updates and stops correctly
- Clean, reproducible code  

---

## Author

**Vera Gak Anagrova**



