#CODEBOOK --Human Actvity Recognition using Smartphones#

###Column 1 - Partioning##
#####Character. Assigns the collected data to one of to sets:training data (70% of the volunteers) or test data (30% of the volunteers).###
#####train###
#####test###

###Column 2 - Activity_Names##
#####Character. Six different Activities performed by the volunteers.###
######STANDING
######SITTING
######LAYING
######WALKING
######WALKING_DOWNSTAIRS
######WALKING_UPSTAIRS

###Column 3 - Subject##
#####Integer. Each number 1:30 corresponds to a volunteer/ subject###
        
###Column 4 - Measurement_Type##
#####Character. Describes the Measurement_Value.
#####The labelling reads as following: 
#####t = time domain signals, f= frequency domain signals,
#####Acc = Accelerometer, Gyro = Gyroscope, X,Y,Z = X, Y, Z direction, 
#####average_mean = the average of the means for each variable for each activity and each subject, average_std = the average of the std for each variable for each activity and each subject. 
#####66 LEVELS:
######tBodyAcc_average_mean_X       
######tBodyAcc_average_mean_Y  
######tBodyAcc_average_mean_Z           
######tGravityAcc_average_mean_X       
######tGravityAcc_average_mean_Y        
######tGravityAcc_average_mean_Z       
######tBodyAccJerk_average_mean_X       
######tBodyAccJerk_average_mean_Y      
######tBodyAccJerk_average_mean_Z      
######tBodyGyro_average_mean_X         
######tBodyGyro_average_mean_Y          
######tBodyGyro_average_mean_Z         
######tBodyGyroJerk_average_mean_X      
######tBodyGyroJerk_average_mean_Y     
######tBodyGyroJerk_average_mean_Z      
######tBodyAccMag_average_mean     
######tGravityAccMag_average_mean       
######tBodyAccJerkMag_average_mean    
######tBodyGyroMag_average_mean        
######tBodyGyroJerkMag_average_mean    
######fBodyAcc_average_mean_X   
######fBodyAcc_average_mean_Y          
######fBodyAcc_average_mean_Z           
#####fBodyAccJerk_average_mean_X      
######fBodyAccJerk_average_mean_Y       
######fBodyAccJerk_average_mean_Z     
######fBodyGyro_average_mean_X          
######fBodyGyro_average_mean_Y         
######fBodyGyro_average_mean_Z          
######fBodyAccMag_average_mean         
######fBodyBodyAccJerkMag_average_mean 
######fBodyBodyGyroMag_average_mean   
######fBodyBodyGyroJerkMag_average_mean 
######tBodyAcc_average_std_X           
######tBodyAcc_average_std_Y           
######tBodyAcc_average_std_Z           
######tGravityAcc_average_std_X         
######tGravityAcc_average_std_Y        
######tGravityAcc_average_std_Z         
######tBodyAccJerk_average_std_X       
######tBodyAccJerk_average_std_Y        
######tBodyAccJerk_average_std_Z       
######tBodyGyro_average_std_X           
######tBodyGyro_average_std_Y          
######tBodyGyro_average_std_Z           
######tBodyGyroJerk_average_std_X      
######tBodyGyroJerk_average_std_Y       
######tBodyGyroJerk_average_std_Z     
######tBodyAccMag_average_std           
######tGravityAccMag_average_std       
######tBodyAccJerkMag_average_std       
######tBodyGyroMag_average_std         
######tBodyGyroJerkMag_average_std      
######fBodyAcc_average_std_X           
######fBodyAcc_average_std_Y            
######fBodyAcc_average_std_Z           
######fBodyAccJerk_average_std_X        
######fBodyAccJerk_average_std_Y      
######fBodyAccJerk_average_std_Z        
######fBodyGyro_average_std_X          
######fBodyGyro_average_std_Y           
######fBodyGyro_average_std_Z          
######fBodyAccMag_average_std           
######fBodyBodyAccJerkMag_average_std 
######fBodyBodyGyroMag_average_std     
######fBodyBodyGyroJerkMag_average_std

###Column 5 - Measurement_Value##
#####Numeric. Value corresponding to the Measurement_Type. The Average calculated for  each variable for each activity and each subject.
#####Data are normalized and bounded within [-1,1]###

