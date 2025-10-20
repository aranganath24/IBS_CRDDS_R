# install packages
install.packages(c("tidyverse", "fastDummmies", "haven"))

# load libraries
library(tidyverse)
library(fastDummies)
library(haven)

# reads in the workshop dataset (Persson and Tabellini cross-national dataset) 
# by passing the file path as an argument to the "read_csv" and assigns it to a 
# new object named "qog"
qog<-read_csv("data/quality_of_government/qog_bas_cs_jan25.csv")

# prints contents of "qog" object to console
qog

# views "qog" in data viewer
View(qog)

# Reads in cross-national CSV dataset directly from QoG website and assigns it to a new object named "qog_direct"
qog_direct<-read_csv("https://www.qogdata.pol.gu.se/data/qog_bas_cs_jan25.csv")

# prints contents of qog_direct
qog_direct

# reads dataset into R from Dropbox and assigns it to a new object named "qog_cloud"
qog_cloud<-read_csv("https://www.dropbox.com/scl/fi/xxd5otw869auq56fs4c9k/qog_bas_cs_jan25.csv?rlkey=8thev7gb5u1ffbtmhs2tutxxp&e=1&st=folhfq67&dl=1")

# prints contents of "qog_cloud" to the console
qog_cloud

# reads in stata version of QoG crossnational dataset from local drive using haven's "read_dta" function and assigns the data to a new object named "qog_stata"
qog_stata <- read_dta("data/quality_of_government/qog_bas_cs_jan25.dta")

# prints contents of "qog_stata"
qog_stata

# prints the names of the files we want to read in and 
# assigns the vector of strings to a new object named "worldbank_filenames" 
worldbank_filenames<-list.files("data/world_bank")

# prints "worldbank_filenames"
worldbank_filenames

# iteratively passes file names in "worldbank_filenames" to 
# the "read_csv" function, and deposits imported world bank files 
# into a list that is assigned to an object named "world_bank_list"; 
# assumes the working directory is the one with the world bank files
setwd("data/world_bank")
world_bank_list <- map(worldbank_filenames, read_csv)

# prints contents of "world_bank_list"
world_bank_list

# removes CSV extension from "worldbank_filenames"
worldbank_filenames_base <- str_remove(worldbank_filenames, ".csv")

# assigns names to datasets in "world_bank_list"
names(world_bank_list) <- worldbank_filenames_base

# prints "world_bank_list"
world_bank_list

# extracts fdi dataset from "world_bank_list" by assigned label
world_bank_list[["wdi_fdi2019"]]


# Data Processing with a single dataset -----------------------------------

# makes a copy of "qog", called "qog_copy" that we can use for processing; 
# keeps the original data frame, "qog" untouched
qog_copy<-qog

# selects columns/variables from "qog_copy" and assigns the 
# modified data frame to a new object named "qog_copy_select"
qog_copy_select_initial <- select(qog_copy, cname_qog, cname, ccodealp, undp_hdi, wdi_expedu)

# Views "qog_copy_select_initial" in Viewer
View(qog_copy_select_initial)

# selects columns/variables from "qog_copy" using the 
# pipe syntax and assigns the modified data frame 
# to a new object named "qog_copy_select"
qog_copy_select_pipe <- 
  qog_copy %>% 
  select(cname_qog, cname, ccodealp, undp_hdi, wdi_expedu)

# subsets "qog_copy_select_initial" using the "filter()" function to 
# include only observations with undp_hdi>0.8, and deposits the modified 
# dataset into a new object named "qog_final_processed"
qog_final_processed <- filter(qog_copy_select_initial, undp_hdi>0.8)

# views qog_final_processed
View(qog_final_processed)

# uses pipe notation to select columns and filter according to a condition
qog_copy %>% 
  select(cname_qog, cname, ccodealp, undp_hdi, wdi_expedu) %>% 
  filter(undp_hdi>0.8)


