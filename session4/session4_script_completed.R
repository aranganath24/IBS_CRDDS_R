
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
library(ggeffects)
library(effects)
library(interplot)
library(broom)

# read in qog data
qog<-read_csv("data/quality_of_government/qog_bas_cs_jan25.csv")

# make a copy of the "qog" data 
qog_copy<-qog

# select qog variables
qog_copy_selection <- 
  qog_copy %>% 
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

# Create new character variable named "region" based on "ht_region" variable that
# contains region information encoded as strings
qog_copy_selection<-
  qog_copy_selection %>% 
    mutate(region=case_when(ht_region==1~"EasternEuropePostSoviet",
                          ht_region==2~"LatinAmerica",
                          ht_region==3~"NorthAfricaMiddleEast",
                          ht_region==4~"SubSaharanAfrica",
                          ht_region==5~"WesternEuropeNorthAmerica",
                          ht_region==6~"EastAsia",
                          ht_region==7~"SouthEastAsia",
                          ht_region==8~"SouthAsia",
                          ht_region==9~"Pacific",
                          ht_region==10~"Caribbean"))

# Missing Data ------------------------------------------------------------

# makes toy dataset, assigned to object named "student_scores"
student_scores<-data.frame(Age=c(25, NA, 30, 22, NA),
                           Score=c(85, 90, NA, 78, 88))

# uses "is.na" to return a logical matrix indicating missing values (TRUE for missing values)
is.na(student_scores)

# calculates total number of missing values in "student_scores"; matrix is coerced to a logical
# vector before the "TRUE" values (set to 1) are summed up
sum(is.na(student_scores))

# calculates total number of missing values per column
colSums(is.na(student_scores))

# calculates missing data percentage in "student_scores"
# first calculates count of missing values and assigns it to "total_missing"
total_missing<-sum(is.na(student_scores))
# calculates total number of cells and assigns it to "total_values"
total_values<-prod(dim(student_scores))
# calculates percentage of missing data and assigns it to "missing_pct"
missing_pct<-(total_missing/total_values)*100

# prints contents of "missing_pct"
missing_pct

# creates function to calculate the percentage of missing data in a dataset
missing_data_percentage<-function(dataset){
  # generates count of missing values
  total_missing<-sum(is.na(dataset))
  # calculates total number of cells
  total_values<-prod(dim(dataset))
  # calculates percentage of missing data
  missing_pct<-(total_missing/total_values)*100
  return(missing_pct)
}

# passes "student_scores" as an argument to custom function "missing_data_percentage" 
# which yields the percentage of missing data in the "student_scores" dataset
missing_data_percentage(student_scores)

# calculates missing data percentage in "qog_copy"
missing_data_percentage(qog_copy)

# calculates missing data percentage in "qog_copy_selection"
missing_data_percentage(qog_copy_selection)

# calculates percentage of missing data per column in "student_scores" and 
# assigns the resulting vector to an object named "missing_pct_per_col"
missing_pct_per_col<-colSums(is.na(student_scores))/nrow(student_scores)*100

# prints contents of "missing_pct_per_col"
missing_pct_per_col

# removes all rows with NA values from "student_scores"
drop_na(student_scores)

# removes all rows where "Age" has NA values in "student_scores"
drop_na(student_scores, Age)

# removes all rows where "Score" has NA values in "student_scores"
drop_na(student_scores, Score)

# replace NA values in the "Score" column with 0
replace_na(student_scores, list(Score=0))

# changes NA values in Age column to 22 where ID is equal to 5, and makes no changes otherwise; assigns modified data frame to "student_scores_modified"
student_scores_modified<-student_scores %>% 
                            mutate(Age = if_else(is.na(Age) & row_number()==5, 22, Age))

# prints "student_scores_modified"
student_scores_modified

# prints "student_scores_modified"
student_scores_modified

# calculates mean of "Score" (NA values are not excluded; default behavior)
mean(student_scores$Score)

# calculates mean of "Score" (NA values are excluded due to na.rm=TRUE specification; 
# as a result, the function computes an average based on non-NA values)
mean(student_scores$Score, na.rm=TRUE)

# Descriptive Statistics --------------------------------------------------

# Generate summary statistics for "qog_copy_selection" and assign table of 
# summary statistics to a new object named "qog_copy_selection_summarystats1"
qog_copy_selection_summarystats1<-describe(qog_copy_selection)

# prints "qog_copy_selection_summarystats1"
qog_copy_selection_summarystats1

# Views "qog_copy_selection_summarystats1" in Viewer
View(qog_copy_selection_summarystats1)

