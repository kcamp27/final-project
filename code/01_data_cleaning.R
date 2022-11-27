here::i_am(
  "code/01_data_cleaning.R"
)

# The data on natality is collect from the following link: 
#https://www.nber.org/research/data/vital-statistics-natality-birth-data

# load in required packages
library(dplyr)
library(data.table)
library(tidycensus)
library(sf)    
library(tigris)  

## read in CDC Wonder natality data at the STATE level
state <-read.table('data/Natality2019_clean.txt', 
                            sep ='\t',
                            header = T, 
                            na.strings = c('Missing', 'Suppressed'), 
                            stringsAsFactors = F)

#remove unnecessary variables
state <- state %>% select(!c("X", 
                             "Standard.Deviation.for.Average.Birth.Weight", 
                             "Standard.Deviation.for.Average.Pre.pregnancy.BMI",
                             "Standard.Deviation.for.Average.Number.of.Prenatal.Visits"))

#rename variables
state <- state %>% rename(state = State.of.Residence, 
                          statecode = State.of.Residence.Code,
                          totpopu = Total.Population,
                          birthrate = Birth.Rate,
                          perc_birth = X..of.Total.Births,
                          avgage = Average.Age.of.Mother..years.,
                          avgbirthweight = Average.Birth.Weight..grams.,
                          prepregbmi = Average.Pre.pregnancy.BMI,
                          pnvisits = Average.Number.of.Prenatal.Visits)

#read in census region identifiers
ids <- read.csv('data/censusid.csv')

#merge census region identifiers with state cdc wonder natality data
state <- state %>% left_join(ids, by = c("state"="State"))

#save dataset with state cdc wonder natality data
saveRDS(state, file = "output/state.rds")

#read in cdc wonder natality data by REGION
region <-read.table('data/Natality2019_region.txt', 
                   sep ='\t',
                   header = T, 
                   na.strings = c('Missing', 'Suppressed'), 
                   stringsAsFactors = F) 
region <- region %>% select(!"Notes")
region <- region %>% rename(totpopu = Total.Population,
                          birthrate = Birth.Rate,
                          perc_birth = X..of.Total.Births,
                          avgage = Average.Age.of.Mother..years.,
                          birthweight = Average.Birth.Weight..grams.,
                          prepregbmi = Average.Pre.pregnancy.BMI,
                          pnvisits = Average.Number.of.Prenatal.Visits)


#save data set of regional natality rates
saveRDS(region, file = "output/region.rds")


# setting options to 'cache' data can help speed up future downloads
options(tigris_use_cache = T)

# Download the geometry/shapes for all US counties
us <- states(cb = TRUE, resolution = '5m',  # specify  a 'light weight' resolution
               class = 'sf',                  # we want the data in sf format
               year = 2019) %>%               # some boundaries change; we want 2018
  st_transform(5070)                          # project data to Albers Equal Area


us <- us %>% filter(!(STATEFP %in% c("78", "72", "69", "66", "60")))                          
saveRDS(us, file = "output/us_shp.rds")

