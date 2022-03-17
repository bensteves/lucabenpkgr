df_apply <- function(.data, .f, .condition = is.numeric, .else = identity, ...) {
  .data |> lapply(
    function(x) 
      if (.condition(x)) 
        .f(x, ...) 
      else 
        .else(x)
  ) %>%
    as_tibble()
}
