# Part 1
input <- readLines("data/input04.txt")

digits <- regmatches(input, gregexpr("\\d+", input, perl = TRUE))
digits <- do.call(rbind, digits) |> as.numeric() |> matrix(nrow = length(input))
fully_contain_1 <- digits[, 1] <= digits[, 3] & digits[, 2] >= digits[, 4]
fully_contain_2 <- digits[, 1] >= digits[, 3] & digits[, 2] <= digits[, 4]
fully_contain <- fully_contain_1 | fully_contain_2; rm(fully_contain_1, fully_contain_2)
sum(fully_contain)

# Part 2
overlap <- pmax(digits[, 1], digits[, 3]) <= pmin(digits[, 2], digits[, 4])
sum(overlap)
