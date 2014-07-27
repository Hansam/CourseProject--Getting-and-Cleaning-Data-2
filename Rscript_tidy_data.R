setwd("/Users/hss1g09/DataScience/Getting and Cleaning Data/Asignment")

#LOAD RELEVANT LIBRARIES--------------------------------------------------------
library(reshape2)
#-------------------------------------------------------------------------------

#BEFORE THE ASSIGNMENT---------------------------------------------------------- 
#Dataset location
fileURL<-"https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip "

#Download dataset
download.file(fileURL,"/Users/hss1g09/DataScience/Getting and Cleaning Data/Asignment/Assignment_Dataset.zip", method="curl")
data<-unzip("/Users/hss1g09/DataScience/Getting and Cleaning Data/Asignment/Assignment_Dataset.zip")

list(data)

#Descriptive Datasets
features<-read.table(data[2]) #561 obs. of 2 variables
features_vec<-as.character(features[,2]) #561 obs. of 1 variables
activity_labels<-read.table(data[1]) #6 obs. of  2 variables

#TRAINING DATASET
subject_train<-read.table(data[26]) #7352 obs. of  1 variable
X_train<-read.table(data[27]) #7352 obs. of  561 variables
Y_train<-read.table(data[28]) #7352 obs. of  1 variable

#merge TRAIN DATASET
XY_train<-cbind(Y_train,X_train) #7352 obs. of  562 variables:
#attach 'subject_train' 
Sub_XY_train<-cbind(subject_train,XY_train) ##7352 obs. of  563 variables:
#add 'train' label
Partition<-c(rep("train",nrow(Sub_XY_train)))
Sub_XY_train<-cbind(Partition,Sub_XY_train)

#TEST DATASET
subject_test<-read.table(data[14]) #2947 obs. of  1 variable
X_test<-read.table(data[15]) #2947 obs. of  561 variables
Y_test<-read.table(data[16])#2947 obs. of  1 variable
#merge TEST DATASET
XY_test<-cbind(Y_test,X_test) #2947 obs. of  562 variables:
#attach 'subject_test' 
Sub_XY_test<-cbind(subject_test,XY_test) ##2947 obs. of  563 variables:
#add 'test' label
Partition<-c(rep("test",nrow(Sub_XY_test)))
Sub_XY_test<-cbind(Partition,Sub_XY_test)

#ASSIGNMENT POINT 1------------------------------------------------------------- 
#Merges the training and the test sets to create one data set
        #merge TRAIN and TEST into one DataSet
Train_Test<-rbind(Sub_XY_train,Sub_XY_test) #10299 obs. of  564 variables
        #add column names based on features data set
colnames(Train_Test)<-c("Partition","Subject","Activity",features_vec)
        #check for NAs in the Train_Test
sum(is.na(Train_Test))

#ASSIGNMENT POINT 3-------------------------------------------------------------
#Use descriptive activity names to name the activities in the data set
        #make a character vector that is equivalent to Train_Test$Activity
Activity_Names<-vector()
counter<-1
for (i in Train_Test$Activity){
        Activity_Names[counter] <- as.character(activity_labels[i,2])
        counter<-counter+1
}

        #add the new Vector "Activity_Names" to Train_Test
Train_Test<-cbind(Activity_Names, Train_Test)

#ASSIGNMENT POINT 2-------------------------------------------------------------
#Extract the measurements on the mean and standard deviation for each measurement 
        #Extract column names
all_col_names<- colnames(Train_Test) 
        #create logical vector where TRUE is a column of means or stds
selected_means<-all_col_names %in% grep("-mean()",all_col_names,value=TRUE,fixed=TRUE)
selected_stds<-all_col_names %in% grep("-std()",all_col_names,value=TRUE,fixed=TRUE)
        #make dataframe of all means
means<-data.frame()
counter<-1
for(j in 1:length(selected_means)){
        
        if (selected_means[j]==TRUE){
                means[1:nrow(Train_Test),counter]<-Train_Test[,j,drop=FALSE] 
                counter<-counter+1
                
        }
        
        
        
}
        #make dataframe of all stds
stds<-data.frame()
counter<-1
for(j in 1:length(selected_stds)){
        
        if (selected_stds[j]==TRUE){
                stds[1:nrow(Train_Test),counter]<-Train_Test[,j,drop=FALSE] 
                counter<-counter+1
                
        }
        
        
        
}


#ASSIGNMENT POINT 4-------------------------------------------------------------
# 4 Appropriately labels the data set with descriptive variable names. 

        #merge data frame means and stds and re-attach Partition, Activity_names and Subject
means_stds<-cbind(Train_Test[,"Partition",drop=FALSE],Activity_Names,Train_Test[,"Subject",drop=FALSE],means,stds)
        #relabel colnames by dropping -()- from colnames
colnames(means_stds)<- gsub("\\()","",colnames(means_stds))
colnames(means_stds)<- gsub("-","_",colnames(means_stds))
colnames(means_stds)<- gsub("BodyBody","Body",colnames(means_stds),fixed=TRUE)
        #reshape data set to get a table with 5 columns, new columns: Measurement type and Measurement value
means_stds_new<-melt(means_stds,id=c("Partition","Activity_Names","Subject"),variable.name="Measurement_Type",value.name="Measurement_Value")
        #writes data.frame means_stds_new into a .csv file
write.table(means_stds_new,"/Users/hss1g09/DataScience/Getting and Cleaning Data/Asignment/TidyDataSet1.csv")


#ASSIGNMENT POINT 5-------------------------------------------------------------
# 5 Creates a second, independent tidy data set with the average of each variable 
#for each activity and each subject. 

average_data <- aggregate(. ~ Subject + Activity_Names + Partition, data = means_stds, FUN=mean)
colnames(average_data)<- gsub("mean","average_mean",colnames(average_data))
colnames(average_data)<- gsub("std","average_std",colnames(average_data))
average_data_new<-melt(average_data,id=c("Partition","Activity_Names","Subject"),variable.name="Measurement_Type",value.name="Measurement_Value")
write.table(average_data_new,"/Users/hss1g09/DataScience/Getting and Cleaning Data/Asignment/TidyDataSet2.csv")