# selects specific variables from "qog_copy" and assigns the selection to a new object named "qog_copy_selection"
qog_copy_selection <- qog_copy %>% 
  select(cname_qog, 
         cname, 
         ccodealp, 
         undp_hdi, 
         wdi_expedu,
         wdi_acel,
         wdi_area,
         wdi_taxrev,
         wdi_expmil,
         wdi_fdiin,
         wdi_trade,
         cbie_index,
         ht_region,
         wbgi_rle,
         bmr_dem,
         atop_ally,
         gol_est,
         mad_gdppc,
         mad_gdppc1900,
         bci_bci,
         lis_gini,
         top_top1_income_share,
         wdi_wip)


# Views "qog_copy_selection" in the data viewer
View(qog_copy_selection)

# removes "cname" column from "qog_copy_selection"
qog_copy_selection %>% select(-cname)

# deletes "cname", "undp_hdi", and "wdi_acel" from "qog_copy_selection"
qog_copy_selection %>% select(-c(cname, undp_hdi, wdi_acel))

# moves "ccdoealp" to front of "qog_copy_selection" dataset
qog_copy_selection %>% relocate(ccodealp)

# sets the order for the first four columns of "qog_copy_selection" 
# and assigns the result back to "qog_copy_selection"
qog_copy_selection <- qog_copy_selection %>% 
  relocate(ccodealp, wdi_acel, wdi_expmil, wdi_wip)

# renames "ccodealp" variable in "qog_copy_selection" to "iso3"
qog_copy_selection %>% 
  rename(iso3=ccodealp)

# renames "undp_hdi" variable to "hdi", and "wdi_area" to 
# "wdi_area_sqkm" in "qog_copy_selection" data frame
qog_copy_selection %>% 
  rename(hdi=undp_hdi,
         wdi_area_sqkm=wdi_area)

# sorts "qog_copy_selection" data frame in ascending (low to high) order 
# with respect to the "wdi_trade" variable, and then brings the "wdi_trade" variable
qog_copy_selection %>% 
  arrange(wdi_trade) %>% 
  relocate(cname_qog, cname, ccodealp, wdi_trade)

# sorts "qog_copy_selection" data frame in descending (high to low) order with 
# respect to the "wdi_trade" variable, and then brings the "wdi_trade" variable 
# to the front of the dataset
qog_copy_selection %>% 
  arrange(desc(wdi_trade)) %>% 
  relocate(cname_qog, cname, ccodealp, wdi_trade)


# arranges the "qog_copy_selection" data frame in ascending order
# with respect to "ht_region" and then in descending order with respect 
# to "wdi_trade", and then relocates these variables to the front of the 
# dataset; changes are assigned back to "qog_copy_selection" to store these changes
qog_copy_selection<-qog_copy_selection %>% 
  arrange(ht_region, desc(wdi_trade)) %>% 
  relocate(cname_qog, cname, ccodealp, ht_region, wdi_trade)

# Views "qog_copy_selection" in the data viewer
View(qog_copy_selection)

# Creates new variable named "mip" (percentage of men in parliement) 
# that is calculated by substracting the women's share of parliamentary seats 
# ("wdi_wip") from 100 and relocates these variables to the front of the dataset
qog_copy_selection %>% 
  mutate(mip=100-wdi_wip) %>% 
  relocate(cname_qog, cname, ccodealp, wdi_wip, mip)


# creates "land_area_sqmiles" variable based on "wdi_area" 
# and "no_electricity_access" variable based on "wdi_acel"
qog_copy_selection %>% 
  mutate(land_area_sqmiles=wdi_area/2.5899,
         no_electricity_access=100-wdi_acel) %>% 
  relocate(cname_qog, 
           cname, 
           ccodealp, 
           land_area_sqmiles, 
           wdi_area, 
           no_electricity_access, 
           wdi_acel)


# Creates a new dummy variable based on the existing "wdi_trade" 
# variable named "trade_open" (which takes on a value of "1" if "trade" is 
# greater than or equal to 60, and 0 otherwise) and then moves the newly 
# created variables to the front of the datasetall changes are 
# assigned to "qog_copy_selection", thereby overwriting the existing version 
# of "qog_copy_selection"

