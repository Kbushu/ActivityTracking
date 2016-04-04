# Load packages
        library(dplyr)

# 1. Merge training and test sets to create one tidy data set to extract mean and std dev for each measure.
        # Set directories
        in_dir <- paste0(getwd(),"/","data")
#         test_dir <- paste0(in_dir,"/", "test")
#         train_dir <- paste0(in_dir,"/", "train")
        
        # set files
        train_data <- paste0(in_dir,"/", "train","/", "X_train.txt")
        test_data <- paste0(in_dir,"/", "test","/", "X_test.txt")
        
        # read the col.names as a vector from the features.txt file
        features <- as.vector(read.table(paste0(in_dir,"/","features.txt"), row.names=1, quote="\"", comment.char="", stringsAsFactors=FALSE))
        
        # (or) append the two csv files
        
        
# only take out mean and std dev col names
        
        # read x_train as test to explore data using features as col names
        # limit to 10 rows to test
        x_test <- read.table(test_data, col.names = features[,1] ,quote="\"", comment.char="", stringsAsFactors=FALSE, colClasses = "numeric", nrows = 100)
        x_train <- read.table(train_data, col.names = features[,1] ,quote="\"", comment.char="", stringsAsFactors=FALSE, colClasses = "numeric", nrows = 100)
        
       #Select only columns with mean and std dev and combine by appending
        x_combined <- merge(x_test, x_train, all = TRUE) %>% select(matches('mean|std'))
        
        
        # this is just one column
        y_train <- read.table("train/y_train.txt", col.names = features[,1] ,quote="\"", comment.char="", stringsAsFactors=FALSE, nrows = 10)
      
        
# 2. Extract only mean and std deviation for each measure
        # Create a vector with the filtered col names
                colslct <- features[%in%("mean"),1]
