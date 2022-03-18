#' Apply a function on each column of a data frame given a condition
#'
#' @param .data A data frame
#' @param .f A function to apply on the data frame
#' @param .condition Default value "is.numeric", but can be another data type
#' @param .else Default value "identity" (skips over a column)
#' @param ... 
#'
#' @return A tibble
#' @export
#'
#' @examples
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
