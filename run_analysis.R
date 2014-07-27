
##setwd("UCI HAR Dataset")

## read in variable names and observation labels
feat = read.table("features.txt",header=F)
y_train = read.table("./train/y_train.txt", header=F)
subj_train = read.table("./train/subject_train.txt", header=F)
y_test = read.table("./test/y_test.txt", header=F)
subj_test = read.table("./test/subject_test.txt", header=F)
str(y_train)
str(subj_train)
str(y_test)
str(subj_test)
subj_act_train = cbind(subj_train,y_train)
subj_act_test = cbind(subj_test, y_test)
names(subj_act_train) = c("subject", "activity")
names(subj_act_test) = c("subject", "activity")

## read in the dataset
trainData = read.table("./train/X_train.txt", header=F)
testData = read.table("./test/X_test.txt", header=F)

## Appropriately labels the data set with descriptive variable names
feat1 <- lapply(feat, gsub, pattern = "\\(\\)", replacement = "")
str(feat1)
names(trainData) = feat1$V2
names(testData) = feat1$V2

## bind the subjects and activities to the data set
trainData = cbind(subj_act_train, trainData)
testData = cbind(subj_act_test, testData)
head(trainData)
str(trainData)
str(testData)
head(testData)

## Extracts only the measurements on the mean and standard deviation for each measurement
## grep the multiple variable names
names <- grep("mean|std", names(trainData))
names
trainData1 <- trainData[, c(1,2,names)]
testData1 <- testData[, c(1,2,names)]
head(trainData1)
str(testData1)
str(trainData1)

## Merges the training and the test sets to create one data set
mergedData <- merge(trainData1,testData1, all=T)
str(mergedData)
orderedData = mergedData[order(mergedData$subject, mergedData$activity), ]
str(orderedData)
head(orderedData)
tail(orderedData)

## Uses descriptive activity names to name the activities in the data set
orderedData$activity <- gsub("1","walk", orderedData$activity)
orderedData$activity <- gsub("2","walk_upstairs", orderedData$activity)
orderedData$activity <- gsub("3","walk_downstairs", orderedData$activity)
orderedData$activity <- gsub("4","sit", orderedData$activity)
orderedData$activity <- gsub("5","stand", orderedData$activity)
orderedData$activity <- gsub("6","lay", orderedData$activity)
str(orderedData)
head(orderedData)
tail(orderedData)
orderedData$subject <- as.character(orderedData$subject)

## Creates a second, independent tidy data set 
## with the average of each variable for each activity and each subject
dataMean <- aggregate(orderedData, list(orderedData$subject, orderedData$activity), mean)
str(dataMean)
names(dataMean)
head(dataMean)
tail(dataMean)
dataMean$subject <- NULL
dataMean$activity <- NULL
names(dataMean) <- sub("Group.1", "subject", names(dataMean))
names(dataMean) <- sub("Group.2", "activity", names(dataMean))

## dataMean[is.na(dataMean), ]
## export the tidy data out
write.table(dataMean, "dataMean.txt", sep="\t")
# dat1 <- read.table("dataMean1.txt", header=T)
# head(dat1)
# str(dat1)

