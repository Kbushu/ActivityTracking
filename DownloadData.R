# Download and create directory
# Check if folder exist, create otherwise
in_dir <- paste0(getwd(),"/","data")
        if (!dir.exists(in_dir)) {
                dir.create(in_dir)
        }
# download to ("C:\\Users\\khuisamen\\Downloads"
dataurl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(dataurl, datadirectory, method) #from the internet
dataDownloaded<- date() #run this to keep track of version and when it was done