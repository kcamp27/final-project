# Final Project Report Building

> Katie Campbell

------------------------------------------------------------------------

## Proposed Data Sources
This report will use a population of women who gave birth in the United States in 2019, both at the individual-level and aggregated to the state-level.

### CDC Wonder Live Births
We will be using data from CDC Wonder live birth database to capture state-level birth counts, birth rates, as well as other characteristics of mothers and their child (Table 1.) These data will be used to examine geographic variation in characteristics associated with HDPs and the risk factors. Tigris shapefiles will be used to create figures and explore spatial relations by US census regions.

### NVSS Natality Data
Data for this report will also include the National Vital Statistics Public Use Live Birth. This data is made available from the National Center for Health Statistics on the CDC Data Access Portal. These data represent all live births at the individual level for 2019 and contain an identifier for HDPs and several other risk factors, such as maternal age, number of prenatal visits and insurance type.


### Tables and figures 
For this report, tables will include descriptive statistics and results from the regression models. Data from CDC Wonder to create map graphics and examine state-level covariates, while NVSS data will be used for regression modeling. Figures may include relations between timing of care, number of visits, and insurance status. A graphical map will be included to show the birthrate in the US (figure 1). Analyses may also include variables from American Community Survey to examine place-based associations and build multi-level models. 

## Code description

`code/01_data_cleaning.R`

  - generates RDS files to create table and maps
  - saves clean datasets as a `.rds` object in `output/` folder

`code/02_make_table.R`

  - generates RDS file to make table one to be printed in the report
  - saves final table as a `.rds` object in `output/` folder

`code/03_make_figure.R`

  - generates RDS file to create map for the report
  - saves map as a `.rds` object in `output/` folder
  
`code/04_render_report.R`

  - renders `report.Rmd`

`report.Rmd`

  - Rmarkdown file that explains and displays table and figure

------------------------------------------------------------------------



