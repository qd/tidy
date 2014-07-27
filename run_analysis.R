library(reshape2,plyr)
zipfile<-"./getdata_projectfiles_UCI HAR Dataset.zip" 
#zipped datafile must be in working directory the same as this file.
unzip(zipfile,list=T)-> files
activities<-c("WALKING", "WALKING_UPSTAIRS", "WALKING_DOWNSTAIRS", "SITTING", "STANDING", "LAYING")
confeatures<-unz(zipfile,"UCI HAR Dataset/features.txt",open="")
features<-read.table(confeatures,colClasses = "character")
#read and process test data
conxtest<-unz(zipfile,"UCI HAR Dataset/test/X_test.txt",open="")
xtest<-read.table(conxtest,colClasses="numeric")
names(xtest)<-features$V2
contestactivities<-unz(zipfile,"UCI HAR Dataset/test/y_test.txt",open="")
testactivities<-read.table(contestactivities,colClasses = "integer")
contestsubjects<-unz(zipfile,"UCI HAR Dataset/test/subject_test.txt",open="")
testsubjects<-read.table(contestsubjects,colClasses = "integer")
names(testactivities)<-"activity"
names(testsubjects)<-"subject"
testx<-cbind(testsubjects,testactivities,xtest)
#
#read and process training data
conxtrain<-unz(zipfile,"UCI HAR Dataset/train/X_train.txt",open="")
xtrain<-read.table(conxtrain,colClasses="numeric")
names(xtrain)<-features$V2
contrainactivities<-unz(zipfile,"UCI HAR Dataset/train/y_train.txt",open="")
trainactivities<-read.table(contrainactivities,colClasses = "integer")
contrainsubjects<-unz(zipfile,"UCI HAR Dataset/train/subject_train.txt",open="")
trainsubjects<-read.table(contrainsubjects,colClasses = "integer")
names(trainactivities)<-"activity"
names(trainsubjects)<-"subject"
trainx<-cbind(trainsubjects,trainactivities,xtrain)
#
#combine test and train
tidyall<-rbind(testx,trainx)
##ITEM 1 Merges the training and the test sets to create one data set (tidyall).
#
#
tidyallnames<-tidyall
tidyallnames$activity<-activities[tidyallnames$activity]
tidydatasetanswer<-tidyallnames[,grep("mean|std|subject|activity",names(tidyall))]
##ITEM 2 Extracts only the measurements on the mean and standard deviation for each measurement.
write.table(tidydatasetanswer,"tidyDataSet.txt") 
## and writes to a table in working directory  >>> THIS IS THE OUTPUT<<<
#
tidybysubject<-split(tidyall[,2:dim(tidyall)[2]],tidyall$subject)
tidybysubjectbyactivity<-lapply(tidybysubject,function(x) split(x,x$activity))
df<-ldply(tidybysubjectbyactivity,function(x) laply(x,colMeans))
#
activities<-c("WALKING", "WALKING_UPSTAIRS", "WALKING_DOWNSTAIRS", "SITTING", "STANDING", "LAYING")
df$activity<-activities[df$activity]
##ITEM 3 Uses descriptive activity names to name the activities in the data set
#
names(df)<-c("subjectID","activity",features$V2)
##ITEM 4 Appropriately labels the data set with descriptive variable names.

#