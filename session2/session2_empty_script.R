
# Built-In Functions ------------------------------------------------------

# creates a new numeric vector and assigns it to a new object named "sample_vector"

# prints contents of "sample_vector"

# calculates sum of vector elements using built-in "sum" function

# calculates product of vector elements using built-in "prod" function

# calculates the mean of vector elements

# calculates the median of vector elements using built-in "median" function

# calculates the number of characters in a string using built-in "nchar" function

# extracts column names for "mtcars" dataset (which is built into R) using the built-in
# "ncol" function

# extracts row names for "mtcars" dataset (which is built into R) using the built-in "nrow" function


# Packages ----------------------------------------------------------------

# install packages (tidyverse)

# load libraries

# Custom Functions: 1 Input -----------------------------------------------

# Converts 55 degrees fahrenheit to Celsius

# creates fahrenheit to celsius conversion function and assigns it to a new object 
# named "fahrenheit_to_celsius_converter"


# tests function using an input of 68 degrees fahrenheit

# uses "fahrenheit_to_celsius_converter" function using an input of 20 degrees fahrenheit


# Custom Functions-2 Inputs -----------------------------------------------

# writes function that takes export and import values as inputs, 
# and returns a value for net exports; function is assigned to 
# a new object named "net_exports_calculation"

# tests the "net_exports_calculation" function in a case 
# where exports are 133, and imports are 55

# tests the "net_exports_calculation" function in a case where exports are 133, 
# and imports are 55; reverses order in which inputs are supplied but function 
# returns the same value because of the labels

# tests the "net_exports_calculation" function in a case where exports are 55, 
# and imports are 133; does not explicitly label inputs, order matters


# Custom Functions-Multiple Inputs ----------------------------------------

# creates a new function that takes consumption spending, government spending, 
# investment spending, and net exports as inputs, and returns a value for GDP 
# by summing these elements; function is assigned to a new object named "gdp_calculation"



# tests gdp calculation for consumption spending of 125, 
# government spending of 66, investment spending of 36, and net exports of -33



# Custom Functions: if-then Statements ------------------------------------

# creates a function that takes a temperature value ("value"), 
# and a temperature scale label ("unit") that is either "Fahrenheit" or 
# "Celsius" which designates the temperature scale of the input temperature 
# value; if the input argument is in "Fahrenheit", the function converts the 
# temperature to Celsius and returns this value; if the input is in "Celsius" 
# the function converts the temperature to Fahrenheit and returns this value; 
# if the the temperature scale label is neither "Fahrenheit" nor "Celsius" 
# an error message is returned to the user; the function is assigned to 
# a new object named "convert_temperature"

# Converts 100 degrees Fahrenheit to Celsius

# Converts 25 degrees Celsius to Fahrenheit


# Attempts to convert 100 degrees Kelvin to another unit; 
# met with a message specifying the function's limitations


# Iteration with a single-input function ----------------------------------

# creates a vector of fahrenheit inputs to iterate over

# iteratively applies the "fahrenheit_to_celsius_converter" function 
# to the vector of input arguments, "fahrenheit_input_vector", and 
# assigns the resulting list of outputs to "celsius_outputs_vector"

# prints contents of "celsius_outputs_list"

# extracts second element from "celsius_outputs_list"

# iteratively applies the "fahrenheit_to_celsius_converter" 
# function to the vector of input arguments, "fahrenheit_input_vector", 
# and assigns the resulting vector of outputs to "celsius_outputs_vector"

# prints contents of "celsius_outputs_vector"

# creates a data frame in which one column contains 
# Fahrenheit input values, and the other contains Celsius output values

# prints contents of "fahrenheit_celsius_df_output"


# Iteration with Double-Input Function ------------------------------------

# creates export and import vectors


# iteratively applies the "net_exports_calculation" 
# function to the export values contained in "export_vector" 
# and the import values contained in "import_vector" and 
# deposits the resulting outputs in a list that's assigned to the new 
# object entitled "net_export_list"

# prints contents of "net_export_list"

# iteratively applies the "net_exports_calculation" function to 
# the export values contained in "export_vector" and the import 
# values contained in "import_vector" and deposits the resulting outputs 
# in a vector that's assigned to the new object entitled "net_export_vector"

# prints contents of "net_export_vector"


# creates data frame with exports in first column, 
# imports in second column, and net exports in third; 
# assigns the data frame to a new object named "net_exports_dataframe"

# prints net_exports_dataframe


# alternative way of creating "net_exports_dataframe"



# Iteration With Multiple Input Function ----------------------------------

# creates a list as a container for the input arguments we'll 
# iteratively run through the "gdp_calculation" function


# iteratively passes arguments from "gdp_input_list" to the
# "gdp_calculation" function and deposits the results in a 
# new list object named "gdp_output_list"

# prints contents of "gdp_output_list"


# iteratively passes arguments from "gdp_input_list" to the 
# "gdp_calculation" function and deposits the results in a 
# new list object named "gdp_output_vector"

# prints contents of "gdp_output_vector"


# Writing and Iteratively Applying More Complex Functions -----------------

# creates new function to take a country name, 
# temperature value in either Celsius or Fahrenheit, 
# and a designation for the temperature unit as inputs, 
# and return a data frame with the country name, temperature 
# value in Fahrenheit, and Temperature value in Celsius as columns;
# the function is assigned to a new object named "convert_temperature_df"

    
# tests "convert_temperature_df" function for USA as the country
# input, and a temperature of 100 degrees in Fahrenheit

# tests "convert_temperature_df" function for India as 
# the country input, and a temperature of 100 degrees in Fahrenheit

# creates a list of inputs to iterate over


# iteratively applies the "convert_temperature_df" function 
# using the input variables in "input_list_temperatures"; the 
# outputs are deposited in a list assigned to the object named 
# "convert_temperature_list"

# prints contents of "convert_temperature_list"

# appends together the single-row data frames in "convert_temperature_list" 
# into a single data frame by passing "convert_temperature_list" as an argument 
# to "bind_rows"; the newly created data frame is assigned to a new object named 
# "convert_temperature_df_final"

# prints contents of "convert_temperature_df_final"


# Writes a function that takes a vector of fahrenheit temperature 
# values, and returns either a list, data frame, or vector of outputs 
# depending on the user's desired output; assigns the function to a 
# new object named "fahrenheit_to_celsius_general"

# tests "fahrenheit_to_celsius_general" function; first, defines a vector of fahrenheit values

# uses "fahrenheit_to_celsius_general" function to convert the temperature 
# values in "test_vector_ftoc" to Celsius and return a data frame with input 
# Fahrenheit values in one column, and corresponding celsius temperatures in another column

# uses "fahrenheit_to_celsius_general" function to convert the temperature values 
# in "test_vector_ftoc" to Celsius and return the outputs as a list

# # uses "fahrenheit_to_celsius_general" function to convert the temperature values
# in "test_vector_ftoc" to Celsius and return the outputs as a vector

# uses "fahrenheit_to_celsius_general" function to convert the temperature 
# values in "test_vector_ftoc" to Celsius and return the outputs as a tibble

# Global and Local Environments -------------------------------------------

# define a variable in the global environment

# creates a toy function that takes a numeric input argument ("input1"); it defines 
# an object, x, within the function, then defines a function, z, that's the 
# sum of x and input1. It returns Z as an output


# passes the argument "input1=7" to the toy function

# prints value of x; note it returns the value from the global environment


# prints value of z; note that there's an error, since z is only defined 
# within the local environment of the function


# prints objects in memory; note that z is not included, since it's 
# only defined within the function


