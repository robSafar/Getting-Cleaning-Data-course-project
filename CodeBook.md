# Codebook: Getting & Cleaning Data course project

## Variables

Position | Label | Description
--- | --- | ---
1 | "subject" | Factor, 30 levels: 1 to 30.
2 | "partition" | Factor, 2 levels: "test", "train".
3 | "activity" | Factor, 6 levels: "WALKING", "WALKING_UPSTAIRS", "WALKING_DOWNSTAIRS", "SITTING", "STANDING", "LAYING".
4 | "tBodyAcc-mean()-X" | Numeric
5 | "tBodyAcc-mean()-Y" | Numeric
6 | "tBodyAcc-mean()-Z" | Numeric
7 | "tBodyAcc-std()-X" | Numeric
8 | "tBodyAcc-std()-Y" | Numeric
9 | "tBodyAcc-std()-Z" | Numeric
10 | "tGravityAcc-mean()-X" | Numeric
11 | "tGravityAcc-mean()-Y" | Numeric
12 | "tGravityAcc-mean()-Z" | Numeric
13 | "tGravityAcc-std()-X" | Numeric
14 | "tGravityAcc-std()-Y" | Numeric
15 | "tGravityAcc-std()-Z" | Numeric
16 | "tBodyAccJerk-mean()-X" | Numeric
17 | "tBodyAccJerk-mean()-Y" | Numeric
18 | "tBodyAccJerk-mean()-Z" | Numeric
19 | "tBodyAccJerk-std()-X" | Numeric
20 | "tBodyAccJerk-std()-Y" | Numeric
21 | "tBodyAccJerk-std()-Z" | Numeric
22 | "tBodyGyro-mean()-X" | Numeric
23 | "tBodyGyro-mean()-Y" | Numeric
24 | "tBodyGyro-mean()-Z" | Numeric
25 | "tBodyGyro-std()-X" | Numeric
26 | "tBodyGyro-std()-Y" | Numeric
27 | "tBodyGyro-std()-Z" | Numeric
28 | "tBodyGyroJerk-mean()-X" | Numeric
29 | "tBodyGyroJerk-mean()-Y" | Numeric
30 | "tBodyGyroJerk-mean()-Z" | Numeric
31 | "tBodyGyroJerk-std()-X" | Numeric
32 | "tBodyGyroJerk-std()-Y" | Numeric
33 | "tBodyGyroJerk-std()-Z" | Numeric
34 | "tBodyAccMag-mean()" | Numeric
35 | "tBodyAccMag-std()" | Numeric
36 | "tGravityAccMag-mean()" | Numeric
37 | "tGravityAccMag-std()" | Numeric
38 | "tBodyAccJerkMag-mean()" | Numeric
39 | "tBodyAccJerkMag-std()" | Numeric
40 | "tBodyGyroMag-mean()" | Numeric
41 | "tBodyGyroMag-std()" | Numeric
42 | "tBodyGyroJerkMag-mean()" | Numeric
43 | "tBodyGyroJerkMag-std()" | Numeric
44 | "fBodyAcc-mean()-X" | Numeric
45 | "fBodyAcc-mean()-Y" | Numeric
46 | "fBodyAcc-mean()-Z" | Numeric
47 | "fBodyAcc-std()-X" | Numeric
48 | "fBodyAcc-std()-Y" | Numeric
49 | "fBodyAcc-std()-Z" | Numeric
50 | "fBodyAccJerk-mean()-X" | Numeric
51 | "fBodyAccJerk-mean()-Y" | Numeric
52 | "fBodyAccJerk-mean()-Z" | Numeric
53 | "fBodyAccJerk-std()-X" | Numeric
54 | "fBodyAccJerk-std()-Y" | Numeric
55 | "fBodyAccJerk-std()-Z" | Numeric
56 | "fBodyGyro-mean()-X" | Numeric
57 | "fBodyGyro-mean()-Y" | Numeric
58 | "fBodyGyro-mean()-Z" | Numeric
59 | "fBodyGyro-std()-X" | Numeric
60 | "fBodyGyro-std()-Y" | Numeric
61 | "fBodyGyro-std()-Z" | Numeric
62 | "fBodyAccMag-mean()" | Numeric
63 | "fBodyAccMag-std()" | Numeric
64 | "fBodyBodyAccJerkMag-mean()" | Numeric
65 | "fBodyBodyAccJerkMag-std()" | Numeric
66 | "fBodyBodyGyroMag-mean()" | Numeric
67 | "fBodyBodyGyroMag-std()" | Numeric
68 | "fBodyBodyGyroJerkMag-mean()" | Numeric
69 | "fBodyBodyGyroJerkMag-std()" | Numeric

## Transformations

*Note: the "test" and "train" datasets share a common filesystem structure. For brevity, where below "test" is used the same location applies interchanged with "train".*

### Cleaning

- Filter dataset variables to leave only those pertaining to mean and standard deviation. These data are found in the original files `./rawData/test/X_test.txt`, with `./rawData/features.txt` providing the 561 total labels.
- Create "partition" factor vectors for both "test" and "train" datasets to record partitioning after merge.
- Assemble full "test" and "train" datasets to include: 
	- "subject" from `./rawData/test/subject_test.txt`
	- "partition"
	- "activity" from `./rawData/test/y_test.txt`
	- filtered variables from `./rawData/test/X_test.txt`.
- Bind the "test" and "train" datasets together.
- Apply labels to the new, merged data frame, referring to `./rawData/features.txt` for the `X*.txt` variables.
- Ensure first three columns are factor class, applying levels to "activity" from `./rawData/activity_labels.txt`.

### Summarizing

- Exclude partition column from summary data.
- Grouping by activity & subject columns, apply the `summarize_all` command to get the averages for all remaining variables in the above clean dataset.