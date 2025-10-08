
# Built-In Functions ------------------------------------------------------

# creates a new numeric vector and assigns it to a new object named "sample_vector"
sample_vector<-c(5, 11, 5.6, 8)

# prints contents of "sample_vector"
sample_vector

# calculates sum of vector elements using built-in "sum" function
sum(sample_vector)

# calculates product of vector elements using built-in "prod" function
prod(sample_vector)

# calculates the mean of vector elements
mean(sample_vector)

# calculates the median of vector elements using built-in "median" function
median(sample_vector)

# calculates the number of characters in a string using built-in "nchar" function
nchar("Hello, World!")

# extracts column names for "mtcars" dataset (which is built into R) using the built-in
# "ncol" function
colnames(mtcars)

# extracts row names for "mtcars" dataset (which is built into R) using the built-in "nrow" function
rownames(mtcars)


# Packages ----------------------------------------------------------------

# install packages
install.packages("tidyverse")

# load libraries
library(tidyverse)


# Custom Functions: 1 Input -----------------------------------------------

# Converts 55 degrees fahrenheit to Celsius
(55-32)*5/9

# creates fahrenheit to celsius conversion function and assigns it to a new object 
# named "fahrenheit_to_celsius_converter"
fahrenheit_to_celsius_converter<-function(fahrenheit_input){
  celsius_output<-(fahrenheit_input-32)*5/9
  return(celsius_output)
}

# tests function using an input of 68 degrees fahrenheit
fahrenheit_to_celsius_converter(fahrenheit_input=68)

# uses "fahrenheit_to_celsius_converter" function using an input of 20 degrees fahrenheit
fahrenheit_to_celsius_converter(22)


# Custom Functions-2 Inputs -----------------------------------------------

# writes function that takes export and import values as inputs, 
# and returns a value for net exports; function is assigned to 
# a new object named "net_exports_calculation"
net_exports_calculation<-function(export, imports){
  net_export_value<-export-imports
  return(net_export_value)
}

# tests the "net_exports_calculation" function in a case 
# where exports are 133, and imports are 55
net_exports_calculation(export=133, imports=55)

# tests the "net_exports_calculation" function in a case where exports are 133, 
# and imports are 55; reverses order in which inputs are supplied but function 
# returns the same value because of the labels
net_exports_calculation(imports=55, export=133)

# tests the "net_exports_calculation" function in a case where exports are 55, 
# and imports are 133; does not explicitly label inputs, order matters
net_exports_calculation(55, 133)


# Custom Functions-Multiple Inputs ----------------------------------------

# creates a new function that takes consumption spending, government spending, 
# investment spending, and net exports as inputs, and returns a value for GDP 
# by summing these elements; function is assigned to a new object named "gdp_calculation"
gdp_calculation<-function(consumption_spending, government_spending, investment_spending, net_exports){
  gdp<-consumption_spending + government_spending + investment_spending+net_exports
  return(gdp)
}


# tests gdp calculation for consumption spending of 125, 
# government spending of 66, investment spending of 36, and net exports of -33
gdp_calculation(consumption_spending=125, government_spending=66, investment_spending = 36,
                net_exports=-33)


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
convert_temperature<-function(value, unit){
  if (unit=="Fahrenheit"){
    # Convert to Celsius
    celsius<-(value-32)*5/9
    return(celsius)
  } else if (unit=="Celsius"){
    # Convert Celsius to Fahrenheit
    fahrenheit<-(value*9/5)+32
    return(fahrenheit)
  } else {
    # Handle invalid input for the unit
    return("Please indicate whether your input is in Celsius or Fahrenheit")
  }
}

# Converts 100 degrees Fahrenheit to Celsius
convert_temperature(100, "Fahrenheit")

# Converts 25 degrees Celsius to Fahrenheit
convert_temperature(25, "Celsius")

# Attempts to convert 100 degrees Kelvin to another unit; 
# met with a message specifying the function's limitations
convert_temperature(100, "Kelvin")


# Iteration with a single-input function ----------------------------------

# creates a vector of fahrenheit inputs to iterate over
fahrenheit_input_vector<-c(45.6, 95.9, 67.9, 43)

# iteratively applies the "fahrenheit_to_celsius_converter" function 
# to the vector of input arguments, "fahrenheit_input_vector", and 
# assigns the resulting list of outputs to "celsius_outputs_vector"
celsius_outputs_list<-map(.x=fahrenheit_input_vector, .f=fahrenheit_to_celsius_converter)

