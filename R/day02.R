# Part 1
input <- readLines("data/input02")
input <- do.call(rbind, strsplit(input, " "))

# Extract the points associated to the shape using a named vector
match_points_shape <- c("X" = 1, "Y" = 2, "Z" = 3)
points_shape <- sum(match_points_shape[input[, 2]])

# Extract the points associated to the outcome with an ad-hoc function
compute_points_outcome <- function(p1, p2) {
  n <- length(p1)
  # All losses
  outcome <- integer(n)
  # Check draw
  idx_draw <- (p1 == "A" & p2 == "X") | (p1 == "B" & p2 == "Y") | (p1 == "C" & p2 == "Z")
  outcome[idx_draw] <- 3L
  # Check wins
  idx_wins <- (p1 == "A" & p2 == "Y") | (p1 == "B" & p2 == "Z") | (p1 == "C" & p2 == "X")
  outcome[idx_wins] <- 6L
  sum(outcome)
}
points_outcome <- compute_points_outcome(input[, 1], input[, 2])
points_outcome + points_shape

# Part 2
figure_out_shape <- function(p1, outcome) {
  n <- length(p1)
  # All rocks
  shape <- rep("X", n)

  # Fix "paper" and "scissor"
  idx_paper <-
    (p1 == "C" & outcome == "X") |
    (p1 == "B" & outcome == "Y") |
    (p1 == "A" & outcome == "Z")
  idx_scissor <-
    (p1 == "A" & outcome == "X") |
    (p1 == "C" & outcome == "Y") |
    (p1 == "B" & outcome == "Z")
  shape[idx_paper] <- "Y"
  shape[idx_scissor] <- "Z"
  shape
}
shape <- figure_out_shape(input[, 1], input[, 2])
points_shape <- sum(match_points_shape[shape])
points_outcome <- compute_points_outcome(input[, 1], shape)
points_shape + points_outcome
