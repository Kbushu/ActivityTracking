
==================================================================
# DS_GC_Assignment
Wk4 Assignment
==================================================================

This file describes the "Getting and Cleaning Data Assignment". The assignment demonstrate how raw data can be changed in order to make further processing more logical and easier.  This assignment used data from the accelorometer and gyroscope of a Samsung S2 which was used during an experiment to recognise human activity. The experiment was carried out on 30 volunteers, 19-48 years old, where each subject performed six activities (WALKING, WALKING UPSTAIRS, WALKING DOWNSTAIRS, SITTING, STANDING, LAYING). For more information on the experiment visit www.smartlab.ws.

The following files are included in this assignment:

- 'README.md': This file.

- 'CodeBook.md': Information about the variables.

- 'run_analysis.R': Analysis script that read the raw data and produce the data sets.

#Raw Date
The raw data and reference information can be downloaded from:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

The full codebook can be found at: 
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

To use this analysis it will be necessary to create a folder called __data__ in the working directory from which the analysis will be performed, exract the zip file into this data directory.

>The analysis will stop and an error message will be produced if the extracted files cannot be found. The error message will include the path for where the analysis expect the files to be, to assist in avoiding further issues. 

#Output 1 - Tidy data Set of Mean and Standard Deviation Variables
Start the analysis by running the script __run analysis.R__. This will combine the activity name, subject, train and test data all into one data set. Because each record in the raw data contains mutiple measured variables, additional columns is created to tidy the data set. The _domain_ column is based on time or Fourier, the _Sensor_ variable specify accelorometer or gyroscope, the _motion_ variable specify body or gravity. Where variable names contains multiples of the sensor and motion it is assumed that the first appearance dictates to prescribing measure, example _angle.tBodyAccMean.gravity_ is assumed that domain is time, motion is body and sensor is accelorometer. Note however that only variables with the words _mean_ or _standard_ is kept, the resulting data set is called __ActivityTrack__.

#Output 2 - Summary Data
The next step of the script group the data set from the previous output by subject, activity, and the additional variables identified.  The summary is based on the mean value for the variables and this data set is called __ActivityTrackSummary__.

This was done on Windows 7 with R3.2.2
