here::i_am(
  "code/03_make_figure.R"
)

library(dplyr)
library(sf)
library(tmap)

us <- readRDS(here::here("output", "us_shp.rds"))
state <- readRDS(here::here("output", "state.rds"))

us$STATEFP <- as.numeric(us$STATEFP)
state_us <- us %>% left_join(state, by= c("STATEFP"= "statecode")) 
state_us <- state_us %>% filter(!STATEFP == 2) %>% filter(!STATEFP == 15)

t1 <- tm_shape(state_us) + 
  tm_fill('birthrate',
          style = 'quantile',
          palette = 'BuPu',
          title = 'Rate per 1,000 population') + 
  tm_borders(alpha = 0.2) +       
  tm_credits('Source: CDC Wonder',
             position = c('RIGHT', 'BOTTOM')) + 
  tm_layout(main.title = 'Figure 1. Birth Rate by US state, 2019',
            bg.color = 'grey85')

saveRDS(
  t1,
  file = here::here("output", "map_one.rds")
)