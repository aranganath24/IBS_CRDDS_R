
# Preliminaries and Setup -------------------------------------------------

# install relevant packages that haven't previously been installed
install.packages(c("tidyverse", "psych", "janitor", "fastDummies",
                   "summarytools", "stargazer", "gtsummary", "gteffects"))

# load packages
library(tidyverse)
library(psych)
library(janitor)
library(fastDummies)
library(summarytools)
library(stargazer)
library(gtsummary)
library(gteffects)

# read in qog data
qog<-read_csv("data/quality_of_government/qog_bas_cs_jan25.csv")

# make a copy of the "qog" data 

# select qog variables

# Create Column of Continent Names


# Missing Data ------------------------------------------------------------

# makes toy dataset, assigned to object named "student_scores"

# uses "is.na" to return a logical matrix indicating missing values (TRUE for missing values)

# calculates total number of missing values in "student_scores"; matrix is coerced to a logical
# vector before the "TRUE" values (set to 1) are summed up

# calculates total number of missing values per column

# calculates missing data percentage in "student_scores"
# first calculates count of missing values and assigns it to "total_missing"

# calculates total number of cells and assigns it to "total_values"

# calculates percentage of missing data and assigns it to "missing_pct"


# prints contents of "missing_pct"

# creates function to calculate the percentage of missing data in a dataset


# passes "student_scores" as an argument to custom function "missing_data_percentage" 
# which yields the percentage of missing data in the "student_scores" dataset

# calculates missing data percentage in pt_copy

# calculates percentage of missing data per column in "student_scores" and 
# assigns the resulting vector to an object named "missing_pct_per_col"

# prints contents of "missing_pct_per_col"

# removes all rows with NA values from "student_scores"

# removes all rows where "Age" has NA values in "student_scores"

# removes all rows where "Score" has NA values in "student_scores"

# replace NA values in the "Score" column with 0

# calculates mean of "Score" (NA values are not excluded; default behavior)

# calculates mean of "Score" (NA values are excluded due to na.rm=TRUE specification; 
# as a result, the function computes an average based on non-NA values)

# Descriptive Statistics --------------------------------------------------

# Generate summary statistics for "qog_copy_selection" and assign table of 
# summary statistics to a new object named "qog_copy_selection_summarystats1"

# prints "qog_copy_selection_summarystats1"

# Views "qog_copy_selection_summarystats1" in Viewer

# removes non-numeric variables

# Generates summary statistics for numeric variables 
# (i.e. those in qog_copy_selection_numeric) using "describe()

# prints "qog_copy_selection_summarystats1"

# views "qog_copy_selection_summarystats1"

# looks up documentation for "describe"

# prints "student_scores"

# generates summary statistics with "describe()" function 
# and assigns it to "df_sample_summary_default"; 
# na.rm=TRUE ignores NA values when calculating summary statistics

# prints "student_scores_summarystats"

# generates summary statistics with describe function and assigns
# it to "df_sample_summary_B"; na.rm=FALSE removes rows with any NA values 
# before calculating summary statistics (in other words, summary statistics 
# are computed on rows with complete data)

# prints "student_scores_summarystats_B"


# Write Custom Function to Include NA Information in Summary Table --------

# Define a named function to count missing values


# applies "count_missing" function to the columns of "student_scores", 
# and deposits the results (i.e. count of missing values in each 
# column of "student_scores") to a numeric vector assigned to the object 
# "missing_values_vector"

# adds "missing_values_vector" as a column named "missing_values" to 
# "student_scores_summarystats" summary stats table

# makes function to automate the creation of a "missing_value" column in summary statistics
# generated. by describe()


# tests "summary_stats_na" on "qog_copy_selection_numeric"

# uses "descr" function from summarytools package to 
# create a table of summary statistics as a data frame 
# and assigns it to "pt_summary_ST"

# uses stargazer package to generate summary statistics for "qog_copy_selection_numeric"

# creates frequency table for the region variable


# adds percentage column and assigns modified frequency
# table to new object called "region_frequency"

# prints contents of "region_frequency"

# creates crosstab with "region" and "bmr_dem" (dichotomous democracy indicator) variables

# makes cross tab with sum values on margins

# adds column for NA values

# Creates summary statistics for each regional grouping, 
# and puts results in list named "summary_stats_by_region"

# Accessing continent-level summary statistics for 
# The Pacific from the "summary_stats_by_region" list

# Group-level summary statistics can be assigned to their own object for easy retrieval

# Generate a table that displays summary statistics for "wdi_trade" and "wdi_fdiin" at the 
# continent level and assign to object named "trade_fdi_by_region"


# views "trade_fdi_by_region" in data viewer

# round to two decimal places





# Exploratory Visualization -----------------------------------------------

# filters South Asia observations

# Creates a bar chart of the "wdi_trade" variable (central government expenditure as a share of GDP) 
# for the South Asia observations and assigns the plot to an object named "trade_southasia"


# prints "trade_southasia"

# Creates a bar chart of the "wdi_trade" variable
# for the South Asia observations; countries are on the 
# x axis and arrayed in ascending order with respect to the 
# trade variable, which is on the y-axis; assigns the plot to an 
# object named "trade_southasia_ascending"


# prints "trade_southasia_ascending"


# Creates a bar chart of the "wdi_trade" variable 
# for the South Asia observations; countries are on the x axis and arrayed in descending order with respect to the 
# trade variable, which is on the y-axis; assigns the plot to an object named "trade_southasia_descending"



# prints "trade_southasia_descending"


# creates inverted bar chart of "wdi_trade" for South Asian Countries
# and assigns to "wdi_trade_inverted"


# prints "wdi_trade_inverted"


# fixes x axis labels


# prints updated "wdi_trade_inverted"

# Creates scatterplot with "wdi_taxrev" variable on x-axis and "wdi_trade" 
# variable on y-axis and assigns to object named "tax_trade_scatter"



# uses color to distinguish between observations from different regions in the 
# scatterplot 

# uses facets to make panel of different scatter plot ofs "wdi_trade" and "wdi_taxrev" 
# for each region


# prints "tax_trade_scatter_facets"

# sets string breaks for region labels/title
qog_copy_selection$region<-str_wrap(qog_copy_selection$region, width=10)

# creates facet plot with new string breaks



# layers line of best fit over scatterplot; wdi_trade on y axis axis and wdi_taxrev
# on x axis; assigns new plot to object named "tax_trade_scatter_line"


# prints "tax_trade_scatter_line"

# Regresion ---------------------------------------------------------------

# computes correlation coefficient between "wdi_taxrev" and "wdi_trade" variables and assigns 
# the result to a new object named "trade_cgexp_cc"

# prints results of "tax_trade_cc"


# cleans up formatting of "tax_trade_cc"

# assigns well-formatted model output to "trade_cgexp_cc_clean"

# prints contents of "tax_trade_clean_corr"


# removes dummy variables from "qog_copy_selection_numeric" before making correlation
# matrix

# creates correlation matrix for observations in "qog_copy_selection_numeric_continuous"
# and assigns result to object named "qog_copy_selection_numeric_cor_matrix"

# prints contents of "qog_copy_selection_numeric_cor_matrix"













