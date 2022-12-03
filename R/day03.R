# Part 1
input <- readLines("data/input03.txt")

priorities <- vapply(
  X = input,
  FUN = function(x) {
    first_compartment <- substr(x, 1, nchar(x) / 2) |> strsplit("")
    second_compartment <- substr(x, nchar(x) / 2 + 1, nchar(x)) |> strsplit("")
    common_type <- intersect(first_compartment[[1]], second_compartment[[1]])
    which(factor(c(letters, LETTERS)) == common_type)
  },
  FUN.VALUE = integer(1),
  USE.NAMES = FALSE
)
sum(priorities)

# Part 2
n_groups <- length(input) / 3
idx_group <- rep(1:n_groups, each = 3)
priorities <- by(
  data = input,
  INDICES = idx_group,
  FUN = function(x) {
    my_intersect <- function(x) Reduce(intersect, x)
    x <- strsplit(x, "")
    common_type <- my_intersect(x)
    which(factor(c(letters, LETTERS)) == common_type)
  }
)
sum(priorities)
