# Part 1
input <- readLines("data/input06.txt")
input <- strsplit(input, "")[[1]]

for (j in seq.int(4, length(input))) {
  idx <- seq.int(j - 3, j)
  if (!anyDuplicated(input[idx])) {
    print(j)
    break
  }
}

# Part 2
for (j in seq.int(14, length(input))) {
  idx <- seq.int(j - 13, j)
  if (!anyDuplicated(input[idx])) {
    print(j)
    break
  }
}
