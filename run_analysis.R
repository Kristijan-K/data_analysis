labels<-read.table("./UCI HAR Dataset/features.txt",header=FALSE)
dataset1<-read.table("./UCI HAR Dataset/train/X_train.txt",header=FALSE)
x<-t(labels)
x<-x[2,]
names(dataset1)<-x
columnfilter <- (grepl("mean()",names(dataset1)) | grepl("std()",names(dataset1))) & !grepl("meanFreq()",names(dataset1))
tidydataset1<-dataset1[,columnfilter]
subject1<-read.table("./UCI HAR Dataset/train/subject_train.txt",header=FALSE)
names(subject1)<-"subject"
activity1<-read.table("./UCI HAR Dataset/train/y_train.txt",header=FALSE)
names(activity1)<-"activity"
tidydataset1<-cbind(subject1,tidydataset1)
tidydataset1<-cbind(activity1,tidydataset1)
dataset2<-read.table("./UCI HAR Dataset/test/X_test.txt",header=FALSE)
names(dataset2)<-x
tidydataset2<-dataset2[,columnfilter]
subject2<-read.table("./UCI HAR Dataset/test/subject_test.txt",header=FALSE)
names(subject2)<-"subject"
activity2<-read.table("./UCI HAR Dataset/test/y_test.txt",header=FALSE)
names(activity2)<-"activity"
tidydataset2<-cbind(subject2,tidydataset2)
tidydataset2<-cbind(activity2,tidydataset2)
tidydataset<-merge(tidydataset1,tidydataset2,all=TRUE)
tidydataset <- transform(tidydataset,activity = ifelse(activity == 1,"WALKING",ifelse(activity==2,"WALKING_UPSTAIRS",ifelse(activity==3,"WALKING_DOWNSTAIRS",ifelse(activity==4,"SITTING",ifelse(activity==5,"STANDING","LAYING"))))))
library(reshape)
y<-names(tidydataset)
y<-y[3:68]
dataMelt<-melt(tidydataset,id=c("subject","activity"),measure.vars=y)
finalDataset<-cast(dataMelt,subject+activity~variable,mean)
write.table(finalDataset,file="finalDataset.txt",row.names=FALSE,sep=" ",quote=FALSE)
write.table(finalDataset,file="finalDatasetClean.txt",col.names=FALSE,row.names=FALSE,sep=" ",quote=FALSE)