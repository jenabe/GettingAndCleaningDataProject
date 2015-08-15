##download and unzip the source data - note unzipped files can be found in the  './UCI HAR Dataset' dir in the wd
download.file('https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip', destfile='smartlab.zip')
unzip('smartlab.zip')

##Open the required libraries. Assumes from the markdown codebook that user have these installed
library(reshape2)
library(dplyr)

##get the activity labels
activitylabels <- read.table("./UCI HAR Dataset/activity_labels.txt",col.names=c("activity_id","activity_name"))

##get column names
features <- read.table("./UCI HAR Dataset/features.txt")
columnnames <- features[,2]

##load the test and train datasets
testdata <- read.table("./UCI HAR Dataset/test/X_test.txt")
traindata <- read.table("./UCI HAR Dataset/train/X_train.txt")

##add the column names to the test and train datasets
colnames(testdata)<-columnnames
colnames(traindata)<-columnnames

##load the subjects who performed the activities into a dataframe and label the column
trainsubjectids <- read.table("./UCI HAR Dataset/train/subject_train.txt")
testsubjectids <- read.table("./UCI HAR Dataset/test/subject_test.txt")
colnames(trainsubjectids)<-"subject_id"
colnames(testsubjectids)<-"subject_id"

##load the activity ids of the test and train data into a dataframe and labe the column
trainactivityids <- read.table("./UCI HAR Dataset/train/y_train.txt")
testactivityids<- read.table("./UCI HAR Dataset/test/y_test.txt")
colnames(trainactivityids)<-"activity_id"
colnames(testactivityids)<-"activity_id"

##combine the subject, activity and the test and train data into a complete/merged dataset
test<-cbind(testsubjectids,testactivityids,testdata)
train<-cbind(trainsubjectids,trainactivityids,traindata)
fulldata<-rbind(test,train)

##extract out only columns related to measurements on the mean and standard deviation for each measurement
meancolumns<-grep('mean',names(fulldata),ignore.case=TRUE)
stdcolumns<-grep('std',names(fulldata),ignore.case=TRUE)
meanstddata<-fulldata[,c("subject_id","activity_id",names(fulldata[,meancolumns]),names(fulldata[,stdcolumns]))]

##add the descriptive activity names to the dataset
tidydata<-inner_join(meanstddata,activitylabels,by="activity_id")

##create second tidy data set with the average of each variable for each activity/subject
tidydatatoo <- tidydata %>% group_by(activity_id,subject_id) %>% summarise_each(funs(mean))