# removes non-numeric variables
qog_copy_selection_numeric<-qog_copy_selection %>% 
                            select(-ht_region) %>% 
                            select_if(is.numeric)

# Generates summary statistics for numeric variables 
# (i.e. those in qog_copy_selection_numeric) using "describe()
qog_copy_selection_numeric_summarystats2<-describe(qog_copy_selection_numeric)

# prints "qog_copy_selection_numeric_summarystats2"
qog_copy_selection_numeric_summarystats2

# views "qog_copy_selection_numeric_summarystats2"
View(qog_copy_selection_numeric_summarystats2)

# looks up documentation for "describe"
?describe

# prints "student_scores"
student_scores

# generates summary statistics with "describe()" function 
# and assigns it to "df_sample_summary_default"; 
# na.rm=TRUE ignores NA values when calculating summary statistics
student_scores_summarystats<-describe(student_scores, na.rm=TRUE)

# prints "student_scores_summarystats"
student_scores_summarystats

# generates summary statistics with describe function and assigns
# it to "df_sample_summary_B"; na.rm=FALSE removes rows with any NA values 
# before calculating summary statistics (in other words, summary statistics 
# are computed on rows with complete data)
student_scores_summarystats_B<-describe(student_scores, na.rm=FALSE)

# prints "student_scores_summarystats_B"
student_scores_summarystats_B

# Write Custom Function to Include NA Information in Summary Table --------

# uses "descr" function from summarytools package to 
# create a table of summary statistics as a data frame 
# and assigns it to "qog_copy_selection_numeric_ST"
qog_copy_selection_numeric_ST<-as.data.frame(descr(qog_copy_selection_numeric))

# uses stargazer package to generate summary statistics for "qog_copy_selection_numeric"
stargazer(as.data.frame(qog_copy_selection_numeric), type = "text")

# Define a named function to count missing values
count_missing <- function(x) {
  sum(is.na(x))
}

# applies "count_missing" function to the columns of "student_scores", 
# and deposits the results (i.e. count of missing values in each 
# column of "student_scores") to a numeric vector assigned to the object 
# "missing_values_vector"
missing_values_vector <- map_dbl(student_scores, count_missing)

# adds "missing_values_vector" as a column named "missing_values" to 
# "student_scores_summarystats" summary stats table
student_scores_summarystats<-student_scores_summarystats %>% 
                                mutate(missing_values=missing_values_vector)

# prints "student_scores_summarystats"
student_scores_summarystats

# makes function to automate the creation of a "missing_value" column in summary statistics
# generated. by describe()
summary_stats_na<-function(dataset_input){
  
# create summary stats table and assign to "summary_stats"
summary_stats<-describe(dataset_input)
  
# create a missing values vector and adds it as a column to "summary_stats"; the result
# is assigned to "summary_stats_missing_values"
summary_stats_missing_values<-
  summary_stats %>% 
      mutate(missing_values=map_dbl(.x=dataset_input, .f=count_missing))
  
  return(summary_stats_missing_values)
}

# creates a summary statistics table for the data in 
# "qog_copy_selection_numeric" that includes a "missing_values" 
# column that indicates the number of NA values for each variable 
# by passing "qog_copy_selection_numeric" as an argument to the
# "summary_stats_na" function; the resulting summary statistics 
# table is assigned to "qog_copy_selection_numeric_summaryNA" 
qog_copy_selection_numeric_summaryNA<-summary_stats_na(qog_copy_selection_numeric)

# prints "qog_copy_selection_numeric_summaryNA"
qog_copy_selection_numeric_summaryNA

# creates frequency table for the region variable
qog_copy_selection %>% 
  count(region)

# adds percentage column and assigns modified frequency
# table to new object called "region_frequency"
region_frequency<-qog_copy_selection %>% 
                    count(region) %>% 
                      mutate(percent=n/sum(n)*100)

# Views "region_frequency" in Viewer
View(region_frequency)
                            
# creates long crosstab of region and democracy status (bmr_dem)
# variables from "qog_copy_selection" data frame
qog_copy_selection %>% 
  count(region, bmr_dem)

# creates wide crosstab of region and democracy status (bmr_dem)
# variables from "qog_copy_selection" data frame
qog_copy_selection %>% 
  count(region, bmr_dem) %>% 
  pivot_wider(names_from=bmr_dem,
              values_from=n,
              values_fill=0)

# creates wide cross-tab of region and democracy status, with
# row and column totals and modified column names and assigns the 
# result to "region_demo_crosstab"
region_demo_crosstab<-
  qog_copy_selection %>% 
  count(region, bmr_dem) %>% 
  pivot_wider(names_from=bmr_dem,
              values_from=n,
              values_fill=0) %>% 
  adorn_totals(where=c("row", "col")) %>% 
  rename(Region=region,
         Democracy = `1`,
         `Non-Democracy` = `0`,
         Missing = `NA`)

