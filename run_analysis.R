#Merges the training and the test sets to create one data set
train<-read.table("train/X_train.txt",sep="",header=F)
head(train)
test<-read.table("test/X_test.txt",sep="",header=F)
head(test)
train[,562]<-read.table("train/Y_train.txt",sep="",header=F)
train[,563]<-read.table("train/subject_train.txt",sep="",header=F)
test[,562]<-read.table("test/Y_test.txt",sep="",header=F)
test[,563]<-read.table("test/subject_test.txt",sep="",header=F)
data<-rbind(test,train)

#Extracts only the measurements on the mean and standard deviation for each measurement.
feature<-read.table("features.txt",sep="")
fea<-grep("-mean|(-std)\\(\\)",feature[,2])
meanstd<-data[,fea]

#Use descriptive activity names and descriptive variable names
a<-feature[,2]
a<-as.character(a)
names(data)<-c(a,"Activity","Subject")

#Get tidy data
library(reshape2)
mel<-melt(data,id=c("Activity","Subject"))
tidy<-dcast(mel,Activity+Subject~variable,mean)
write.table(tidy,file="tidydata.txt",row.name=FALSE,sep="\t")
