#####PLOTTING

# Box Plot Divergence Values

# Prep Data

### output as column
# Find the number of elements
num.el.name2 <- sapply(output_unlisted, length)
# Generate the matrix
output_column <- cbind(unlist(output_unlisted), rep(1:length(output_unlisted), num.el.name2))

colnames(output_column) <- c('value', 'sequence')

output_column_tib <- as.tibble(output_column)

# Boxplot all divs per locus

per_locus_box <- boxplot(output_unlisted)

# With ggplot

per_locus_box_gg <- ggplot(output_column_tib,aes(x=factor(sequence), y=value, group=sequence))+geom_boxplot(fill="blue", alpha=0.2) + xlab("Locus") + ylab("Divergence")

# Boxplot Divs overall

all_values_box <- output_column_tib %>% 
  pull(value) %>% 
  boxplot()

# With ggplot

all_values_box_gg <- ggplot(output_column_tib,aes(x=factor(0),y=value))+geom_boxplot(fill="blue", alpha=0.2) + xlab("All Sequences") + ylab("Divergence") 