# views "region_demo_crosstab" in crosstab
View(region_demo_crosstab)

# creates wide cross-tab of democracy status and region (with regional # categories spread across columns), with row and column totals and modified column names and assigns the result to "demo_region_crosstab"
demo_region_crosstab<-
  qog_copy_selection %>% 
  count(bmr_dem, region) %>% 
  pivot_wider(names_from=region,
              values_from=n,
              values_fill=0) %>% 
  adorn_totals(where=c("row", "col")) %>% 
  rename(Democracy=bmr_dem)

# makes frequency table of region variable using tabyl()
tabyl(qog_copy_selection, region)

# makes crosstab of region and democracy status using tabyl(); adds 
# row and column totals using "adorn_totals" function
tabyl(qog_copy_selection, region, bmr_dem) %>% 
  adorn_totals(where=c("row", "col"))


# Creates summary statistics for each regional grouping, 
# and puts results in list object named "summary_stats_by_region"
summary_stats_by_region<-describeBy(qog_copy_selection, qog_copy_selection$region)

# Accessing continent-level summary statistics for 
# The Pacific from the "summary_stats_by_region" list
summary_stats_by_region[["Pacific"]]

# Extracts group level summary statistics table for 
# "WesternEuropeNorthAmerica" from "summary_stats_by_region" 
# list and assigns it to a new object named "we_na_summary"
we_na_summary<-summary_stats_by_region[["WesternEuropeNorthAmerica"]]

# views "we_na_summary" in data viewer
View(we_na_summary)

# Generate a table that displays summary statistics for "wdi_trade" and "wdi_fdiin" at the 
# continent level and assign to object named "trade_fdi_by_region"
trade_fdi_by_region<-qog_copy_selection %>% 
  group_by(region) %>% 
  summarise(meanTrade=mean(wdi_trade, na.rm=TRUE),
            sdTrade=sd(wdi_trade, na.rm=TRUE),
            meanFDI=mean(wdi_fdiin, na.rm=TRUE), 
            sdFDI=sd(wdi_fdiin, na.rm=TRUE),
            n=n())

# views "trade_fdi_by_region" in data viewer
View(trade_fdi_by_region)

# round to two decimal places
trade_fdi_by_region<-qog_copy_selection %>% 
  group_by(region) %>% 
  summarise(meanTrade=round(mean(wdi_trade, na.rm=TRUE), 2),
            sdTrade=round(sd(wdi_trade, na.rm=TRUE), 2),
            meanFDI=round(mean(wdi_fdiin, na.rm=TRUE), 2), 
            sdFDI=round(sd(wdi_fdiin, na.rm=TRUE), 2),
            n=n())

# Exploratory Visualization -----------------------------------------------

# filters South Asia observations
qog_south_asia<-qog_copy_selection %>% 
                  filter(region=="SouthAsia") %>% 
                  drop_na(wdi_trade)

# Creates a bar chart of the "wdi_trade" variable (central government expenditure as a share of GDP) 
# for the South Asia observations and assigns the plot to an object named "trade_southasia"
trade_southasia<-
  ggplot(qog_south_asia)+
  geom_col(aes(x=cname, y=wdi_trade))+
  labs(
    title="Trade as a Percentage of GDP in South Asia\n(2017-2020)",
    caption = "Source: Quality of Government Institute", 
    x="Country", 
    y="Trade as a Percentage of GDP")+
  theme(plot.title=element_text(hjust=0.5),
        axis.text.x = element_text(angle = 90))


# prints "trade_southasia"
trade_southasia

# Creates a bar chart of the "wdi_trade" variable
# for the South Asia observations; countries are on the 
# x axis and arrayed in ascending order with respect to the 
# trade variable, which is on the y-axis; assigns the plot to an 
# object named "trade_southasia_ascending"
trade_southasia_ascending<-
  ggplot(qog_south_asia)+
  geom_col(aes(x=reorder(cname, wdi_trade), y=wdi_trade))+
  labs(
    title="Trade as a Percentage of GDP in South Asia\n(2017-2020)",
    caption = "Source: Quality of Government Institute", 
    x="Country", 
    y="Trade as a Percentage of GDP")+
  theme(plot.title=element_text(hjust=0.5),
        axis.text.x = element_text(angle = 90))

# prints
trade_southasia_ascending

