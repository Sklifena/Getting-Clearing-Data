library(data.table)

#1.Merges the training and the test sets to create one data set.

#read the train mesurments file into data.table data.frame
#setwd("~/data/UCI HAR Dataset/train")-(data is already in working directory)
xtrain<-fread("X_train.txt")

#Add activity colunm read from subject_train.txt file
activity<-fread("y_train.txt")
xtrain$act<-activity$V1

#Add subject colunm read  subject_train.txt from file
subject<-fread("subject_train.txt")
xtrain$sbj<-subject$V1


#read the test mesurments file into data.table data.frame
#setwd("~/data/UCI HAR Dataset/test")
xtest<-fread("X_test.txt")

#Add activity colunm read from subject_test.txt file
activity<-fread("y_test.txt")
xtest$act<-activity$V1

#Add subject colunm read  subject_test.txt from file
subject<-fread("subject_test.txt")
xtest$sbj<-subject$V1

#merge train and test data into one data frame
alldata<-rbind(xtrain,xtest)

#2.Extracts only the measurements on the mean and standard deviation for each measurement.

#select  only mean(), std(), subject and activity coulumns

fet<-fread("~/data/UCI HAR Dataset/features.txt")
ncol<-fet$V2 
nmean<-grep("mean()", ncol)
nstd<-grep("std()", ncol)
OK<-c(nmean,nstd,562,563)
data<-alldata[,OK,with=FALSE]

#3.Uses descriptive activity names to name the activities in the data set
#convert activity to factor and change values
data$act<-factor(data$act)
levels(data$act)[1] <- "WALKING"
levels(data$act)[2] <- "WALKING_UPSTAIRS"
levels(data$act)[3] <- "WALKING_DOWNSTAIRS"
levels(data$act)[4] <- "SITTING"
levels(data$act)[5] <- "STANDING"
levels(data$act)[6] <- "LAYING"

#4.Appropriately labels the data set with descriptive variable names. 
#create vector with the names ftom features.txt file , select with alreadx cretes selector vector,
# and extend  it with activity and soubject names

features<-fread("features.txt")

datanames<-features$V2
datanames<-datanames[c(nmean,nstd)]
datanames<-c(datanames,"activity","subject")
colnames(data)<-datanames


#5.From the data set in step 4, creates a second, independent tidy data set
#with the average of each variable for each activity and each subject.

#summarize data-avarege of all coulumns grouping by  subject and activity
aggdata <-aggregate(data[,1:79,with=FALSE], list(data$activity,data$subject), ave)
#flatten data frames to be written into txt
end.df <- data.frame(lapply(aggdata, as.character), stringsAsFactors=FALSE)
#creating file with the tiny data
write.table(end.df,"step5.txt",row.names=FALSE)



