# Perform Chi-Square Test on Sets of Transmission Trees

Tests whether the distribution of infector-infectee pairs differs
between sets of transmission trees.

## Usage

``` r
chisq_test(..., method = c("chisq", "fisher"), test_args = list())
```

## Arguments

- ...:

  Two or more sets of transmission trees. Each set is a list of data
  frames with columns `from` and `to`.

- method:

  Test to use: `"chisq"` for Chi-Square or `"fisher"` for Fisher's Exact
  Test. Default is `"chisq"`.

- test_args:

  A list of additional arguments for
  [`stats::chisq.test`](https://rdrr.io/r/stats/chisq.test.html) or
  [`stats::fisher.test`](https://rdrr.io/r/stats/fisher.test.html).
  Default is an empty list.

## Value

An `htest` object with the test results.

## Examples

``` r
set.seed(1)
# No difference in the sets
setA <- replicate(10, igraph::as_long_data_frame(
  make_tree(n_cases = 10, R = 2, stochastic = TRUE)
),
simplify = FALSE
)
setB <- replicate(10, igraph::as_long_data_frame(
  make_tree(n_cases = 10, R = 2, stochastic = TRUE)
),
simplify = FALSE
)
mixtree:::chisq_test(setA, setB)
#> Warning: Chi-squared approximation may be incorrect
#> 
#>  Pearson's Chi-squared test
#> 
#> data:  count data
#> X-squared = 15.755, df = 28, p-value = 0.9693
#> 

# Difference in the sets
setC <- replicate(10, igraph::as_long_data_frame(
  make_tree(n_cases = 10, R = 4, stochastic = TRUE)
),
simplify = FALSE
)
mixtree:::chisq_test(setA, setB, setC)
#> Warning: Chi-squared approximation may be incorrect
#> 
#>  Pearson's Chi-squared test
#> 
#> data:  count data
#> X-squared = 72.91, df = 54, p-value = 0.04412
#> 
```