# prints contents of "celsius_outputs_list"
celsius_outputs_list

# extracts second element from "celsius_outputs_list"
celsius_outputs_list[[2]]

# iteratively applies the "fahrenheit_to_celsius_converter" 
# function to the vector of input arguments, "fahrenheit_input_vector", 
# and assigns the resulting vector of outputs to "celsius_outputs_vector"
celsius_outputs_vector<-map_dbl(.x=fahrenheit_input_vector, .f=fahrenheit_to_celsius_converter)

# prints contents of "celsius_outputs_vector"
celsius_outputs_vector

# creates a data frame in which one column contains 
# Fahrenheit input values, and the other contains Celsius output values
fahrenheit_celsius_df_output<-data.frame(Fahrenheit=fahrenheit_input_vector,
                                         Celsius=map_dbl(.x=fahrenheit_input_vector, .f=fahrenheit_to_celsius_converter))

# prints contents of "fahrenheit_celsius_df_output"
fahrenheit_celsius_df_output


# Iteration with Double-Input Function ------------------------------------

# creates export and import vectors
export_vector<-c(78, 499, 785)
import_vector<-c(134, 345, 645)

# iteratively applies the "net_exports_calculation" 
# function to the export values contained in "export_vector" 
# and the import values contained in "import_vector" and 
# deposits the resulting outputs in a list that's assigned to the new 
# object entitled "net_export_list"
net_export_list<-map2(.x=export_vector, .y=import_vector, .f=net_exports_calculation)

# prints contents of "net_export_list"
net_export_list

# iteratively applies the "net_exports_calculation" function to 
# the export values contained in "export_vector" and the import 
# values contained in "import_vector" and deposits the resulting outputs 
# in a vector that's assigned to the new object entitled "net_export_vector"
net_export_vector<-map2_dbl(.x=export_vector, .y=import_vector, .f=net_exports_calculation)

# prints contents of "net_export_vector"
net_export_vector

# creates data frame with exports in first column, 
# imports in second column, and net exports in third; 
# assigns the data frame to a new object named "net_exports_dataframe"
net_exports_dataframe<-data.frame(exports=export_vector,
                                  import=import_vector,
                                  net_exports=map2_dbl(.x=export_vector, .y=import_vector, .f=net_exports_calculation))

# prints net_exports_dataframe
net_exports_dataframe

# alternative way of creating "net_exports_dataframe"
data.frame(exports=export_vector,
           imports=import_vector,
           net_exports=net_export_vector)


# Iteration With Multiple Input Function ----------------------------------

# creates a list as a container for the input arguments we'll 
# iteratively run through the "gdp_calculation" function
gdp_input_list<-list(consumption_spending=c(44, 89, 64, 33),
                     government_spending=c(54, 76, 222, 110),
                     investment_spending=c(123, 200, 55, 45),
                     net_exports=c(-55, 89, 143, -12))

# iteratively passes arguments from "gdp_input_list" to the
# "gdp_calculation" function and deposits the results in a 
# new list object named "gdp_output_list"
gdp_output_list<-pmap(.l=gdp_input_list, .f=gdp_calculation)

# prints contents of "gdp_output_list"
gdp_output_list

# iteratively passes arguments from "gdp_input_list" to the 
# "gdp_calculation" function and deposits the results in a 
# new list object named "gdp_output_vector"
gdp_output_vector<-pmap_dbl(.l=gdp_input_list, .f=gdp_calculation)

# prints contents of "gdp_output_vector"
gdp_output_vector


# Writing and Iteratively Applying More Complex Functions -----------------

# creates new function to take a country name, 
# temperature value in either Celsius or Fahrenheit, 
# and a designation for the temperature unit as inputs, 
# and return a data frame with the country name, temperature 
# value in Fahrenheit, and Temperature value in Celsius as columns;
# the function is assigned to a new object named "convert_temperature_df"
convert_temperature_df<-function(country, temperature, unit){
  if (unit=="Fahrenheit"){
    # Convert Fahrenheit to Celsius
    celsius<-(temperature-32)*(5/9)
    fahrenheit<-temperature
  } else if (unit=="Celsius") {
    # Convert Celsius to Fahrenheit
    fahrenheit<-(temperature*9/5)+32
    celsius<-temperature
  } else {
    # Throw an error if the unit is invalid
    stop("Error: Please indicate whether your input is in 'Celsius' or 'Fahrenheit")
  }
  
  # create and return
    result<-data.frame(Country=country,
                       Temperature_Celsius=round(celsius, 2),
                       Temperature_Fahrenheit=round(fahrenheit, 2))
          return(result) 
}
    
