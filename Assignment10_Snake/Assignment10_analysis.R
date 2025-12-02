#################
## Assignment10 ##
#################

## --------- Helper plotting functions (given + adapted) --------- ##

plotGrid <- function(N = 30, border = "white", col = "light green") {
  # Draw an N x N empty grid
  par(mar = c(0, 0, 0, 0))
  plot(0, 0, type = "n",
       xlim = c(0, N), ylim = c(0, N),
       axes = FALSE, xlab = "", ylab = "",
       asp = 1)
  for (i in 1:N) {
    ystart <- (i - 1)
    yend   <- i
    rect(0:(N - 1), ystart, 1:N, yend,
         border = border, col = col)
  }
}

# A. Adapt plotSnake to include headcolor (default = "yellow")
plotSnake <- function(snake,
                      border = "black",
                      col = "red",
                      headcolor = "yellow") {
  n <- nrow(snake)
  if (n == 0) return(NULL)

  # Body segments (all except last row)
  if (n > 1) {
    for (i in 1:(n - 1)) {
      xstart <- snake$xpos[i] - 1
      xend   <- snake$xpos[i]
      ystart <- snake$ypos[i] - 1
      yend   <- snake$ypos[i]
      rect(xstart, ystart, xend, yend,
           border = border, col = col)
    }
  }

  # Head segment = last row (different color)
  xstart <- snake$xpos[n] - 1
  xend   <- snake$xpos[n]
  ystart <- snake$ypos[n] - 1
  yend   <- snake$ypos[n]
  rect(xstart, ystart, xend, yend,
       border = border, col = headcolor)
}

## --------- B. Function to check valid positions --------- ##

# A position is valid if:
# 1) within grid [xmin, xmax] x [ymin, ymax]
# 2) not already occupied by the snake body
is_valid <- function(position,
                     snake,
                     xmin = 1, ymin = 1,
                     xmax = 30, ymax = 30) {

  # Check grid borders
  x <- position$xpos[1]
  y <- position$ypos[1]

  if (x < xmin || x > xmax || y < ymin || y > ymax) {
    return(FALSE)
  }

  # Check if position is already part of the snake
  if (nrow(merge(position, snake)) > 0) {
    return(FALSE)
  } else {
    return(TRUE)
  }
}

## --------- C. moveSnake() function --------- ##

moveSnake <- function(snake,
                      xmin = 1, ymin = 1,
                      xmax = 30, ymax = 30) {

  N <- nrow(snake)
  if (N == 0) return(NULL)

  # 1. Select head (last row)
  head <- snake[N, , drop = FALSE]

  # 2. Possible moves: N, E, S, W around the head
  possible_moves <- data.frame(
    xpos = c(head$xpos,
             head$xpos + 1,
             head$xpos,
             head$xpos - 1),
    ypos = c(head$ypos + 1,
             head$ypos,
             head$ypos - 1,
             head$ypos)
  )
  # order: north, east, south, west

  # 3. Check validity of each of the 4 positions
  valid_vec <- logical(4)
  for (i in 1:4) {
    pos_i <- possible_moves[i, , drop = FALSE]
    valid_vec[i] <- is_valid(pos_i, snake,
                             xmin = xmin, ymin = ymin,
                             xmax = xmax, ymax = ymax)
  }

  # 4. Count how many valid positions exist
  num_valid <- sum(valid_vec)

  if (num_valid == 0) {
    # No valid positions → snake cannot move
    return(NULL)
  }

  if (num_valid == 1) {
    # Exactly one valid move → take it
    idx_move <- which(valid_vec)
  } else {
    # 2 or more valid moves → randomly pick one
    idx_move <- sample(which(valid_vec), size = 1)
  }

  new_head <- possible_moves[idx_move, , drop = FALSE]

  # 5. Build next_snake:
  # first N-1 rows = last N-1 rows of old snake (remove tail)
  # last row       = new head
  if (N > 1) {
    next_snake <- rbind(snake[2:N, , drop = FALSE], new_head)
  } else {
    # degenerate case: snake of length 1
    next_snake <- new_head
  }

  # 6. Return new snake
  return(next_snake)
}

## --------- D. Simulation loop --------- ##

# Initial snake: 10 cells in the middle of 30x30 grid
snake <- as.data.frame(matrix(0, 10, 2))
names(snake) <- c("xpos", "ypos")
snake$xpos <- 11:20
snake$ypos <- rep(15, 10)

# Loop for up to 1000 moves
for (i in 1:1000) {
  plotGrid()
  plotSnake(snake)

  # move the snake
  next_snake <- moveSnake(snake)

  # If no more valid moves → RIP Snake
  if (is.null(next_snake)) {
    mtext("RIP Snake", side = 3, line = -1, col = "red", cex = 2)
    break
  }

  # Update snake
  snake <- next_snake

  Sys.sleep(0.1)
}
