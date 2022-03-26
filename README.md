
<!-- README.md is generated from README.Rmd. Please edit that file -->

# lucabenpkgr

<!-- badges: start -->
<!-- badges: end -->

The goal of lucabenpkgr is to apply a function on a dataset given some
condition

## Installation

You can install the development version of lucabenpkgr from
[GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
devtools::install_github("bensteves/lucabenpkgr")
```

## Example

This is a basic example which shows you how to solve a common problem:

``` r
library(lucabenpkgr)
n <- 7L
 TestData <-
     tibble::tibble( double = rnorm(n, 100, 10),
      x = 123400 / 10^(1L:n),
      date = sample(seq(as.Date('1999/01/01'), as.Date('2022/01/01'), by="day"), n),
      integer = (1L:n) * (1L:n),    # ^2 would return a double!!
      character = LETTERS[1L:n],
      factor = factor(letters[1L:n]),
      logical = rep(c(TRUE, FALSE), length.out = n) )
      
 df_apply(TestData, round, is.numeric, digits =4)
#> # A tibble: 7 × 7
#>   double          x date       integer character factor logical
#>    <dbl>      <dbl> <date>       <dbl> <chr>     <fct>  <lgl>  
#> 1  111.  12340      2018-04-08       1 A         a      TRUE   
#> 2   81.0  1234      2020-08-04       4 B         b      FALSE  
#> 3   96.6   123.     2013-09-21       9 C         c      TRUE   
#> 4  121.     12.3    2014-09-11      16 D         d      FALSE  
#> 5  102.      1.23   2011-07-17      25 E         e      TRUE   
#> 6  118.      0.123  2020-12-09      36 F         f      FALSE  
#> 7  103.      0.0123 2019-10-07      49 G         g      TRUE
 df_apply(TestData, mean, is.numeric)
#> # A tibble: 7 × 7
#>   double     x date       integer character factor logical
#>    <dbl> <dbl> <date>       <dbl> <chr>     <fct>  <lgl>  
#> 1   105. 1959. 2018-04-08      20 A         a      TRUE   
#> 2   105. 1959. 2020-08-04      20 B         b      FALSE  
#> 3   105. 1959. 2013-09-21      20 C         c      TRUE   
#> 4   105. 1959. 2014-09-11      20 D         d      FALSE  
#> 5   105. 1959. 2011-07-17      20 E         e      TRUE   
#> 6   105. 1959. 2020-12-09      20 F         f      FALSE  
#> 7   105. 1959. 2019-10-07      20 G         g      TRUE
 df_apply(TestData, lubridate::year, lubridate::is.Date)
#> # A tibble: 7 × 7
#>   double          x  date integer character factor logical
#>    <dbl>      <dbl> <dbl>   <int> <chr>     <fct>  <lgl>  
#> 1  111.  12340       2018       1 A         a      TRUE   
#> 2   81.0  1234       2020       4 B         b      FALSE  
#> 3   96.6   123.      2013       9 C         c      TRUE   
#> 4  121.     12.3     2014      16 D         d      FALSE  
#> 5  102.      1.23    2011      25 E         e      TRUE   
#> 6  118.      0.123   2020      36 F         f      FALSE  
#> 7  103.      0.0123  2019      49 G         g      TRUE
 df_apply(TestData, toupper, is.character)
#> # A tibble: 7 × 7
#>   double          x date       integer character factor logical
#>    <dbl>      <dbl> <date>       <int> <chr>     <fct>  <lgl>  
#> 1  111.  12340      2018-04-08       1 A         a      TRUE   
#> 2   81.0  1234      2020-08-04       4 B         b      FALSE  
#> 3   96.6   123.     2013-09-21       9 C         c      TRUE   
#> 4  121.     12.3    2014-09-11      16 D         d      FALSE  
#> 5  102.      1.23   2011-07-17      25 E         e      TRUE   
#> 6  118.      0.123  2020-12-09      36 F         f      FALSE  
#> 7  103.      0.0123 2019-10-07      49 G         g      TRUE
```
