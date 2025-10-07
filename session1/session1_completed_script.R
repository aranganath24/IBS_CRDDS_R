
# R as a Calculator -------------------------------------------------------

# calculates 2+2
2+2

# calculates 65 to the power of 4
65^4

# calculates the sum of 24 and 4, divided by 7
(24+4)/7

# calculates 2.78 subtracted from 10.453
10.453-2.78

# Object Assignment and Manipulation --------------------------------------

# assign value 5 to new object named x
x<-5

# prints value assigned to "x"
x

# assign value 12 to new object named "y"
y<-12

# prints value assigned to "y"
y

# prints the value of x + y
x+y

# creates a new object, named "xy_sum" whose value is the sum of "x" and "y"
xy_sum<-x+y

# prints value of of "xy_sum"
xy_sum

# assign value of "8" to object named "x"
x<-8

# prints updated value of "x"
x

# print value assigned to xy_sum
xy_sum

# assigns sum of "y" and newly updated value of "x" to "xy_sum" object
xy_sum<-x+y

# prints value of "xy_sum"
x+y

# assigns string "Boulder, CO" to object named "our_location"
our_location<-"Boulder, CO"

# prints contents assigned to "our_location" object
our_location

# prints contents of "our_Location"
our_Location

# prints objects in memory
ls()

# deletes "our_location" object from memory
rm(our_location)

# prints objects in memory
ls()


# Vectors -----------------------------------------------------------------

# makes vector with values 32, 18, 41, 11
c(32, 18, 41, 11)

# assigns vector of temperatures from Asian cities to a new object named "asia_temperatures_celsius"
asia_temperatures_celsius<-c(32, 18, 41, 11)

# prints contents of "asia_temperatures_celsius"
asia_temperatures_celsius

# defines new vector assigned to object named 
# "university_of_colorado_locations" that contains locations of CU campuses
university_of_colorado_locations<-c("Boulder", "Denver", "Colorado Springs")

# prints contents of "university_of_colorado_locations"
university_of_colorado_locations

# creates country labels vector and assigns it to a new object names "country_labels_vector"
country_labels_vector<-c("Mumbai", "Hanoi", "Singapore", "Beijing")

# uses the "names" function to assign the labels in "country_labels_vector" to the "asia_temperatures_celsius" numeric vector
names(asia_temperatures_celsius)<-country_labels_vector

# prints updated "asia_temperatures_celsius" vector with labels
asia_temperatures_celsius

# creates new vector of temperatures in Celsius of major North American cities with labels created using inline naming
north_america_temperatures_celsius<-c("New York City"=25, "Toronto"=15, "Mexico City"=8, "Vancouver"=10,
                                      "Boston"=12.5)

# prints contents of "north_america_temperatures_celsius"
north_america_temperatures_celsius

# Extracts the third element from the "asia_temperatures_celsius" vector
asia_temperatures_celsius[3]

# Extracts the third element from the "asia_temperatures_celsius" vector using its label
asia_temperatures_celsius["Singapore"]

# Extracts elements 1 through 3 in the "asia_temperatures_celsius" and deposits 
# these elements in a new vector
asia_temperatures_celsius[1:3]

# Extracts elements 1 through 3 in the "asia_temperatures_celsius" and deposits these 
# elements in a new vector assigned to the object "asia_temperatures_subsetted_1to3"
asia_temperatures_subsetted_1to3<-asia_temperatures_celsius[1:3]

# prints contents of "asia_temperatures_subsetted_1to3"
asia_temperatures_subsetted_1to3

# removes second element in "asia_temperatures_celsius" vector and 
# returns a vector with the remaining values
asia_temperatures_celsius[-2]

# removes second and third elements in "asia_temperatures_celsius" vector 
# (i.e. the temperatures associated with Hanoi and Singapore) and returns a vector 
# with the remaining temperature values
asia_temperatures_celsius[-2:-3]

# tries to extract the first and third elements from "asia_temperatures_celsius" 
# and deposit them into a new vector
asia_temperatures_celsius[1, 3]

# extracts the first and third elements from "asia_temperatures_celsius" 
# and deposits them into a new vector
asia_temperatures_celsius[c(1,3)]

# Removes the first and third elements from "asia_temperatures_celsius" and 
# makes a new vector with the remaining elements
asia_temperatures_celsius[c(-1, -3)]

