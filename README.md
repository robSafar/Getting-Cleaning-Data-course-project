# Getting and Cleaning Data course project
Peer-graded Assignment: Getting and Cleaning Data Course Project (Coursera)

## Introduction to the data

This data pertains to an experiment in human activity recognition using smartphones.

> The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

Full details on the original dataset can be found in the `README.txt` file included in the archive and on [the site where the data was originally obtained](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones).

This project aims to merge and clean the original datasets, filtering to only provide the mean and standard deviation for each measurement per observation. Following this, another dataset is provided that details the average results per subject and activity for each measurement.

## Replication

### Software

R version 3.3.2 (2016-10-31) -- "Sincere Pumpkin Patch"
Platform: x86_64-apple-darwin16.1.0 (64-bit)

Additional R libraries: dplyr 0.5.0

### Process

The [original data set](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip) should be unzipped and placed in a folder called `./rawData/` within the working directory. This path is used throughout the `run_analysis.R` script to process and clean the data.

Running the script will then output two .CSV files: a full, clean dataset in `mergedData.csv` and a summary dataset in `averageSummary.csv`.

The included `CodeBook.md` describes the variables and the transformations involved in the script.
