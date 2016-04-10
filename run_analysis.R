# Load packages
        library(dplyr)
        library(reshape2)

# Setup directories
        in_dir <- paste0(getwd(),"/","data")
        
# Read the x data
        # set folder reference
        train_data <- paste0(in_dir,"/", "train","/", "X_train.txt")
        test_data <- paste0(in_dir,"/", "test","/", "X_test.txt")
        
        # Check if file exist
        if (!file.exists(train_data)){
                stop(paste("Please ensure that data is available in", in_dir))
        }
        
        # read the col.names as a vector from the features.txt file
        features <- as.vector(read.table(paste0(in_dir,"/","features.txt"), row.names=1, 
                                         quote="\"", comment.char="", stringsAsFactors=FALSE))
        # Load the data sets
        x_test <- read.table(test_data, col.names = features[,1],
                             quote="\"", comment.char="", stringsAsFactors=FALSE, colClasses = "numeric")
        x_train <- read.table(train_data, col.names = features[,1],
                              quote="\"", comment.char="", stringsAsFactors=FALSE, colClasses = "numeric")
        
# Read y data (the actions)
        # Set folder reference
        train_data <- paste0(in_dir,"/", "train","/", "y_train.txt")
        test_data <- paste0(in_dir,"/", "test","/", "y_test.txt")
        # Load the datasets
        y_test <- read.table(test_data, col.names = "ActionCode",
                             quote="\"", comment.char="", stringsAsFactors=FALSE, colClasses = "numeric")
        y_train <- read.table(train_data, col.names = "ActionCode",
                              quote="\"", comment.char="", stringsAsFactors=FALSE, colClasses = "numeric")
        # Add action descriptions to the datasets
        actions <- data.frame(ActionCode = c(1,2,3,4,5,6), ActionName = c(
                "WALKING", 
                "WALKING_UPSTAIRS",
                "WALKING_DOWNSTAIRS",
                "SITTING",
                "STANDING",
                "LAYING"))
        y_test <- merge(y_test, actions, by.x = "ActionCode", by.y = "ActionCode")
        y_train <- merge(y_train, actions, by.x = "ActionCode", by.y = "ActionCode")
        
# Read subject data
        # Set folder reference
        train_data <- paste0(in_dir,"/", "train","/", "subject_train.txt")
        test_data <- paste0(in_dir,"/", "test","/", "subject_test.txt")
        # Load the datasets
        s_test <- read.table(test_data, col.names = "Subject",
                             quote="\"", comment.char="", stringsAsFactors=FALSE, colClasses = "numeric")
        s_train <- read.table(train_data, col.names = "Subject",
                              quote="\"", comment.char="", stringsAsFactors=FALSE, colClasses = "numeric") 
# Make test data set
        test <- data.frame(cbind(Subject = s_test$Subject, ActionName = y_test$ActionName, x_test))
        
# Make train data set
        train <- data.frame(cbind(Subject = s_train$Subject, ActionName = y_train$ActionName, x_train))
       
#Merge and select only columns with mean and std dev then combine and save data set
        MeanStandard <- merge(test, train, all = TRUE) %>% select(1:2, matches('mean|std'))
        MeanStandardMelt <- melt(MeanStandard, id.vars = c("Subject", "ActionName"), measure.vars = 3:88)
        MeanStandardCast <- dcast(MeanStandardMelt, Subject + ActionName + variable ~ ., mean)
        names(MeanStandardCast)[4] <- "Value"
        MeanStandardFinal <- MeanStandardCast %>% 
                mutate(Domain = ifelse(grepl("^f",variable),"Fourier","Time")) %>%
                mutate(Sensor = ifelse(grepl("Gyro",variable),"Gyroscope","Accelorometer")) %>%
                mutate(Motion = ifelse(grepl("Body",variable),"Body","Gravity"))
        # Rearrange the columns in a tidy format
        ActivityTrack <- select(MeanStandardFinal, Subject, ActionName, Domain, Sensor, Motion, variable, Value)
        # save(file="ActivityTrack.Rda", ActivityTrack)
        
# Summarise data by each variable for activity and subject
        act_subj_grp <- MeanStandardFinal %>% select(Subject, ActionName, Domain, Sensor, Motion, Value) %>%
                group_by(Subject, ActionName, Domain, Sensor, Motion) %>%
                arrange(Subject, ActionName, Domain, Sensor, Motion)
        # Create a summary data set of the mean
        ActivityTrackSummary <- summarise_each(act_subj_grp, funs(mean))
        # To create the sumbmission file
        # write.table(ActivityTrackSummary, file="ActivityTrackSummary.txt", row.names = FALSE)
        
# Clean up environment
        rm(list=ls()[! ls() %in% c("ActivityTrack","ActivityTrackSummary")])
        