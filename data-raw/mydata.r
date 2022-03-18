#Luca's data

lego_sets <- read.csv("data-raw/sets.csv")

lego_themes <- read.csv("data-raw/themes.csv")

lego <- merge(lego_themes, lego_sets, by.x ="id", by.y ="theme_id", all.x = TRUE, all.y = FALSE)

lego_wrangle <- lego |>
  dplyr::group_by(name.x, year) |>
  dplyr::filter(grepl('Star Wars', name.x)) |>
  dplyr::summarise(n=dplyr::n())

usethis::use_data(lego_wrangle)


#Ben's data
alpha3codes <- read.csv("data-raw/alphacodes.csv") |> janitor::clean_names()

world_climate_data <- read.csv("data-raw/world_climate_data.csv") |> janitor::clean_names()

world_climate <- world_climate_data |>
  dplyr::select(1:4, x1960:x2020) |>
  tidyr::pivot_longer(cols = starts_with("x"), names_to = "year", values_to = "measure") |>
  dplyr::filter(!is.na(measure)) |>
  dplyr::mutate(year = sub('x', '', year),
         year = lubridate::ymd(year, truncated = 2L),
         measure = round(measure, 2))

world_climate <- world_climate |>
  dplyr::left_join(alpha3codes, by = c("country_code" = "alpha_3"))

usethis::use_data(world_climate)
usethis::use_data(alpha3codes)