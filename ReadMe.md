#READ ME

This repo contains elements required for the Getting and Cleaning Data course project. 

##Included in this repo is

- This readme file
- An R script (run_analysis.R)
- Codebook.md = a description of the data provided, used, and processed for this project

##About run_analysis.R script

The run_analysis.R script processes the provided UCI HAR Dataset and creates a tidy data as per the requirments for the course project. Information about the required data needed to run the script and the project requirments can be found in the Codebook.md

**The script has the following requirements:**

- in the working directory is the downloaded data in a sub directory named /UCI HAR Dataset/
- the R packages data.table and reshape2 have been installed

**Running the script:**

The script does not require any user interaction beyond starting it. The script will provide messages as to the status of reading and processing the UCI HAR data.  

The outcome of the script is that a file named tidy.txt will be created in the working directory. The file contains a tidy data set of mean of each mean and stardard deviation value in the test and train data sets.  Details of the all the transformations made by run_analysis.R script can be found in CodeBook.md