# Creates a bar chart of the "wdi_trade" variable 
# for the South Asia observations; countries are on the x axis and arrayed in descending order with respect to the 
# trade variable, which is on the y-axis; assigns the plot to an object named "trade_southasia_descending"
trade_southasia_descending<-
  ggplot(qog_south_asia)+
  geom_col(aes(x=reorder(cname, -wdi_trade), y=wdi_trade))+
  labs(
    title="Trade as a Percentage of GDP in South Asia\n(2017-2020)",
    caption = "Source: Quality of Government Institute", 
    x="Country", 
    y="Trade as a Percentage of GDP")+
  theme(plot.title=element_text(hjust=0.5),
        axis.text.x = element_text(angle = 90))


# prints "trade_southasia_descending"
trade_southasia_descending

# creates inverted bar chart of "wdi_trade" for South Asian Countries
# and assigns to "wdi_trade_inverted"
wdi_trade_inverted<-trade_southasia_ascending+
                      coord_flip()

# prints "wdi_trade_inverted"
wdi_trade_inverted

# fixes x axis labels
wdi_trade_inverted<-wdi_trade_inverted+
                      theme(axis.text.x=element_text(angle=0))

# prints updated "wdi_trade_inverted"
wdi_trade_inverted

# Creates scatterplot with "wdi_taxrev" variable on x-axis and "wdi_trade" 
# variable on y-axis and assigns to object named "tax_trade_scatter"
tax_trade_scatter<-
  ggplot(qog_copy_selection)+
    geom_point(aes(x=wdi_taxrev, y=wdi_trade))+
    labs(title="Relationship Between Trade and Tax Revenue as % of GDP\n(2017-2021)",
       x="Tax Revenue as a % of GDP", 
       y="Trade as a % of GDP",
       caption = "Source: Quality of Government Institute")+
    theme(plot.title=element_text(size=11, hjust=0.5),
        axis.title.x=element_text(size=10),
        axis.title.y=element_text(size=10))

# prints "tax_trade_scatter"
tax_trade_scatter


# uses color to distinguish between observations from different regions in the 
# scatterplot 
tax_trade_scatter_color<-
  ggplot(qog_copy_selection)+
  geom_point(aes(x=wdi_taxrev, y=wdi_trade, color=region))+
  labs(title="Relationship Between Trade and Tax Revenue as % of GDP\n(2017-2021)",
       x="Tax Revenue as a % of GDP", 
       y="Trade as a % of GDP",
       caption = "Source: Quality of Government Institute")+
  theme(plot.title=element_text(size=11, hjust=0.5),
        axis.title.x=element_text(size=10),
        axis.title.y=element_text(size=10))

# prints "tax_trade_scatter_color"
tax_trade_scatter_color

# uses facets to make panel of different scatter plot ofs "wdi_trade" and "wdi_taxrev" 
# for each region
tax_trade_scatter_facets<-
 tax_trade_scatter+
  facet_wrap(~region, nrow=2)


# prints "tax_trade_scatter_facets"
tax_trade_scatter_facets

# layers line of best fit over scatterplot; wdi_trade on y axis axis and wdi_taxrev
# on x axis; assigns new plot to object named "tax_trade_scatter_line"
tax_trade_scatter_line<-
  ggplot(qog_copy_selection)+
  geom_point(aes(x=wdi_taxrev, y=wdi_trade))+
  geom_smooth(aes(x=wdi_taxrev, y=wdi_trade), method="lm")+
  labs(title="Relationship Between Trade and Tax Revenue as % of GDP\n(2017-2021)",
       x="Tax Revenue as a % of GDP", 
       y="Trade as a % of GDP",
       caption = "Source: Quality of Government Institute")+
  theme(plot.title=element_text(size=11, hjust=0.5),
        axis.title.x=element_text(size=10),
        axis.title.y=element_text(size=10))

# prints "tax_trade_scatter_line"
tax_trade_scatter_line

# creates new single-row data frame with mean value of "wdi_trade"
# variable from "south_asia_trade_average" data frame, and sets the
# name of the column containing this value to "meanSA_trade"
south_asia_trade_average<-
  as.data.frame(mean(qog_south_asia$wdi_trade)) %>% 
  rename(meanSA_trade=`mean(qog_south_asia$wdi_trade)`)

# prints "south_asia_trade_average"
south_asia_trade_average

