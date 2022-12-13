# Read-in input
input <- readLines("data/input08.txt")
input <- do.call("rbind", strsplit(input, ""))
input <- matrix(as.numeric(input), nrow = nrow(input))

# Part 1
n <- nrow(input)
num_visible <- 2L * n + 2L * (n - 2)
for (i in seq.int(2, n - 1)) {
  for (j in seq.int(2, n - 1)) {
    tree <- input[i, j]
    if (
      all(tree > input[1:(i - 1), j]) |
      all(tree > input[(i + 1):n, j]) |
      all(tree > input[i, 1:(j - 1)]) |
      all(tree > input[i, (j + 1):n])
    ) {
      num_visible <- num_visible + 1L
    }
  }
}
num_visible

# Part 2
compute_vd <- function(x) {
  if (!any(x)) {
    return(length(x))
  }
  which(x)[1L]
}

max_scenic_score <- 0L
for (i in 2:(n - 1)) {
  for (j in 2:(n - 1)) {
    tree <- input[i, j]
    vd_up <- compute_vd(tree <= input[(i - 1):1, j])
    vd_down <- compute_vd(tree <= input[(i + 1):n, j])
    vd_left <- compute_vd(tree <= input[i, (j - 1):1])
    vd_right <- compute_vd(tree <= input[i, (j + 1):n])
    scenic_score <- vd_up * vd_down * vd_left * vd_right
    if (scenic_score > max_scenic_score) {
      max_scenic_score = scenic_score
    }
  }
}
max_scenic_score