# extracts temperature values for Mumbai and Singapore and deposits them in a new vector using labels
asia_temperatures_celsius[c("Mumbai", "Singapore")]

# Adds temperatures for Jakarta and Manila to the "asia_temperatures_celsius" vector
asia_temperatures_celsius<-c(asia_temperatures_celsius, "Jakarta"=32, "Manila"=26.5)

# prints contents of updated "asia_temperatures_celsius" vector
asia_temperatures_celsius

# combines "asia_temperatures_celsius" vector and "north_america_temperatures_celsius" 
# into a new combined vector that's assigned to an object named 
# "asia_north_america_temperatures_celsius"
asia_north_america_temperatures_celsius<-c(asia_temperatures_celsius, north_america_temperatures_celsius)

# prints contents of "asia_north_america_temperatures_celsius"
asia_north_america_temperatures_celsius

# extracts the second element from "university_of_colorado_locations"
university_of_colorado_locations[2]

# extracts the second through third elements from "university_of_colorado_locations"
university_of_colorado_locations[2:3]

# extracts the second and third elements from "university_of_colorado_locations" using a 
# negative index number to remove the first element
university_of_colorado_locations[-1]

# creates character vector of CSU campus locations and assigns it to a
# new vector named "colorado_state_university_locations"
colorado_state_university_locations<-c("Fort Collins", "Pueblo")

# creates new character vector that combines elements from "university_of_colorado_locations" 
# and "colorado_state_university_locations" and assigns it to a new object named 
# "co_public_university_locations"
co_public_university_locations<-c(university_of_colorado_locations, colorado_state_university_locations)

# prints contents of "co_public_university_locations"
co_public_university_locations

# uses the "names" function to assign labels to the "co_public_university_locations" vector elements
names(co_public_university_locations)<-c("UC", "UC", "UC", "CSU", "CSU")

# prints contents of "co_public_university_locations" updated with labels
co_public_university_locations

# creates vector of flagship university locations, with labels designating if 
# a location is associated with the UC or CSU flagship
flagship_university_locations<-c(UC="Boulder", CSU="Fort Collins")

# prints contents of "flagship_university_locations"
flagship_university_locations

# Adds "Global" campus to "colorado_state_university_locations" vector
colorado_state_university_locations<-c(colorado_state_university_locations, "Global")

# prints updated contents of "colorado_state_university_locations" 
colorado_state_university_locations

# adds global location to "co_public_university_locations" along with CSU label
co_public_university_locations<-c(co_public_university_locations, CSU="Global")

# prints updated contents of "co_public_university_locations"
co_public_university_locations

# prints contents of "asia_temperatures_celsius"
asia_temperatures_celsius

# adds two to each element of "asia_temperatures_celsius" vector
asia_temperatures_celsius+2

# adds two to each element of "asia_temperatures_celsius" vector and 
# assigns the changes back to the object
asia_temperatures_celsius<-asia_temperatures_celsius+2

# prints updated contents of "asia_temperatures_celsius"
asia_temperatures_celsius

# applies the Celsius to Fahrenheit conversion formula to all of the Celsius 
# temperatures in "asia_temperatures_fahrenheit" and assigns the resulting vector 
# of Fahrenheit temperatures to a new object named "asia_temperatures_fahrenheit"
asia_temperatures_fahrenheit<-asia_temperatures_celsius*(9/5)+32

# prints contents of "asia_temperatures_fahrenheit"
asia_temperatures_fahrenheit

# prints contents of "north_america_temperatures_celsius"
north_america_temperatures_celsius

# creates vector of temperatures in Celsius for the same North American 
# cities as in the "north_america_temperatures_celsius" vector for a subsequent time 
# period, and assigns the vector to a new object named "north_america_temperatures_celsius_B"
north_america_temperatures_celsius_B<-c("New York City"=27, "Toronto"=11, "Mexico City"=8.5,
                                        "Vancouver"=10, "Boston"=12.5)

# Computes the difference between "north_america_temperatures_celsius_B" and 
# "north_america_temperatures_celsius" and assigns the difference to a new object 
# named "north_america_temperature_difference"
north_america_temperature_difference<-north_america_temperatures_celsius_B-north_america_temperatures_celsius

# prints north_america_temperature_difference
north_america_temperature_difference

# creates two new vectors, "a" and "b" of unequal length
a<-c(3,5,7)
b<-c(6,12,3,5,6)