# tests "convert_temperature_df" function for USA as the country
# input, and a temperature of 100 degrees in Fahrenheit
convert_temperature_df("USA", 100, "Fahrenheit")

# tests "convert_temperature_df" function for India as 
# the country input, and a temperature of 100 degrees in Fahrenheit
convert_temperature_df("India", 39, "Celsius")

# creates a list of inputs to iterate over
input_list_temperatures<-list(country=c("USA", "Canada", "Mexico", "France"),
                              temperature=c(66, 11, 25, 33),
                              unit=c("Fahrenheit", "Celsius", "Fahrenheit", "Celsius"))

# iteratively applies the "convert_temperature_df" function 
# using the input variables in "input_list_temperatures"; the 
# outputs are deposited in a list assigned to the object named 
# "convert_temperature_list"
convert_temperature_list<-pmap(.l=input_list_temperatures, .f=convert_temperature_df)

# prints contents of "convert_temperature_list"
convert_temperature_list

# appends together the single-row data frames in "convert_temperature_list" 
# into a single data frame by passing "convert_temperature_list" as an argument 
# to "bind_rows"; the newly created data frame is assigned to a new object named 
# "convert_temperature_df_final"
convert_temperature_df_final<-bind_rows(convert_temperature_list)

# prints contents of "convert_temperature_df_final"
convert_temperature_df_final

# Writes a function that takes a vector of fahrenheit temperature 
# values, and returns either a list, data frame, or vector of outputs 
# depending on the user's desired output; assigns the function to a 
# new object named "fahrenheit_to_celsius_general"
fahrenheit_to_celsius_general<-function(vector_of_fahrenheit_inputs, desired_output){
  if (desired_output=="List"){
    outputlist<-map(.x=vector_of_fahrenheit_inputs, .f=fahrenheit_to_celsius_converter)
    return(outputlist)
  } else if (desired_output=="Vector"){
    outputvector<-map_dbl(.x=vector_of_fahrenheit_inputs, .f=fahrenheit_to_celsius_converter)
    return(outputvector)
  } else if (desired_output=="Data.Frame"){
    outputdf<-data.frame(Fahrenheit=vector_of_fahrenheit_inputs,
                         Celsius=map_dbl(.x=vector_of_fahrenheit_inputs, .f=fahrenheit_to_celsius_converter))
    return(outputdf)
  } else {
    stop("Error: Please indicate whether your desired output is a 'Vector', 'List', or 'Data.Frame")
  }
}

# tests "fahrenheit_to_celsius_general" function; first, defines a vector of fahrenheit values
test_vector_ftoc<-c(18, 66, 88, -12, 7)

# uses "fahrenheit_to_celsius_general" function to convert the temperature 
# values in "test_vector_ftoc" to Celsius and return a data frame with input 
# Fahrenheit values in one column, and corresponding celsius temperatures in another column
fahrenheit_to_celsius_general(vector_of_fahrenheit_inputs=test_vector_ftoc, "Data.Frame")

# uses "fahrenheit_to_celsius_general" function to convert the temperature values 
# in "test_vector_ftoc" to Celsius and return the outputs as a list
fahrenheit_to_celsius_general(test_vector_ftoc, "List")

# # uses "fahrenheit_to_celsius_general" function to convert the temperature values
# in "test_vector_ftoc" to Celsius and return the outputs as a vector
fahrenheit_to_celsius_general(test_vector_ftoc, "Vector")

# uses "fahrenheit_to_celsius_general" function to convert the temperature 
# values in "test_vector_ftoc" to Celsius and return the outputs as a tibble
fahrenheit_to_celsius_general(test_vector_ftoc, "Tibble")

# Global and Local Environments -------------------------------------------

# define a variable in the global environment
x<-24

# creates a toy function that takes a numeric input argument ("input1"); it defines 
# an object, x, within the function, then defines a function, z, that's the 
# sum of x and input1. It returns Z as an output
toy_function<-function(input1){
  x<-5
  z<-x+input1
  return(z)
}

# passes the argument "input1=7" to the toy function
toy_function(input1=7)

# prints value of x; note it returns the value from the global environment
x

# prints value of z; note that there's an error, since z is only defined 
# within the local environment of the function
z

# prints objects in memory; note that z is not included, since it's 
# only defined within the function
ls()


