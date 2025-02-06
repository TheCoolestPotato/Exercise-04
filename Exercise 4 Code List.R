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
  
play_wordle <- function(v,valid_list, num_guesses=6){
  print("Welcome to R Wordle! You have 6 chances to correctly guess a five-letter word. Type a five-letter word below. You will receive either 'X' meaning that letter is not in the answer, 'Z' meaning the letter is in the answer but in the wrong position, or 'O' meaning that letter is in the answer in that position. Good luck!")
  pick_solution(solution_list)
  guess1 <- readline("Enter your first guess: ")
  guess1 <- toupper(guess1)
  guess1 <- str_split(guess1, "")
  guess1 %in% answer
   }


