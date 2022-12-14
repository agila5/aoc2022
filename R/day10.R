# Part 1
input <- readLines("data/input10")

# Setup
i <- 1L
cycle <- 1L
register <- vector("integer", length = 1L)
X <- 1L
first_cycle <- TRUE

# Run
while (TRUE) {
  sprite <- seq(X, X + 2)

  if (grepl("noop", input[i])) {
    register[cycle] <- X
    i <- i + 1L
    cycle <- cycle + 1L

    if (i > length(input)) {
      break
    }

    next
  } else if (
    grepl("addx", input[i])
  ) {
    if (first_cycle) {
      register[cycle] <- X
      cycle <- cycle + 1L
      first_cycle <- FALSE
      next
    }
    register[cycle] <- X
    add <- regmatches(input[i], gregexpr("[-\\s]\\d+", input[i], perl = TRUE))
    add <- as.integer(add[[1]])
    X <- X + add

    cycle <- cycle + 1L
    i <- i + 1L
    first_cycle <- TRUE

    if (i > length(input)) {
      break
    }

    next
  }
}

20 * register[20] + 60 * register[60] + 100 * register[100] + 140 * register[140] + 180 * register[180] + 220 * register[220]
