# Download and create directory
# Check if folder exist, create otherwise
datadirectory <- ".\\downloads\\activitytracking\\dataset"
        if (!file.exists(datadirectory)) {
                dir.create(datadirectory)
        }
# download to ("C:\\Users\\khuisamen\\Downloads"
dataurl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(dataurl, datadirectory, method) #from the internet
dataDownloaded<- date() #run this to keep track of version and when it was done