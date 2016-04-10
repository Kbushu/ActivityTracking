---
title: "Codebook"
author: "K. Huisamen"
date: "01 April 2016"
output: html_document
---
#Introduction
This code book describes the variables, the data, and any transformations or work performed to clean up the data.

#Variables
Variable (with units!)

variable.names(act_avg_std_data)

time.  Since samples collected at 50Hz means record taken every 0.02 seconds, this used for time interval (a new column added to the raw data) 

Accelorometer Measures
        Body
                Time Based (tBodyAcc)
                        Jerk Movement (tBodyAccJerk-XYZ)
                                Jerk Magnitude (tBodyAccJerkMag)
                        Magnitude (tBodyAccMag)
                        Gravity (tGravityAcc)
                                Magnitude (tGravityAccMag)
                Fourier (fBodyAcc)

Gyroscope Measures
        Time Domain (tGyro)
                Body (tBodyGyro)
                        Jerk Movement (tBodyGyroJerk-XYZ)
                                Jerk Magnitude (tBodyGyroJerkMag)
                        Magnitude (tBodyGyroMag)
                        
                Gravity (tBodyGravityGyro)

1. Time Accelorometer Body (tBodyAcc - 40 measures)
2. Time Accelorometer Gravity (tGravityAcc - 40)
3. Time Accelorometer Jerk (tBodyAccJerk - 40)
4. Time Gyroscopic Body (tBodyGyro - 40)
5. Time Gyroscopic Jerk (tBodyGyroJerk - 40)
6. Time Accelorometer Magnitude (tBodyAccMag - 13)
7. Time Accelorometer Gravity Magnitude (tGravityAccMag- 13)
8. Time Accelorometor Jerk Magnitude (tBodyAccJerkMag - 13)
9. Time Gyroscopic Body Magnitude (tBodyGyroMag - 13)
10. Time Gyroscopic Body Jerk Magnitude (tBodyGyroJerkMag - 13)
11. Fourier Accelorometer Body (fBodyAcc - )
12. Fourier Accelorometer Body Jerk (fBodyAccJerk - )
13. Fourier Gyroscopic Body (fBodyGyro)
14. Fourier Accelorometer Magnitude (fBodyAccMag - 13)
15. Fourier Accelorometer Jerk Magnitude (fBodyBodyAccJerkMag - )
16. Fourier Gyroscopic Body Magnitude (fBodyBodyGyroMag)
17. Fourier Gyroscopic Jerk Magnitude (fBodyBodyGyroJerkMag)
18. Angular (angle)
 





#Info about summary choices made

#Info about experimental study design used

#Other tips
1. Word/Text file
2. Section called "Study Design"
3. Section called "Code Book" for variable definition





