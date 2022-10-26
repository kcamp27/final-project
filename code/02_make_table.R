here::i_am(
  "code/02_make_table.R"
)

pacman::p_load(tidyverse,    # general data wrangling
               tidycensus,   # importing Census attribute data into R
               sf,           # Spatial data classes
               tmap,         # Mapping/cartography
               tigris,       # importing Census geography into R
               dplyr,
               readr,
               tableone,
               knitr) 


## Loading the data

#Read in data 
us <- read_rds(here::here("output", "us_shp.rds"))
state <- read_rds(here::here("output", "state.rds"))


## Table creation

# Make a list of variables to include in the table
my_vars <- c("birthrate","avgage","avgbirthweight", "prepregbmi","pnvisits")

#Use tableone package to make a descriptive dataframe
tab <- CreateTableOne(vars = my_vars, data = state, strata = "Region")
matrix <- print(tab, printToggle = FALSE, noSpaces = TRUE, test = FALSE)


#Name the rows
row.names(matrix) <- c('Number of States', 'Birth Rate', 'Maternal Age', 'Birth Weight (g)', 'Pre-Pregnancy BMI', 'Prenatal Visits')

# Create the table
tab1 <- kable(matrix, 
      "simple", 
      digits = 2,
      eps = 0.01,
      format.args = list(), 
      escape = FALSE,
      caption = "Table 1. Descriptive Statistics")


saveRDS(
  tab1,
  file = here::here("output", "table_one.rds")
)
