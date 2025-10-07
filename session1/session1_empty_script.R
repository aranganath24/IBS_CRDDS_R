
# R as a Calculator -------------------------------------------------------

# calculates 2+2

# calculates 65 to the power of 4

# calculates the sum of 24 and 4, divided by 7

# calculates 2.78 subtracted from 10.453

# Object Assignment and Manipulation --------------------------------------

# assign value 5 to new object named x

# prints value assigned to "x"

# assign value 12 to new object named "y"

# prints value assigned to "y"

# prints the value of x + y

# creates a new object, named "xy_sum" whose value is the sum of "x" and "y"

# prints value of of "xy_sum"

# assign value of "8" to object named "x"

# prints updated value of "x"


# print value assigned to xy_sum


# assigns sum of "y" and newly updated value of "x" to "xy_sum" object

# prints value of "xy_sum"

# assigns string "Boulder, CO" to object named "our_location"

# prints contents assigned to "our_location" object

# prints contents of "our_Location"

# prints objects in memory

# deletes "our_location" object from memory

# prints objects in memory

# Vectors -----------------------------------------------------------------

# makes vector with values 32, 18, 41, 11

# assigns vector of temperatures from Asian cities to a new object named "asia_temperatures_celsius"

# prints contents of "asia_temperatures_celsius"


# defines new vector assigned to object named 
# "university_of_colorado_locations" that contains locations of CU campuses

# prints contents of "university_of_colorado_locations"

# creates country labels vector and assigns it to a new object names "country_labels_vector"

# uses the "names" function to assign the labels in "country_labels_vector" to the "asia_temperatures_celsius" numeric vector

# prints updated "asia_temperatures_celsius" vector with labels


# creates new vector of temperatures in Celsius of major North American cities with labels created using inline naming


# prints contents of "north_america_temperatures_celsius"

# Extracts the third element from the "asia_temperatures_celsius" vector

# Extracts the third element from the "asia_temperatures_celsius" vector using its label

# Extracts elements 1 through 3 in the "asia_temperatures_celsius" and deposits 
# these elements in a new vector

# Extracts elements 1 through 3 in the "asia_temperatures_celsius" and deposits these 
# elements in a new vector assigned to the object "asia_temperatures_subsetted_1to3"

# prints contents of "asia_temperatures_subsetted_1to3"

# removes second element in "asia_temperatures_celsius" vector and 
# returns a vector with the remaining values

# removes second and third elements in "asia_temperatures_celsius" vector 
# (i.e. the temperatures associated with Hanoi and Singapore) and returns a vector 
# with the remaining temperature values

# tries to extract the first and third elements from "asia_temperatures_celsius" 
# and deposit them into a new vector

# extracts the first and third elements from "asia_temperatures_celsius" 
# and deposits them into a new vector

# Removes the first and third elements from "asia_temperatures_celsius" and 
# makes a new vector with the remaining elements

# extracts temperature values for Mumbai and Singapore and deposits them in a new vector using labels

# Adds temperatures for Jakarta and Manila to the "asia_temperatures_celsius" vector

# prints contents of updated "asia_temperatures_celsius" vector

# combines "asia_temperatures_celsius" vector and "north_america_temperatures_celsius" 
# into a new combined vector that's assigned to an object named 
# "asia_north_america_temperatures_celsius"

# prints contents of "asia_north_america_temperatures_celsius"

# extracts the second element from "university_of_colorado_locations"

# extracts the second through third elements from "university_of_colorado_locations"

# extracts the second and third elements from "university_of_colorado_locations" using a 
# negative index number to remove the first element

# creates character vector of CSU campus locations and assigns it to a
# new vector named "colorado_state_university_locations"

# creates new character vector that combines elements from "university_of_colorado_locations" 
# and "colorado_state_university_locations" and assigns it to a new object named 
# "co_public_university_locations"

# prints contents of "co_public_university_locations"

# uses the "names" function to assign labels to the "co_public_university_locations" vector elements

