#' Apply a function on each column of a data frame given a condition
#'
#' @param .data A data frame
#' @param .f A function to apply on the data frame
#' @param .condition Default value "is.numeric", but can be another data type
#' @param .else Default value "identity" (skips over a column)
#' @param ... Any arguments from .f to pass
#'
#' @return A tibble
#' @export
#'
#' @examples
#' n <- 7L
#' TestData <-
#'     tibble::tibble( double = rnorm(n, 100, 10),
#'      x = 123400 / 10^(1L:n),
#'      date = sample(seq(as.Date('1999/01/01'), as.Date('2022/01/01'), by="day"), n),
#'      integer = (1L:n) * (1L:n),    # ^2 would return a double!!
#'      character = LETTERS[1L:n],
#'      factor = factor(letters[1L:n]),
#'      logical = rep(c(TRUE, FALSE), length.out = n) )
#'      
#' df_apply(TestData, round, is.numeric, digits =4)
#' df_apply(TestData, mean, is.numeric)
#' df_apply(TestData, lubridate::year, lubridate::is.Date)
#' df_apply(TestData, toupper, is.character)
#' 
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
