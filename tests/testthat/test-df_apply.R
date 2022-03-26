require(purrr)
require(dplyr)
require(magrittr)
require(tibble)
require(lubridate)


#ROUND()
digits = 2

#trivial to round year, but it is listed as an int in Luca's training set
rounded_lego <-lego_wrangle |>
  mutate(n = round(n, digits),
         year = round(year, digits)) |>
  as_tibble()
  
test_that("df_apply - round() - lego", {
  expect_equal(df_apply(lego_wrangle, round, is.numeric, digits = digits), rounded_lego)
})

rounded_climate <- world_climate |>
  mutate(across(where(is.numeric), round, digits = digits)) |>
  as_tibble()

test_that("df_apply - round() - climate", {
  expect_equal(df_apply(world_climate, round, is.numeric, digits = digits), rounded_climate)
})

#TOUPPER()
upper_lego <- lego_wrangle |>
  mutate(name.x = toupper(name.x)) |>
  as_tibble()

test_that("df_apply - toupper() - lego", {
  expect_equal(df_apply(lego_wrangle, toupper, is.character), upper_lego)
})

upper_climate <- world_climate |>
  mutate(across(where(is.character), toupper)) |>
  as_tibble()

test_that("df_apply - toupper() - climate", {
  expect_equal(df_apply(world_climate, toupper, is.character), upper_climate)
})

#YEAR() (extracts only the year)
today_climate <- world_climate |>
  mutate(year = year(year)) |> 
  as_tibble()

test_that("df_apply - year() - climate", {
  expect_equal(df_apply(world_climate, year, is.Date), today_climate)
})

#MEAN()
mean_climate <- world_climate |>
  mutate(across(where(is.numeric), mean, digits = digits)) |>
  as_tibble()

test_that("df_apply - mean - climate", {
  expect_equal(df_apply(world_climate, mean, is.numeric), mean_climate)
})