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

world_climate <- world_climate %>%
  select(1:4, x1960:x2020) %>%
  pivot_longer(cols = starts_with("x"), names_to = "year", values_to = "measure") %>%
  filter(!is.na(measure)) %>%
  mutate(year = sub('x', '', year),
         year = lubridate::ymd(year, truncated = 2L),
         measure = round(measure, 2))
world_climate <- world_climate %>%
  left_join(alpha3codes, by = c("country_code" = "alpha_3"))