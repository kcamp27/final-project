here::i_am(
  "code/02_make_table.R"
)

library(tableone)
library(kableExtra)

## Loading the data

#Read in data 
us <- readRDS(here::here("output", "us_shp.rds"))
state <- readRDS(here::here("output", "state.rds"))
nvss <- readRDS(here::here("data", "nvss.rds"))


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

## Vector of variables to summarize
myVars <- c("mager","phype", "ghype", "ehype","pay_rec")
## Vector of categorical variables that need transformation
catVars <- c( "phype", "ghype", "ehype","pay_rec")



## Create a TableOne object
tab2 <- CreateTableOne(vars = myVars, strata = c('mbrace'), data = nvss, factorVars = catVars)


matrix2 <- print(tab2, printToggle = FALSE, noSpaces = TRUE, test = FALSE)


#Name the rows
row.names(matrix2) <- c('Number of Live Births', 'Maternal Age', 'Prepregnancy Hypertension', 
                       'Gestational Hypertension', 'Ecclampsia', "Payment Source", "Medicaid", "Private", "Self-Pay")
colnames(matrix2) <- c('White', 'Black', 'AI/AN', 'AAPI')

# Create the table
tab2 <- kable(matrix2, 
              "simple", 
              digits = 2,
              eps = 0.01,
              format.args = list(), 
              escape = FALSE,
              caption = "Table 2. NVSS Birth Record Descriptives")


saveRDS(
  tab2,
  file = here::here("output", "table_two.rds")
)
