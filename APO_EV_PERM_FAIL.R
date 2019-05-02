

install.packages("purrr")
install.packages("rlist")
library(rlist)
library(ape)
library(seqinr)
library(plyr)
library(purrr)
getwd()

#142 long

flavi <- list.files("Test_Files/flavi/")
sylva <- list.files("Test_Files/sylva/")

calcDivergence <- function(x, y){
  stopifnot(length(x)==length(y))
  #  x <- strsplit(x, split='')[[1]]
  #  y <- strsplit(y, split='')[[1]]
  return(length(which(sapply(1:length(x), function(i){x[i] == y[i]}) == TRUE)))
}

# Define our input FASTA files:
inputs <- list(
  'a' = file.path('.', 'Test_Files', 'flavi', 'flavicollis_CLocus_1366.fa'),
  'b' = file.path('.', 'Test_Files', 'sylva', 'sylvaticus_CLocus_1366.fa')
)

inputs

inputs2 <- list(
  'a' = file.path('.', 'Test_Files', 'flavi',list.files(file.path('.', 'Test_Files', 'flavi'))),
  'b' = file.path('.', 'Test_Files', 'sylva',list.files(file.path('.', 'Test_Files', 'sylva')))
)

inputs2


flavinput <-  list(file.path('.', 'Test_Files', 'flavi',list.files(file.path('.', 'Test_Files', 'flavi')))
                   flavinput
                   
                   flavinput
                   
                   ```
                   
                   
                   ```{r}
                   library(tidyverse)
                   library(seqinr)
                   read.fasta(file = paste0("Test_Files/flavi/",flavi[i]),
                              set.attributes = FALSE)
                   
                   
                   
                   input.fa <- sapply(inputs, read.fasta, set.attributes=FALSE, simplify=FALSE)
                   input2.fa <- sapply(inputs2, read.fasta, set.attributes=FALSE, simplify=FALSE)
                   input.fa
                   
                   ```
                   
                   
                   a <- list.files(file.path('.', 'Test_Files', 'flavi'))
                   
                   a 
                   
                   # Load all of our inputs:
                   input.fa <- sapply(inputs, read.fasta, set.attributes=FALSE, simplify=FALSE)
                   input2.fa <- sapply(inputs2, read.fasta, set.attributes=FALSE, simplify=FALSE)
                   
                   
                   input.fa
                   
                   # Get a matrix of all combinations to check:
                   lengths <- sapply(input.fa, function(i){1:length(i)}, simplify=FALSE)
                   combinations <- expand.grid(lengths)
                   
                   # Go through each combination, calculating the divergence:
                   divergences <- do.call(rbind.data.frame, lapply(1:nrow(combinations), function(i){
                     seq_a <- input.fa[[1]][combinations[i, 1]][[1]]
                     seq_b <- input.fa[[2]][combinations[i, 2]][[1]]
                     d <- calcDivergence(seq_a, seq_b)
                     return(list('a'=combinations[i, 1], 'b'=combinations[i, 2], 'd'=d))
                   }))
                   
                   
                   
                   
                   
                   # next step deposit
                   
                   
                   # assign 1 to false and 0 to true?
                   # 1/total length of parsed string*100 = div
                   
                   arg1 [arg1 == "true"] <- 1
                   arg1 [arg1 == "false"] <- 0
                   
                   
                   
                   