# adds a +v
a + b


# creates vector of university names
university_names<-c("University of Colorado, ", "Colorado State University, ")

# creates vector of locations
locations<-c("Boulder", "Fort Collins")

# uses paste0 function to paste the strings in "university_names" and 
# "locations" together in element-wise fashion and assign the resulting character 
# vector to "university_name_location"
university_name_location<-paste(university_names, locations)

# prints contents of "university_name_location"
# prints contents of "university_name_location"
university_name_location


# Data Frames -------------------------------------------------------------

# Creates a toy country-level data frame 
country_df<-data.frame(Country=c("Country A", "Country B", "Country C"),
                       GDP=c(8000, 30000, 23500),
                       Population=c(2000, 5400, 10000),
                       Continent=c("South America", "Europe", "North America"))

# prints "country_df" data frame to console
country_df

# extracts entire first row from "country_df"
country_df[1, ]

# extracts entire second row from "country_df"
country_df[2, ]

# extracts entire third column from "country_df"
country_df[, 3]

# extracts entire third column from "country_df" and assigns 
# it to an object named country_df_column
country_df_column<-country_df[,3]

# prints contents of "country_df_column"
country_df_column

# extracts entire third row from "country_df" and assigns it to an object named country_df_row
country_df_row<-country_df[3,]

# prints contents of "country_df_row"
country_df_row

# extracts second and third rows from "country_df"
country_df[2:3, ]

# extracts second through third rows, and first through third columns from "country_df"
country_df[2:3, 1:3]

# extracts the third row, and first and second columns, from "country_df"
country_df[3, 1:2]

# extracts first and third rows from "country_df", while excluding second row
country_df[c(1,3), ]

# extracts first, second, and fourth columns from "country_df"
country_df[, c(1, 2, 4)]

# extracts the first and third rows, and second and fourth columns, 
# from "country_df" and assigns it to a new object named "dataset_selection"
dataset_selection<-country_df[c(1,3), c(1,2,4)]

# prints contents of "dataset_selection"
dataset_selection

# extracts "Continent" column from "country_df"
country_df$Continent

# extracts "GDP" column from "country_df" and assigns it to a new object named "country_df_gdp"
country_df_gdp<-country_df$GDP

# prints contents of "country_df_gdp"
country_df_gdp


# Lists -------------------------------------------------------------------

# creates list whose elements are the "arbitrary_values" numeric vector, 
# the "months_four" character vector, and the "country_df" data frame, 
# and assigns it to a new object named "example_list"
example_list<-list(asia_temperatures_fahrenheit, university_name_location, country_df, dataset_selection)

# prints contents of "example_list"
example_list

# extracts third element from "example_list"
example_list[[3]]

# extracts first and third elements from "example_list"
example_list[c(1,3)]

# creates a character vector of desired names for list elements, and 
# assigns it to a new object named "name_vector"
name_vector_list<-c("element1", "element2", "element3", "element4")

# assigns names from "name_vector" to list elements in "example_list"
names(example_list)<-name_vector_list

# prints contents of "example_list"
example_list

# Extracts the data frame from "example_list" by its assigned name
example_list[["element3"]]

# Extracts the "element3" data frame from "example_list" by its index number
example_list[[3]]

# create a list with inline naming
example_list_alt<-list(asia_temperatures_fahrenheit_le=asia_temperatures_fahrenheit,
                       university_name_location_le=university_name_location,
                       country_df_le=country_df,
                       dataset_selection_le=dataset_selection)

# prints contents of "example_list_alt"
example_list_alt

# extracts "university_name_location" vector from "example_list_alt" using its assigned name 
example_list_alt[["university_name_location_le"]]

# Data Classes ------------------------------------------------------------

# prints class of "example_list"
class(example_list)

# prints class of "asia_temperatures_fahrenheit"
class(asia_temperatures_fahrenheit)

# prints class of "country_df"
class(country_df)

# prints class of "country_df_gdp"
class(country_df_gdp)

# prints class of "country_df_row"
class(country_df_row)

# converts "asia_temperatures_fahrenheit" to data frame class 
# and assigns the data frame to a new object named "asia_temperatures_df"
asia_temperature_df<-as.data.frame(asia_temperatures_fahrenheit)

# prints class of "asia_temperatures_df"
class(asia_temperature_df)
