data_analysis
=============
### R script explanation:

run_analysis.R script takes test and train data and merges them into one file
script processes train and test data separately and merges them upon completion
reshape package needs to be installed

1.  features.txt file contains column names. Data from this file is 
    transposed and safved as a vector. 
2.  grepl is used to find occurances of std() and mean() inside col.names
    vector. This is used to create boolean vector of desired columns. This
    is then applied to dataset
3.  subject train/test and activity train/test files are loaded and added to
    the dataset using cbind function
4.  train and test datasets are merged together using merge function. After
    merging is complete, transform is used to replace 1..6 with proper
    activity names
5.  melt function is used to transform dataset. subject and activity are left
    as IDs while other columns are declared as variables. 
6.  cast is used to aggregate data in a tidy dataset. there are 180 rows each
    representing one activity per user (30 users, 6 activities). Mean values of
    each variable are saved in separate columns.
7.  write.table is used to save result to file. There are two versions included - 
    one with header, and one without. 
