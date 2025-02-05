library(tidyverse)
library(usethis)
library(dplyr)
load_dictionary <- function(x) {
  filename <- x
  read.csv(filename)}
valid_list <- load_dictionary("https://raw.githubusercontent.com/difiore/ada-datasets/refs/heads/main/collins-scrabble-words-2019.txt")
solution_list <- load_dictionary("https://raw.githubusercontent.com/difiore/ada-datasets/refs/heads/main/google-10000-english-usa-no-swears.txt")
pick_solution <- function(df){
  solution_list <- df
  valid_solutions <- intersect(solution_list,valid_list)
  valid_solutions <- mutate(valid_solutions, nchar(valid_solutions$words))
  valid_solutions <- mutate(valid_solutions, rename(valid_solutions, char_num = "nchar(valid_solutions$words)"))
  five_letter_words <- filter(valid_solutions, char_num == "5")
  answer <- sample(five_letter_words$words,1)
  answer <- str_split(answer, "")
  return(answer)
}