qog_copy_selection<-
  qog_copy_selection %>% 
  mutate(trade_open=ifelse(wdi_trade>=60, 1, 0)) %>% 
  relocate(cname_qog, cname, ccodealp, wdi_trade, trade_open)


# prints updated contents of "qog_copy_selection"
qog_copy_selection

# Creates a new variable in the "pt_copy" dataset named "trade_level" (that is coded as "Low_Trade" when the "wdi_trade" variable is greater than 15 and less than 50, coded as "Intermediate_Trade" when "wdi_trade" is greater than or equal to 50 and less than 100, and coded as "High_Trade" when "wdi_trade" is greater than or equal to 100), and then reorders the dataset to move "trade_level" and "wdi_trade" to the front of the dataset; the changes are assigned back to "qog_copy_selection"
qog_copy_selection<-
  qog_copy_selection %>% 
  mutate(trade_level=case_when(wdi_trade>15 & wdi_trade<50~"Low_Trade",
                               wdi_trade>=50 & wdi_trade<100~"Intermediate_Trade",
                               wdi_trade>=100~"High_Trade")) %>% 
  relocate(cname_qog, cname, ccodealp, wdi_trade, trade_level)


# prints updated contents of "qog_copy_selection"
qog_copy_selection

# Creates dummy variables from "trade_level" column, and relocates the new dummies to the front of the dataset; assigns changes back to "qog_copy_selection"
qog_copy_selection<-
  qog_copy_selection %>% 
  dummy_cols("trade_level") %>% 
  relocate(cname_qog, 
           cname,
           ccodealp,
           trade_level, 
           trade_level_High_Trade, 
           trade_level_Intermediate_Trade, 
           trade_level_Low_Trade, 
           trade_level_NA)


# uses the filter() function to extract South East Asia observations from
# "qog_copy_selection" and assigns the result to a new object named "se_asia_data"
se_asia_data<-qog_copy_selection %>% 
  filter(ht_region==7)


# prints "se_asia_data" to console
se_asia_data

# subsets data to include Sub-Saharan African countries with a "undp_hdi" value 
# greater than or equal to 0.65 and assigns the result to an object named "sub_saharan_africa_hdi"
sub_saharan_africa_hdi<-qog_copy_selection %>% 
                          filter(ht_region==4 & undp_hdi>=0.65)


# prints "sub_saharan_africa_hdi"
sub_saharan_africa_hdi


# Filters observations from "sub_saharan_africa_hdi" for which the 
# "trade_level" variable is set to "Intermediate_Trade"
sub_saharan_africa_hdi %>% 
  filter(trade_level=="Intermediate_Trade")

# filters observations from "sub_saharan_africa_hdi" for which 
# the "trade_level" variable is NOT set to "High_Trade"
sub_saharan_africa_hdi %>% 
  filter(trade_level != "High_Trade")

# uses the "filter()" function to extract observations from 
# South-East Asia (ht_region=7) and East Asia (ht_region=6) and 
# assigns the result to a new object named "east_asia"
east_asia<-qog_copy_selection %>% 
  filter(ht_region==6|ht_region==7) %>% 
  relocate(cname_qog, cname, ccodealp, ht_region)


# prints contents of "east_asia"
east_asia


# Processing Multiple Datasets --------------------------------------------

# extracts fdi dataset from "world_bank_list" by assigned name 
# and assigns it to a new object named "wdi_fdi"
wdi_fdi<-world_bank_list[["wdi_fdi2019"]]

# extracts debt dataset from "world_bank_list" by 
# assigned name and assigns it to a new object named "wdi_trade"
wdi_trade<-world_bank_list[["wdi_trade2019"]]

# drop na's and rename variable in in trade dataset and assign to "wdi_trade_cleaned"
wdi_trade_cleaned<-wdi_trade %>%
  drop_na() %>% 
  rename(trade_2019=`2019 [YR2019]`)

