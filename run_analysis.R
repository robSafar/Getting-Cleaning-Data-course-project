## Verify environment

library(dplyr) # required for final calculation summarising

## Load datasets

features <- read.table("./rawData/features.txt")
activity_labels <- read.table("./rawData/activity_labels.txt")
X_test <- read.table("./rawData/test/X_test.txt")
y_test <- read.table("./rawData/test/y_test.txt")
subject_test <- read.table("./rawData/test/subject_test.txt")
X_train <- read.table("./rawData/train/X_train.txt")
y_train <- read.table("./rawData/train/y_train.txt")
subject_train <- read.table("./rawData/train/subject_train.txt")

## Prepare & merge partitioned data frames

a <- grepl("mean\\(|std\\(",features[[2]]) # only mean() and std() variables

X_test <- X_test[a]
partition_test <- data.frame(partition = rep.int("test",length(X_test[[1]])))
test <- cbind(subject_test,partition_test,y_test,X_test)

X_train <- X_train[a]
partition_train <- data.frame(partition = rep.int("train",length(X_train[[1]])))
train <- cbind(subject_train,partition_train,y_train,X_train)

mergedData <- rbind(test,train)

## Label & factorise relevant columns

names(mergedData) <- c("subject","partition","activity",as.character(features[[2]][a]))

mergedData$subject <- as.factor(mergedData$subject)
mergedData$activity <- as.factor(mergedData$activity) ; levels(mergedData$activity) <- activity_labels[[2]]
mergedData$partition <- as.factor(mergedData$partition)

write.csv(mergedData,file="./mergedData.csv",row.names=FALSE) # **Subject column loses factor class in saved file**

## Provide calculation summary

averageSummary <- mergedData[-2] %>% # excluding redundant partition column 
        group_by(activity,subject) %>% 
        summarize_all(mean)

write.csv(averageSummary,file="./averageSummary.csv",row.names=FALSE)