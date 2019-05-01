#####SEQUENCE DIVERGENCE

# 1. Install packages

# 2. Load libraries
library(purrr)
library(ape)
library(plyr)
library(seqinr)
library(tidyverse)

# 3. Create objects and assign class and parameters 
all_names_af <- list()
all_names_as <- list()
all_names_both <- list()
af_Divergence <- list()
as_Divergence <- list()
Compare_as_af <- list()
output <- vector('list', length(flavi))
output_unlisted <- list()

# 4. Create an object for each input species.
# Assign the object as a list of sequencing files for the relevant species

flavi <- list.files("Apodemus/flavi/")
sylva <- list.files("Apodemus/sylva/")

# 5. The main loop

# 5.1 The loop will run for as many turns as there are elements in the list of sequences

for (i in 1:length(flavi)) 
{
  # 5.2 Create an object for each species containing a sequence file read in fasta format for species
  af_Divergence <- read.fasta(file = paste0("Apodemus/flavi/",flavi[i]),
                              set.attributes = FALSE)
  Names_af<-names(af_Divergence)
  
  as_Divergence <-read.fasta(file = paste0("Apodemus/sylva/",sylva[i]),
                             set.attributes = FALSE)
  Names_as <- names(as_Divergence)
  
  # 5.3 Create an object containing both of above objects
  as_af_divergence<-c(as_Divergence, af_Divergence)
  
  # 5.4 Create an object containing the names from above object - for use later
  Names_as_af <- names(as_af_divergence)
  
  # 5.5 Objects created to write out the names of inputs for every cycle of the loop
  all_names_af[[i]] <- Names_af
  all_names_as[[i]] <- Names_as
  all_names_both[[i]] <-Names_as_af
  
  # 5.6 This part of the loop calculates the divergence
  # 5.7 Create two further loops which both run a cycle for every fasta sequence in each file 
  for (x in 1:length(as_Divergence)){
    for (y in (length(as_Divergence) +1):length(as_af_divergence)){
      
      # 5.7.1 This object contains the divergence values for every turn of the inner most loop
      # 5.7.1.1 This loop seperates the fasta format sequences into seperate nucleotides 
      # 5.7.1.2 It then compares each nucleotide to its corresponding position in the sequences from the second input species
      # 5.7.1.3 If the values of the position differ, a value of 1 is assigned
      # 5.7.1.4 If the values are the same, a value of 0 is assigned
      # 5.7.1.5 The values are totaled and divided by the length of the sequence and multiplied by 100
      # 5.7.1.6 This value is what is written out in step 5.7.1 - percentage difference
      Compare_as_af[[y]] <-
        sum(eval(parse(text=paste0("as_af_divergence$",
                                   Names_as_af[x]))) != eval(parse(text=paste0("as_af_divergence$",
                                                                               Names_as_af[y]))))/length(eval(parse(text=paste0("as_af_divergence$",
                                                                                                                                Names_as_af[x]))))*100
    }
    # 5.7.2 This object contains the values of step 5.7.1 for every turn of the second to inner most loop
    output[[i]] <- Compare_as_af
  }
}

# 6. This loop takes the output from step 5.7.2 and unlists it also removing NULL values
for (i in 1:length(output)) {
  output_unlisted[[i]] <- unlist(output[i])
}


### The following steps allow the data aquired so far to be moved into a useable format.

# 7. Create onjects which will be used to create various tables 

# 7.1 Create a matrix of names of Clocus
# 7.1.1 Find the number of elements
num.el <- sapply(flavi, length)
# 7.1.2 Generate the matrix
res <- cbind(unlist(flavi), rep(1:length(flavi), num.el))

# 7.2 Crate a matrix of output 
# 7.2.1 Find the number of elements
num.el2 <- sapply(flavi, length)
# 7.2.2 Generate the matrix
res2 <- cbind(output_unlisted, rep(1:length(flavi), num.el2))

# 7.3 Create a matrix of all names within each Clocus files
# 7.3.1 Find the number of elements
num.el3 <- sapply(flavi, length)
# 7.3.2 Generate the matrix
res3 <- cbind(all_names_both, rep(1:length(flavi), num.el3))

# 8. Merge the matricies created in step 7 
results.2.3 <- merge(res, res3)
results_C_locus <- merge(results.2.3, res2)
results_C_locus

# 9. Create a matrix creating all of the values obtained for divergence of every sequence
# 9.1 Find the number of elements 
num.elaver <- sapply(output_unlisted, length)
# 9.2 Generate the matrix
resaver <- cbind(unlist(output_unlisted), rep(1:length(output_unlisted), num.elaver))

# 10. Find the sum of the values for all divergences
colSums(resaver)

# 11. Find the length of the output (the total number of divergences calculated)
length(unlist(output_unlisted))

# 12. Divide the sum of divergences by the number of divergences calulated
Total_Sequence_Divergence <- 5799982/3510700

Total_Sequence_Divergence
# 13. The value of the object Total_Sequence_Divergence total percentage divergence between species 1 and 2







