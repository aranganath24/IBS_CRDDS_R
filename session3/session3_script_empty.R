# install packages

# load libraries


# reads in the workshop dataset (Persson and Tabellini cross-national dataset) 
# by passing the file path as an argument to the "read_csv" and assigns it to a 
# new object named "qog"

# prints contents of "qog" object to console


# views "qog" in data viewer

# Reads in cross-national CSV dataset directly from QoG website and assigns it to a new object named "qog_direct"
qog_direct<-read_csv("https://www.qogdata.pol.gu.se/data/qog_bas_cs_jan25.csv")

# prints contents of qog_direct


# reads dataset into R from Dropbox and assigns it to a new object named "qog_cloud"

# prints contents of "qog_cloud" to the console

# reads in stata version of QoG crossnational dataset from local drive using haven's "read_dta" function and assigns the data to a new object named "qog_stata"

# prints contents of "qog_stata"


# prints the names of the files we want to read in and 
# assigns the vector of strings to a new object named "worldbank_filenames" 

# prints "worldbank_filenames"

# iteratively passes file names in "worldbank_filenames" to 
# the "read_csv" function, and deposits imported world bank files 
# into a list that is assigned to an object named "world_bank_list"; 
# assumes the working directory is the one with the world bank files


# prints contents of "world_bank_list"

# removes CSV extension from "worldbank_filenames"

# assigns names to datasets in "world_bank_list"

# prints "world_bank_list"


# extracts fdi dataset from "world_bank_list" by assigned label


# Data Processing with a single dataset -----------------------------------

# makes a copy of "qog", called "qog_copy" that we can use for processing; 
# keeps the original data frame, "qog" untouched

# selects columns/variables from "qog_copy" and assigns the 
# modified data frame to a new object named "qog_copy_select"

# Views "qog_copy_select_initial" in Viewer

# selects columns/variables from "qog_copy" using the 
# pipe syntax and assigns the modified data frame 
# to a new object named "qog_copy_select"


# subsets "qog_copy_select_initial" using the "filter()" function to 
# include only observations with undp_hdi>0.8, and deposits the modified 
# dataset into a new object named "qog_final_processed"

# views qog_final_processed

# uses pipe notation to select columns and filter according to a condition


# selects specific variables from "qog_copy" and assigns the selection to a new object named "qog_copy_selection"


# Views "qog_copy_selection" in the data viewer

# removes "cname" column from "qog_copy_selection"

# deletes "cname", "undp_hdi", and "wdi_acel" from "qog_copy_selection"

# moves "ccdoealp" to front of "qog_copy_selection" dataset

# sets the order for the first four columns of "qog_copy_selection" 
# and assigns the result back to "qog_copy_selection"


# renames "ccodealp" variable in "qog_copy_selection" to "iso3"


# renames "undp_hdi" variable to "hdi", and "wdi_area" to 
# "wdi_area_sqkm" in "qog_copy_selection" data frame


# sorts "qog_copy_selection" data frame in ascending (low to high) order 
# with respect to the "wdi_trade" variable, and then brings the "wdi_trade" variable


# sorts "qog_copy_selection" data frame in descending (high to low) order with 
# respect to the "wdi_trade" variable, and then brings the "wdi_trade" variable 
# to the front of the dataset


# arranges the "qog_copy_selection" data frame in ascending order
# with respect to "ht_region" and then in descending order with respect 
# to "wdi_trade", and then relocates these variables to the front of the 
# dataset; changes are assigned back to "qog_copy_selection" to store these changes

# Views "qog_copy_selection" in the data viewer

# Creates new variable named "mip" (percentage of men in parliement) 
# that is calculated by substracting the women's share of parliamentary seats 
# ("wdi_wip") from 100 and relocates these variables to the front of the dataset


# creates "land_area_sqmiles" variable based on "wdi_area" 
# and "no_electricity_access" variable based on "wdi_acel"



# Creates a new dummy variable based on the existing "wdi_trade" 
# variable named "trade_open" (which takes on a value of "1" if "trade" is 
# greater than or equal to 60, and 0 otherwise) and then moves the newly 
# created variables to the front of the datasetall changes are 
# assigned to "qog_copy_selection", thereby overwriting the existing version 
# of "qog_copy_selection"



# prints updated contents of "qog_copy_selection"

# Creates a new variable in the "pt_copy" dataset named "trade_level" (that is coded as "Low_Trade" when the "wdi_trade" variable is greater than 15 and less than 50, coded as "Intermediate_Trade" when "wdi_trade" is greater than or equal to 50 and less than 100, and coded as "High_Trade" when "wdi_trade" is greater than or equal to 100), and then reorders the dataset to move "trade_level" and "wdi_trade" to the front of the dataset; the changes are assigned back to "qog_copy_selection"

# prints updated contents of "qog_copy_selection"

# Creates dummy variables from "trade_level" column, and relocates the new dummies to the front of the dataset; assigns changes back to "qog_copy_selection"



# uses the filter() function to extract South East Asia observations from
# "qog_copy_selection" and assigns the result to a new object named "se_asia_data"

# prints "se_asia_data" to console


# subsets data to include Sub-Saharan African countries with a "undp_hdi" value 
# greater than or equal to 0.65 and assigns the result to an object named "sub_saharan_africa_hdi"


# prints "sub_saharan_africa_hdi"


# Filters observations from "sub_saharan_africa_hdi" for which the 
# "trade_level" variable is set to "Intermediate_Trade"


# filters observations from "sub_saharan_africa_hdi" for which 
# the "trade_level" variable is NOT set to "High_Trade"

# uses the "filter()" function to extract observations from 
# South-East Asia (ht_region=7) and East Asia (ht_region=6) and 
# assigns the result to a new object named "east_asia"


# prints contents of "east_asia"



# Processing Multiple Datasets --------------------------------------------

# extracts fdi dataset from "world_bank_list" by assigned name 
# and assigns it to a new object named "wdi_fdi"

# extracts debt dataset from "world_bank_list" by 
# assigned name and assigns it to a new object named "wdi_trade"

# drop na's and rename variable in in trade dataset and assign to "wdi_trade_cleaned"


# drop na's and rename variable in in FDI dataset and assign to "wdi_fdi_cleaned"


# join together "wdi_fdi_cleaned" and "wdi_fdi_cleaned" using country code

# Views "fdi_trade_join" in viewr

# Appends "worldbank_trade_2019" to "worldbank_fdi_2019" and assigns 
# new dataset to object named "worldbank_trade_fdi"


# cleans the dataset before reshaping


# prints class of "economic_variables" column

# converts "economic_variables" to numeric

# reshapes "worldbank_trade_fdi_cleaned" from long to wide and 
# assigns the wide dataset to an object named "worldbank_trade_fdi_wide"

# prints contents of "worldbank_trade_fdi_wide"

# renames columns in "worldbank_trade_fdi_wide"


# reshapes "worldbank_trade_fdi_wide" back to long format and 
# assigns the reshaped dataset to a new object named "world_bank_trade_long"



# write function to clean World Bank dataset



# passes "wdi_trade" to "worldbank_cleaning_function"

# Iteratively apply "worldbank_cleaning_function" to all of the 
# datasets in "world_bank_list", and deposit the cleaned datasets into 
# a new list named "world_bank_list_cleaned"

# prints contents of "world_bank_list_cleaned"


# exports "east_asia" to a local directory (i.e. the "outputs" sub-directory of our 
# working directory)

# create file names for exported World Bank files

# prints "WB_filenames_export" contents

# exports datasets in "world_bank_list_cleaned" to "outputs" directory using 
# filenames in "WB_filenames_export"