# prints contents of "co_public_university_locations" updated with labels

# creates vector of flagship university locations, with labels designating if 
# a location is associated with the UC or CSU flagship

# prints contents of "flagship_university_locations"


# Adds "Global" campus to "colorado_state_university_locations" vector


# prints updated contents of "colorado_state_university_locations" 

# adds global location to "co_public_university_locations" along with CSU label

# prints updated contents of "co_public_university_locations"


# prints contents of "asia_temperatures_celsius"


# adds two to each element of "asia_temperatures_celsius" vector


# adds two to each element of "asia_temperatures_celsius" vector and 
# assigns the changes back to the object

# prints updated contents of "asia_temperatures_celsius"


# applies the Celsius to Fahrenheit conversion formula to all of the Celsius 
# temperatures in "asia_temperatures_fahrenheit" and assigns the resulting vector 
# of Fahrenheit temperatures to a new object named "asia_temperatures_fahrenheit"

# prints contents of "asia_temperatures_fahrenheit"

# prints contents of "north_america_temperatures_celsius"

# creates vector of temperatures in Celsius for the same North American 
# cities as in the "north_america_temperatures_celsius" vector for a subsequent time 
# period, and assigns the vector to a new object named "north_america_temperatures_celsius_B"


# Computes the difference between "north_america_temperatures_celsius_B" and 
# "north_america_temperatures_celsius" and assigns the difference to a new object 
# named "north_america_temperature_difference"

# prints north_america_temperature_difference

# creates two new vectors, "a" and "b" of unequal length


# adds a +v

# creates vector of university names

# creates vector of locations

# uses paste0 function to paste the strings in "university_names" and 
# "locations" together in element-wise fashion and assign the resulting character 
# vector to "university_name_location"


# prints contents of "university_name_location"

# Data Frames -------------------------------------------------------------

# Creates a toy country-level data frame 


# prints "country_df" data frame to console

# extracts entire first row from "country_df"

# extracts entire second row from "country_df"

# extracts entire third column from "country_df"

# extracts entire third column from "country_df" and assigns 
# it to an object named country_df_column

# prints contents of "country_df_column"

# extracts entire third row from "country_df" and assigns it to an object named country_df_row

# prints contents of "country_df_row"

# extracts second and third rows from "country_df"

# extracts second through third rows, and first through third columns from "country_df"

# extracts the third row, and first and second columns, from "country_df"

# extracts first and third rows from "country_df", while excluding second row

# extracts first, second, and fourth columns from "country_df"

# extracts the first and third rows, and second and fourth columns, 
# from "country_df" and assigns it to a new object named "dataset_selection"

# prints contents of "dataset_selection"

# extracts "Continent" column from "country_df"

# extracts "GDP" column from "country_df" and assigns it to a new object named "country_df_gdp"

# prints contents of "country_df_gdp"

# Lists -------------------------------------------------------------------

# creates list whose elements are the "arbitrary_values" numeric vector, 
# the "months_four" character vector, and the "country_df" data frame, 
# and assigns it to a new object named "example_list"

# prints contents of "example_list"

# extracts third element from "example_list"

# extracts first and third elements from "example_list"

# creates a character vector of desired names for list elements, and 
# assigns it to a new object named "name_vector"

# assigns names from "name_vector" to list elements in "example_list"

# prints contents of "example_list"

# Extracts the data frame from "example_list" by its assigned name

# Extracts the "element3" data frame from "example_list" by its index number

# create a list with inline naming

# prints contents of "example_list_alt"

# extracts "university_name_location" vector from "example_list_alt" using its assigned name 

# Data Classes ------------------------------------------------------------

# prints class of "example_list"

# prints class of "asia_temperatures_fahrenheit"

# prints class of "country_df"

# prints class of "country_df_gdp"

# prints class of "country_df_row"

# converts "asia_temperatures_fahrenheit" to data frame class 
# and assigns the data frame to a new object named "asia_temperatures_df"

# prints class of "asia_temperatures_df"