# makes bar chart of "wdi_trade" variable from "qog_south_asia" data
# frame arrayed in descending order, along with a dark red horizontal 
# line indicating the average "wdi_trade" value in the dataset, taken 
# from "south_asia_trade_average" 
ggplot(data=qog_south_asia)+
  geom_col(aes(x=reorder(cname, -wdi_trade), y=wdi_trade))+
  geom_hline(data=south_asia_trade_average,
             aes(yintercept=meanSA_trade),
             linetype="dashed",
             color="darkred")+
  labs(title="Trade as a Percentage of GDP in South Asia\n(2017-2020)",
       caption = "Source: Quality of Government Institute", 
       x="Country", 
       y="Trade as a Percentage of GDP")+
  theme(plot.title=element_text(hjust=0.5),
        axis.text.x = element_text(angle = 90))

# Basic Statistics and Linear Regresion ---------------------------------------------------------------

# computes correlation coefficient between "wdi_taxrev" and "wdi_trade" variables and assigns 
# the result to a new object named "trade_cgexp_cc"
tax_trade_cc<-cor.test(qog_copy_selection$wdi_trade, qog_copy_selection$wdi_taxrev)

# prints results of "tax_trade_cc"
tax_trade_cc

# cleans up formatting of "tax_trade_cc"
broom::tidy(tax_trade_cc)

# assigns well-formatted model output to "trade_cgexp_cc_clean"
tax_trade_clean_corr<-broom::tidy(tax_trade_cc)

# prints contents of "tax_trade_clean_corr"
tax_trade_clean_corr

# removes dummy variables from "qog_copy_selection_numeric" before making correlation
# matrix
qog_copy_selection_numeric_continuous<-
  qog_copy_selection_numeric %>% 
    select(-c(atop_ally, bmr_dem, gol_est))


# creates correlation matrix for observations in 
# "qog_copy_selection_numeric_continuous" and assigns result 
# to object named "qog_copy_selection_numeric_cor_matrix"
qog_copy_selection_numeric_cor_matrix<-round(cor(qog_copy_selection_numeric_continuous, use="complete.obs"), 2)

# prints contents of "qog_copy_selection_numeric_cor_matrix"
qog_copy_selection_numeric_cor_matrix

# Views "qog_copy_selection_numeric_cor_matrix" in viewer
View(qog_copy_selection_numeric_cor_matrix)

# implements bivariate regression with "wdi_trade" as DV and "wdi_taxrev" as IV; 
# regresion output assigned to "regression1" object
regression1<-lm(wdi_trade~wdi_taxrev, data=qog_copy_selection)

# prints output of "regresion1"
summary(regression1)

# Implements multiple regression with "wdi_trade" as DV, 
# and assigns output to object named "regression2"
regression2<-lm(wdi_trade~+wdi_taxrev+wdi_area+wdi_expmil+bmr_dem+top_top1_income_share+undp_hdi, data=qog_copy_selection)

# prints regression2 output
summary(regression2)

# Implements multiple regression with "wdi_trade" as DV, 
# and assigns output to object named "regression2"; "wdi_area" is log transformed
regression2<-lm(wdi_trade~wdi_taxrev+log(wdi_area)+wdi_expmil+bmr_dem+top_top1_income_share+undp_hdi, data=qog_copy_selection)

# prints updated output of regression2
regression2

# prints regression output using "tidy" function
broom::tidy(regression2)

# prints class of "region" variable
class(qog_copy_selection$region)

# adds "region" categorical variable (of class "character") in regression model
# and assigns it to a new object named "regression3"
regression3<-lm(wdi_trade~log(wdi_area)+wdi_taxrev+wdi_expmil+bmr_dem+top_top1_income_share+undp_hdi+region, data=qog_copy_selection)

# prints contents of "regression3" object
summary(regression3)

# Set "region" variable as factor
qog_copy_selection$region<-as.factor(qog_copy_selection$region)

# confirm conversion
class(qog_copy_selection$region)

# check levels of "region" factor variable
levels(qog_copy_selection$region)

# Relevels "region" factor variable to set "LatinAmerica" as reference category
qog_copy_selection$region<-relevel(qog_copy_selection$region, ref="LatinAmerica")

# check levels of "region" factor variable
levels(qog_copy_selection$region)

# runs regression with releveled factor variable with "LatinAmerica" as 
# reference and assigns output to "regression4"
regression4<-lm(wdi_trade~+wdi_taxrev+log(wdi_area)+wdi_expmil+bmr_dem+top_top1_income_share+undp_hdi+region, data=qog_copy_selection)

# prints model output for "regression4"
broom::tidy(regression4)

# Use "region" field to make region dummy variables in "qog_copy_selection"
qog_copy_selection<-qog_copy_selection %>% dummy_cols("region")

