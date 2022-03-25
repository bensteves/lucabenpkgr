test_that("multiplication works", {
  expect_equal(df_apply(lego_wrangle, keep, is.factor,  ), 4)
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
