lego_sets <- read.csv("sets.csv")

lego_themes <- read.csv("themes.csv")

lego <- merge(lego_themes, lego_sets, by.x ="id", by.y ="theme_id", all.x = TRUE, all.y = FALSE)

lego_wrangle <- lego %>%
  group_by(name.x, year) %>%
  filter(grepl('Star Wars', name.x)) %>%
  summarise(n=n())

usethis::use_data(lego_wrangle)

alpha3codes <- read.csv("alphacodes.csv")

world_climate_data <- read.csv("world_climate_data.csv")

