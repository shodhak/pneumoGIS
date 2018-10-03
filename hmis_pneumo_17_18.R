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
#Assign main indicators as column names
colnames(main_df) <- main_df[1,]
#Extract relevant data from the data frame
main_df <- main_df[2:nrow(main_df),2:ncol(main_df)]
#Save main_df as intermediate file
write.csv(main_df, "main_df.csv", row.names = FALSE)
#Extract pneumonia data
pneumo_df <- main_df[,c(1,37)]
#Change column names
colnames(pneumo_df) <- c("District",pneumo_df[1,2])
#Remove the first row
pneumo_df <- pneumo_df[-1,]
#Make column with state name for future needs of long form data
pneumo_df$State <- substring(pneumo_df[1,1],2)
#Remove row for state wide data
pneumo_df <- pneumo_df[-1,]
#Rearrange the column names with states first, followed by district and number of cases
pneumo_df <- pneumo_df[,c(3,1,2)]
#Save output in a csv file
write.csv(pneumo_df, outfile, row.names = FALSE)