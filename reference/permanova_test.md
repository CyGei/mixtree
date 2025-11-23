# Perform PERMANOVA on Sets of Transmission Trees

Tests for significant differences between sets of transmission trees
using PERMANOVA (via
[`vegan::adonis2`](https://vegandevs.github.io/vegan/reference/adonis.html)).

## Usage

``` r
permanova_test(
  ...,
  within_dist = patristic,
  between_dist = euclidean,
  test_args = list()
)
```

## Arguments

- ...:

  Two or more sets of transmission trees. Each set is a list of
  dataframes with columns `from` (infector) and `to` (infectee).

- within_dist:

  A function to compute pairwise distances within a tree. Takes a
  dataframe, returns a square matrix. Default is
  [`patristic`](https://cygei.github.io/epitree/reference/patristic.md).

- between_dist:

  A function to compute distance between two trees. Takes two matrices,
  returns a numeric value. Default is
  [`euclidean`](https://cygei.github.io/epitree/reference/euclidean.md).

- test_args:

  A list of additional arguments to pass to
  [`vegan::adonis2`](https://vegandevs.github.io/vegan/reference/adonis.html).
  Default is an empty list.

## Value

A
[`vegan::adonis2`](https://vegandevs.github.io/vegan/reference/adonis.html)
object containing the test results.

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
mixtree:::permanova_test(setA, setB)
#> Warning: number of items to replace is not a multiple of replacement length
#> Permutation test for adonis under reduced model
#> Permutation: free
#> Number of permutations: 999
#> 
#> (function (formula, data, permutations = 999, method = "bray", sqrt.dist = FALSE, add = FALSE, by = NULL, parallel = getOption("mc.cores"), na.action = na.fail, strata = NULL, ...) 
#>          Df SumOfSqs      R2      F Pr(>F)
#> Model     1    31.05 0.04356 0.8199  0.592
#> Residual 18   681.70 0.95644              
#> Total    19   712.75 1.00000              

# Difference in the sets
setC <- replicate(10, igraph::as_long_data_frame(
  make_tree(n_cases = 10, R = 4, stochastic = TRUE)
),
simplify = FALSE
)
mixtree:::permanova_test(setA, setB, setC)
#> Warning: number of items to replace is not a multiple of replacement length
#> Permutation test for adonis under reduced model
#> Permutation: free
#> Number of permutations: 999
#> 
#> (function (formula, data, permutations = 999, method = "bray", sqrt.dist = FALSE, add = FALSE, by = NULL, parallel = getOption("mc.cores"), na.action = na.fail, strata = NULL, ...) 
#>          Df SumOfSqs      R2      F Pr(>F)    
#> Model     2   151.93 0.15283 2.4354  0.001 ***
#> Residual 27   842.20 0.84717                  
#> Total    29   994.13 1.00000                  
#> ---
#> Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1
```