# includes dummy variables in regression with "LatinAmerica" as the excluded category; 
# model output assigned to object named "regression5"
regression5<-lm(wdi_trade~wdi_taxrev+log(wdi_area)++wdi_expmil+bmr_dem+top_top1_income_share+undp_hdi+region_Caribbean+
                  region_EastAsia+region_EasternEuropePostSoviet+region_NorthAfricaMiddleEast+region_Pacific+region_SouthAsia+
                  region_SouthEastAsia+region_SubSaharanAfrica+region_WesternEuropeNorthAmerica, data=qog_copy_selection)

# prints model output for "regression5"
broom::tidy(regression5)

# run regression with interaction term between "wdi_taxrev" and "bmr_dem"
taxrev_democracy_interaction<-lm(wdi_trade~wdi_taxrev*bmr_dem, data=qog_copy_selection)

# prints "taxrev_democracy_interaction" regression table
summary(taxrev_democracy_interaction)

# Finds mean value of "wdi_taxrev" variable and assigns to
# object named "mean_taxrev" 
mean_taxrev<-mean(qog_copy_selection$wdi_taxrev, na.rm=TRUE)

# Calculates predicted values of "wdi_trade" for different values of 
# "bmr_dem", with "wdi_taxrev" held at mean
predicted_values_democracy<-ggpredict(model=taxrev_democracy_interaction, term="bmr_dem", condition=c(wdi_taxrev=mean_taxrev))

# Prints "predicted_values_democracy" table
predicted_values_democracy

# prints underlying structure of "predicted_values_democracy"
print(as.data.frame(predicted_values_democracy))

# creates plot of "predicted_values_democracy"; shows predicted values of "wdi_trade"
# for different values of democracy ("bmr_dem") when "wdi_taxrev" is held at mean
predicted_values_democracy_plotted<-
  ggplot(predicted_values_democracy)+
  geom_point(aes(x=x, y=predicted))+
  geom_errorbar(aes(x, ymin=conf.low, ymax=conf.high), width=0.05)+
  scale_x_continuous(breaks=seq(0,1, by=1))+
  labs(title="Predicted Effects of Democracy on Trade\n(with tax revenue as a share of GDP set to mean)",
       y="Predicted Trade Share of GDP",
       x="Democracy")

# prints "predicted_values_democracy_plotted"
predicted_values_democracy_plotted

# calculates predicted values for trade share of GDP for
# both values of the democracy indicator (bmr_dem=0 and 1), 
# across the observed range of "wdi_taxrev" and assigns the result
# to "predicted_values_taxrev" object
predicted_values_taxrev <- ggpredict(model=taxrev_democracy_interaction,terms = c("wdi_taxrev", "bmr_dem"))

# prints contents of "predicted_values_taxrev"
predicted_values_taxrev

# prints contents of "predicted_values_taxrev" as data frame
as.data.frame(predicted_values_taxrev)

# creates plot of "predicted_values_taxrev"; shows predicted values
# of "wdi_trade" for both values of the democracy indicator across the 
# observed range of "wdi_taxrev" and assigns the result to "predicted_values_taxrev_plotted"
predicted_values_taxrev_plotted <-
  ggplot(predicted_values_taxrev)+
  geom_line(aes(x = x, y = predicted, color = group), linewidth = 1) +
  geom_ribbon(aes(x=x, ymin = conf.low, ymax = conf.high, fill = group), alpha = 0.2, color = NA) +
  labs(title = "Predicted Effect of Tax Revenue on Trade Share of GDP\nby Democracy Status",
       x = "Tax Revenue (% of GDP)",
       y = "Predicted Trade Share of GDP",
      color = "Democracy",
      fill = "Democracy")+
  theme_minimal() +
  theme(plot.title = element_text(hjust = 0.5))

# prints "predicted_values_taxrev_plotted"
predicted_values_taxrev_plotted

# defines colors and labels
pv_colors<-c("0" = "#1f77b4", "1" = "#d62728")
pv_labels<-c("0" = "Non-democracy", "1" = "Democracy")

# refines appearance of "predicted_values_taxrev_plotted" by modifying # legend and colors
predicted_values_taxrev_plotted_refined<-
  predicted_values_taxrev_plotted+
  scale_color_manual(values=pv_colors, labels=pv_labels, name="Regime Type")+
  scale_fill_manual(values=pv_colors, labels=pv_labels, name="Regime Type" )

# prints "predicted_values_taxrev_plotted_refined"
predicted_values_taxrev_plotted_refined

