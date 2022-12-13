# Read-in input
input <- readLines("data/input08")
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
