#!/usr/bin/env Rscript
#Accept html file name as an argument on commandline
args = commandArgs(trailingOnly=TRUE)
htmlfile = args[1]
outfile = args[2]
#Load rvest library to read the html file
library(rvest)
#read the html file
#The html file name is provided as an argument in the terminal
#or a shell/bash script
input_file <- read_html(htmlfile)
#Extract table nodes from the html file
html_tbls <- html_nodes(input_file, "table")
#Inspect node
head(html_tbls)
#Extract table from html
html_tbls_ls <- input_file %>%
  html_nodes("table") %>%
  html_table(fill = TRUE)
#Convert table into data frame
main_df <- html_tbls_ls[[1]]
#Extract pneumonia data
pneumo_df <- main_df[3:nrow(main_df),c(2,77)]
#Assign proper column names
colnames(pneumo_df) <- c("District", "% infant deaths by Pneumonia")
#Along with reporting the data, one of the goals of the visualization would be to show how
#the under-reporting of disease has decreased and this should be something that can be appreciated
#One option: leave the rows empty (leads to sloppy visualization)
#Second option : Replace missing data with 0 (might lead to confusion but gets across the point about reporting)
#Use second option (code in the next line) carefully
#pneumo_df$`% infant deaths by Pneumonia`[pneumo_df$`% infant deaths by Pneumonia` == ""] <- 0
#Make column with state name for future needs of long form data
pneumo_df$State <- substring(pneumo_df[1,1],2)
#Remove row for state wide data
pneumo_df <- pneumo_df[-1,]
#Rearrange the column names with states first, followed by district and number of cases
pneumo_df <- pneumo_df[,c(3,1,2)]
#Save output in a csv file
write.csv(pneumo_df, outfile, row.names = FALSE)
