library(tidyverse)
library(usethis)
library(dplyr)
load_dictionary <- function(x) {
  filename <- x
  read.csv(filename)}
valid_list <- load_dictionary("https://raw.githubusercontent.com/difiore/ada-datasets/refs/heads/main/collins-scrabble-words-2019.txt")
solution_list <- load_dictionary("https://raw.githubusercontent.com/difiore/ada-datasets/refs/heads/main/google-10000-english-usa-no-swears.txt")
valid_solutions <- intersect(solution_list,valid_list)
valid_solutions <- mutate(valid_solutions, nchar(valid_solutions$words))
valid_solutions <- mutate(valid_solutions, rename(valid_solutions, char_num = "nchar(valid_solutions$words)"))
five_char <- filter(valid_solutions, char_num == "5")