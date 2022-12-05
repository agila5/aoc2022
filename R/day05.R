# Part 1
input <- readLines("data/input05")

# Manually code the stacks
stacks <- list(
  c("F", "H", "M", "T", "V", "L", "D"),
  c("P", "N", "T", "C", "J", "G", "Q", "H"),
  c("H", "P", "M", "D", "S", "R"),
  c("F", "V", "B", "L"),
  c("Q", "L", "G", "H", "N"),
  c("P", "M", "R", "G", "D", "B", "W"),
  c("Q", "L", "H", "C", "R", "N", "M", "G"),
  c("W", "L", "C"),
  c("T", "M", "Z", "J", "Q", "L", "D", "R")
)

# extract the moves
moves <- grep("move", input, value = TRUE); rm(input)

# Process the moves
for (move in moves) {
  nums <- regmatches(move, gregexpr("\\d+", move, perl = TRUE))
  nums <- as.numeric(nums[[1]])
  qt <- nums[1]
  from <- nums[2]
  to <- nums[3]

  crates_to_move <- stacks[[from]][seq(from = 1, to = qt)] |> rev()
  stacks[[from]] <- stacks[[from]][-seq(1, qt)]
  stacks[[to]] <- c(crates_to_move, stacks[[to]])
}
paste0(lapply(stacks, "[[", 1), collapse = "")

# Part 2
stacks <- list(
  c("F", "H", "M", "T", "V", "L", "D"),
  c("P", "N", "T", "C", "J", "G", "Q", "H"),
  c("H", "P", "M", "D", "S", "R"),
  c("F", "V", "B", "L"),
  c("Q", "L", "G", "H", "N"),
  c("P", "M", "R", "G", "D", "B", "W"),
  c("Q", "L", "H", "C", "R", "N", "M", "G"),
  c("W", "L", "C"),
  c("T", "M", "Z", "J", "Q", "L", "D", "R")
)

# Process the moves
for (move in moves) {
  nums <- regmatches(move, gregexpr("\\d+", move, perl = TRUE))
  nums <- as.numeric(nums[[1]])
  qt <- nums[1]
  from <- nums[2]
  to <- nums[3]

  crates_to_move <- stacks[[from]][seq(from = 1, to = qt)]
  stacks[[from]] <- stacks[[from]][-seq(1, qt)]
  stacks[[to]] <- c(crates_to_move, stacks[[to]])
}
paste0(lapply(stacks, "[[", 1), collapse = "")