# Marginal effect of democracy (bmr_dem) on trade share of GDP across 
# different levels of the moderating variable (tax revenue as a share
# of GDP)marginal_effect_democracy_plot <- 
marginal_effect_democracy_plot<-
  interplot(
  m = taxrev_democracy_interaction, # model object
  var1 = "bmr_dem",      # independent variable of interest
  var2 = "wdi_taxrev") +    # moderator
  labs(x = "Tax Revenue (% of GDP)",
       y = "Marginal Effect of Democracy on Trade",
       title = "Marginal Effect of Democracy on Trade Across Tax Revenue")+
  theme_minimal()

# prints "marginal_effect_democracy_plot"
marginal_effect_democracy_plot

# Marginal effect of "wdi_taxrev" for democracies and non-democracies
interplot(
  m = taxrev_democracy_interaction,
  var1 = "wdi_taxrev",   # variable whose marginal effect we want
  var2 = "bmr_dem") +       # moderator (0 = non-democracy, 1 = democracy)) +
  labs(x = "Democracy (0 = Non-democracy, 1 = Democracy)",
       y = "Marginal Effect of Tax Revenue on Trade",
       title = "Marginal Effect of Tax Revenue on Trade by Regime Type") +
  theme_minimal()

# run regression with "wdi_trade" as DV, and interaction term between 
# "wdi_taxrev" and "undp_hdi" (two continuous variables) as IVs
taxrev_hdi_interaction<-lm(wdi_trade~wdi_taxrev*undp_hdi, data=qog_copy_selection)

# prints regression results
summary(taxrev_hdi_interaction)

# calculates predicted values across tax revenue, for representative
# HDI Values
predicted_taxrev_hdi <- ggpredict(taxrev_hdi_interaction, terms = c("wdi_taxrev", "undp_hdi"))

# inspects "predicted_values_taxrev"
as.data.frame(predicted_values_taxrev)

# creates predicted values plot
predicted_taxrev_hdi_plot<-
  ggplot(predicted_taxrev_hdi)+
  geom_line(aes(x=x, y=predicted, color=group), linewidth=1)+
  geom_ribbon(aes(x=x, ymin=conf.low, ymax=conf.high, fill=group), alpha=0.2, color=NA)+
  labs(
    title = "Predicted Trade Share of GDP Across Tax Revenue by HDI",
    x = "Tax Revenue (% of GDP)",
    y = "Predicted Trade Share of GDP",
    color = "HDI Level",
    fill = "HDI Level"
  ) +
  theme_minimal() +
  theme(plot.title = element_text(hjust = 0.5))

# calculates predicted values across HDI for representative tax revenue values
predicted_hdi_taxrev <- ggpredict(
  taxrev_hdi_interaction,
  terms = c("undp_hdi", "wdi_taxrev"))

# inspects "predicted_hdi_taxrev"
predicted_hdi_taxrev

# creates predicted values plot
predicted_hdi_taxrev_plot <-
  ggplot(predicted_hdi_taxrev) +
  geom_line(aes(x = x, y = predicted, color = group), linewidth = 1) +
  geom_ribbon(aes(x = x, ymin = conf.low, ymax = conf.high, fill = group), alpha = 0.2, color = NA) +
  labs(title = "Predicted Trade Share of GDP Across HDI by Tax Revenue",
       x = "HDI",
       y = "Predicted Trade Share of GDP",
       color = "Tax Revenue (% of GDP)",
       fill = "Tax Revenue (% of GDP)")+
  theme_minimal() +
  theme(plot.title = element_text(hjust = 0.5))


# prints "predicted_hdi_taxrev_plot"
predicted_hdi_taxrev_plot

# plots predicted values from "predicted_hdi_taxrev_plot" using facets
predicted_hdi_taxrev_plot_facets <-
  ggplot(predicted_hdi_taxrev) +
  geom_line(aes(x = x, y = predicted, color = group), linewidth = 1) +
  geom_ribbon(aes(x = x, ymin = conf.low, ymax = conf.high, fill = group), alpha = 0.2, color = NA) +
  facet_wrap(~group, nrow=1, labeller=label_both)+
  labs(title = "Predicted Trade Share of GDP Across HDI by Tax Revenue",
       x = "HDI",
       y = "Predicted Trade Share of GDP",
       color = "Tax Revenue (% of GDP)",
       fill = "Tax Revenue (% of GDP)")+
  theme_minimal() +
  theme(plot.title = element_text(hjust = 0.5))

# specify custom values for tax groupings
predicted_hdi_taxrev_custom <- ggpredict(
  taxrev_hdi_interaction,
  terms = c("undp_hdi", "wdi_taxrev [10, 20, 30]"))

