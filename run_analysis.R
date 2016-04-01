# 1. Merge training and test sets to create one tidy data set to extract mean and std dev for each measure.
setwd("~/40 L&G/Coursera/Getting_and_Cleaning/ActivityTracking") #maybe set from select
        # read the col.names as a vector from the features.txt file
        features <- as.vector(read.table(file.choose(), row.names=1, quote="\"", comment.char="", stringsAsFactors=FALSE))
        
# only take out mean and std dev col names
library(dplyr)        
        colslct <- features["mean",]
        
        # read x_train as test to explore data using features as col names
        # limit to 10 rows to test
        X_train <- read.table("~/40 L&G/Coursera/Getting_and_Cleaning/DS_GC_Data/Dataset/train/X_train.txt", col.names = features[,1] ,quote="\"", comment.char="", stringsAsFactors=FALSE, nrows = 10)
        x_test <- read.table("~/40 L&G/Coursera/Getting_and_Cleaning/DS_GC_Data/Dataset/test/X_test.txt", col.names = features[,1] ,quote="\"", comment.char="", stringsAsFactors=FALSE, nrows = 10)
        
        # this is just one column
        y_train <- read.table("train/y_train.txt", col.names = features[,1] ,quote="\"", comment.char="", stringsAsFactors=FALSE, nrows = 10)
        
        
        
# 2. Extract only mean and std deviation for each measure
        
        # for this use dplyr filter to select the fields
