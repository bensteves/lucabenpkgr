require(purrr)

#returns no rows
factor_keep <- lego_wrangle %>%
  keep(is.factor)

#returns 2 rows
numeric.keep <- lego_wrangle %>%
  keep(is.numeric)

test_that("df_apply - keep(factor)", {
  expect_equal(df_apply(lego_wrangle, keep, is.factor), factor_keep)
})

test_that("df_apply - keep(numeric)", {
  expect_equal(df_apply(lego_wrangle, keep, is.factor), numeric_keep)
})

df_apply <- function(.data, .f, .condition = is.numeric, .else = identity, ...) {
  .data |> lapply(
    function(x)
      if (.condition(x))
        .f(x, ...)
    else
      .else(x)
  ) |>
    tibble::as_tibble()
}