# creates predicted values plot
predicted_hdi_taxrev_plot <-
  ggplot(predicted_hdi_taxrev_custom) +
  geom_line(aes(x = x, y = predicted, color = group), linewidth = 1) +
  geom_ribbon(aes(x = x, ymin = conf.low, ymax = conf.high, fill = group), alpha = 0.2, color = NA) +
  labs(title = "Predicted Trade Share of GDP Across HDI by Tax Revenue",
       x = "HDI",
       y = "Predicted Trade Share of GDP",
       color = "Tax Revenue (% of GDP)",
       fill = "Tax Revenue (% of GDP)")+
  theme_minimal() +
  theme(plot.title = element_text(hjust = 0.5))

# plots marginal effects of "wdi_taxrev" across values of "hdi_undp"
marginal_effect_taxrev_plot <-
  interplot(m = taxrev_hdi_interaction,    # model
           var1 = "wdi_taxrev",           # effect of interest (whose slope we’re plotting)
           var2 = "undp_hdi")+              # moderator
  labs(x = "HDI",
       y = "Marginal Effect of Tax Revenue on Trade",
       title = "Marginal Effect of Tax Revenue on Trade Across HDI")+
  theme_minimal() +
  theme(plot.title = element_text(hjust = 0.5))

# plots marginal effects of "hdi_undp" across values of "wdi_taxrev"
marginal_effect_hdi_plot <-
  interplot(m = taxrev_hdi_interaction,
            var1 = "undp_hdi",           # effect of interest (whose slope we're plotting)
            var2 = "wdi_taxrev")+         # moderator) +
  labs(x = "Tax Revenue (% of GDP)",
       y = "Marginal Effect of HDI on Trade",
       title = "Marginal Effect of HDI on Trade Across Tax Revenue")+
  theme_minimal() +
  theme(plot.title = element_text(hjust = 0.5))

# extract data directly from interplot without plotting
marginal_effect_hdi_data <- interplot(
  m = taxrev_hdi_interaction,
  var1 = "undp_hdi",
  var2 = "wdi_taxrev",
  plot = FALSE   # extracts data rather than making plot
)

# inspect
head(marginal_effect_hdi_data)

# makes custom plot using "marginal_effect_hdi_data" data; dashed horizontal line
# at y=0 shows where marginal effect is statistically significant (i.e. statistically
# significant wherever ribbon does not cross 0)
ggplot(marginal_effect_hdi_data) +
  geom_line(aes(x = wdi_taxrev, y = coef), linewidth = 1) +
  geom_ribbon(aes(x=wdi_taxrev, ymin = lb, ymax = ub), alpha = 0.2) +
  geom_hline(yintercept = 0, linetype = "dashed") +
  labs(x = "Tax Revenue (% of GDP)",
       y = "Marginal Effect of HDI on Trade",
       title = "Marginal Effect of HDI on Trade Across Tax Revenue")+
  theme_minimal() +
  theme(plot.title = element_text(hjust = 0.5))


# Exporting Visualizations and Analysis Outputs ----------------------------

# exports "qog_copy_selection_numeric_summarystats2" summary stats table as CSV to 
# outputs table with filename "summary_stats.csv"
write.csv(qog_copy_selection_numeric_summarystats2, "outputs/summary_statistics_pysch.csv", row.names = TRUE)

# exports a text summary stats table with stargazer
stargazer(as.data.frame(qog_copy_selection_numeric), type="text", "Descriptive Statistics", digits=2, out="outputs/summary_stats_stargazer.txt")

# makes list container for regressions we want to export
regression_list<-list(regression1, regression2, regression3)

# exports regressions in "regression_list" via stargazer as html
stargazer(regression_list, type="html", out="outputs/qog_regressions.html")

# exports regressions in "regression_list" via stargazer as text file
stargazer(regression_list, type="text", out="outputs/qog_regressions.txt")

# exports "wdi_trade_inverted" as .png file using "ggsave" function
ggsave("outputs/trade_south_asia.png", wdi_trade_inverted, width=10, height=5)

# exports "wdi_trade_inverted" as .pdf file using "ggsave" function
ggsave("outputs/trade_south_asia.pdf", wdi_trade_inverted, width=10, height=5)

# exports multiple files using pdf graphics device
pdf("outputs/qog_visualizations.pdf", width=12, height=5)
tax_trade_scatter
tax_trade_scatter_line
dev.off()

# creates list of visualizations to export
viz_list<-list(tax_trade_scatter, tax_trade_scatter_line)

# adds names to list elements
names(viz_list)<-c("tax_trade_scatter", "tax_trade_scatter_line")

# creates vector of filenames
viz_names<-paste0("outputs/", names(viz_list), ".png")

# iteratively exports visualizations
walk2(.x=viz_names, .y=viz_list, ggsave, width=12, height=5)






