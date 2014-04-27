CodeBook
=============

### Data Variables used in run_analysis script:

1.  activity1 and activity2 - activity values taken from y_train and y_test files
2.  subject1 and subject2 - subject information values taken from subjet_train and test files
3.  dataset1 and dataset2 - measurement values taken from x_train and x_test files
4.  labels - colum names taken from features.txt files
5.  tidydataset1 and tidydataset2 - dataset1 and 2 with only std and mean columns and added subject/activity columns
6.  tidydataset - merged tidydataset1 and tidydataset2
7.  dataMelt - transformed tidydataset to make it easier for casting
8.  finalDataset - result of casting dataMelt data to produce tidy and clean result


### Other variables used: 

1.  columfilter - boolean vector with values for desired columns
2.  x - column names vector. created by transposing labels data 
3.  y - helper vector used in casting to define variables 


### Data transformations performed: 

1.  t() - used to transpose features.txt data to column names vector
2.  grepl() - used to find occurances of std() and mean() in dataset column names
3.  cbind() - used to add column to data frame
4.  merge() - used to merge two data frames together
5.  transform() - used to swap activity values with proper descriptions (e.g 1 was replaced with WALKING)
6.  melt() - used to transform data to make it easier for casting. Subject and Activity were left as ID fields. 
7.  cast() - used to create final tidy dataset. mean function was applied to each of the variable measurements for each subject/activity