# drop na's and rename variable in in FDI dataset and assign to "wdi_fdi_cleaned"
wdi_fdi_cleaned<-wdi_fdi %>% 
  drop_na() %>% 
  rename(fdi_2019=`2019 [YR2019]`)

# join together "wdi_fdi_cleaned" and "wdi_fdi_cleaned" using country code
fdi_trade_join<-full_join(wdi_fdi_cleaned, wdi_trade_cleaned, by="Country Code")

# Views "fdi_trade_join" in viewr
View(fdi_trade_join)

# Appends "worldbank_trade_2019" to "worldbank_fdi_2019" and assigns 
# new dataset to object named "worldbank_trade_fdi"
worldbank_trade_fdi_appended<-bind_rows(wdi_trade, wdi_fdi)


# cleans the dataset before reshaping
worldbank_trade_fdi_cleaned<-worldbank_trade_fdi_appended %>% 
  rename(economic_variables="2019 [YR2019]",
         series_code="Series Code") %>% 
  select(-"Series Name") %>% 
  drop_na()

# prints class of "economic_variables" column
class(worldbank_trade_fdi_cleaned$economic_variables)

# converts "economic_variables" to numeric
worldbank_trade_fdi_cleaned$economic_variables<-as.numeric(worldbank_trade_fdi_cleaned$economic_variables)

# reshapes "worldbank_trade_fdi_cleaned" from long to wide and 
# assigns the wide dataset to an object named "worldbank_trade_fdi_wide"
worldbank_trade_fdi_wide<-worldbank_trade_fdi_cleaned %>% 
  tidyr:: pivot_wider(names_from=series_code,
                      values_from=economic_variables)

# prints contents of "worldbank_trade_fdi_wide"
worldbank_trade_fdi_wide

# renames columns in "worldbank_trade_fdi_wide"
worldbank_trade_fdi_wide<-worldbank_trade_fdi_wide %>% 
  rename(trade2019=NE.TRD.GNFS.ZS,
         FDI2019=BX.KLT.DINV.WD.GD.ZS)

# reshapes "worldbank_trade_fdi_wide" back to long format and 
# assigns the reshaped dataset to a new object named "world_bank_trade_long"
world_bank_trade_long<-worldbank_trade_fdi_wide %>% 
  pivot_longer(cols=c(FDI2019, trade2019),
               names_to="economic_variable",
               values_to = "2019")


# write function to clean World Bank dataset
worldbank_cleaning_function<-function(input_dataset){
  modified_dataset<-input_dataset %>% 
    select(-"Series Code") %>% 
    rename("Country"="Country Name",
           "CountryCode"="Country Code",
           "Series"="Series Name",
           "2019"="2019 [YR2019]") %>% 
    drop_na(CountryCode)
  return(modified_dataset)
}

# passes "wdi_trade" to "worldbank_cleaning_function"
worldbank_cleaning_function(wdi_trade)

# Iteratively apply "worldbank_cleaning_function" to all of the 
# datasets in "world_bank_list", and deposit the cleaned datasets into 
# a new list named "world_bank_list_cleaned"
world_bank_list_cleaned<-map(.x=world_bank_list, .f=worldbank_cleaning_function)

# prints contents of "world_bank_list_cleaned"
world_bank_list_cleaned

# exports "east_asia" to a local directory (i.e. the "outputs" sub-directory of our 
# working directory)
write_csv(east_asia, "outputs/east_asia.csv")

# create file names for exported World Bank files
WB_filenames_export<-paste0("outputs/", worldbank_filenames_base, "_cleaned.csv")

# prints "WB_filenames_export" contents
WB_filenames_export

# exports datasets in "world_bank_list_cleaned" to "outputs" directory using 
# filenames in "WB_filenames_export"
walk2(.x=world_bank_list_cleaned, .y=WB_filenames_export, write_csv)

