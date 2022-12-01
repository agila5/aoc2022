# Part 1
input <- readLines("data/input01.txt")
idx_elf <- cumsum(input == "")
by(input, factor(idx_elf), \(x) sum(as.numeric(x), na.rm = TRUE)) |> max()

# Part 2
input <- readLines("data/input01.txt")
idx_elf <- cumsum(input == "")
by(input, factor(idx_elf), \(x) sum(as.numeric(x), na.rm = TRUE)) |>
  sort(decreasing = TRUE) |>
  head(3) |>
  sum()
