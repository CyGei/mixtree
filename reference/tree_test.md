# Test Differences Between Sets of Transmission Trees

Performs a statistical test to assess whether there are significant
differences between sets of transmission trees. Supports PERMANOVA (via
`"vegan::adonis2"`), Chi-Square, or Fisher's Exact Test.

## Usage

``` r
tree_test(
  ...,
  method = c("permanova", "chisq", "fisher"),
  within_dist = patristic,
  between_dist = euclidean,
  test_args = list()
)
```

## Arguments

- ...:

  Two or more sets of transmission trees. Each set must be a list of
  data frames with columns `from` (infector) and `to` (infectee).

- method:

  A character string specifying the test method. Options are
  `"permanova"`, \#' `"chisq"`, or `"fisher"`. Default is `"permanova"`.

- within_dist:

  A function to compute pairwise distances within a tree for PERMANOVA.
  Takes a data frame, returns a square matrix. Default is
  [`patristic`](https://cygei.github.io/mixtree/reference/patristic.md).

- between_dist:

  A function to compute distance between two trees for PERMANOVA. Takes
  two matrices, returns a numeric value. Default is
  [`euclidean`](https://cygei.github.io/mixtree/reference/euclidean.md).

- test_args:

  A list of additional arguments to pass to the underlying test function
  ([`vegan::adonis2`](https://vegandevs.github.io/vegan/reference/adonis.html),
  [`stats::chisq.test`](https://rdrr.io/r/stats/chisq.test.html), or
  [`stats::fisher.test`](https://rdrr.io/r/stats/fisher.test.html)).
  Default is an empty list.

## Value

- For `"permanova"`: A `"vegan::adonis2"` object containing the test
  results.

- For `"chisq"` or `"fisher"`: An `"htest"` object with the test
  results.

## Details

This function compares sets of transmission trees using one of three
statistical tests.

**PERMANOVA**: Evaluates whether the topological distribution of
transmission trees differs between sets.

- **Null Hypothesis (H0)**: Transmission trees in all sets are drawn
  from the same distribution, implying similar topologies.

- **Alternative Hypothesis (H1)**: At least one set of transmission
  trees comes from a different distribution.

**Chi-Square or Fisher’s Exact Test**: Evaluates whether the
distribution of infector-infectee pairs differs between sets.

- **Null Hypothesis (H0)**: The frequency of infector-infectee pairs is
  consistent across all sets.

- **Alternative Hypothesis (H1)**: The frequency of infector-infectee
  pairs differs between at least two sets.

## Examples

``` r
set.seed(1)
# Generate example sets
setA <- replicate(10, igraph::as_long_data_frame(
  make_tree(n_cases = 10, R = 2, stochastic = TRUE)
), simplify = FALSE)
setB <- replicate(10, igraph::as_long_data_frame(
  make_tree(n_cases = 10, R = 2, stochastic = TRUE)
), simplify = FALSE)
setC <- replicate(10, igraph::as_long_data_frame(
  make_tree(n_cases = 10, R = 4, stochastic = TRUE)
), simplify = FALSE)

# PERMANOVA test
tree_test(setA, setB, setC,  method = "permanova")
#> Warning: number of items to replace is not a multiple of replacement length
#> Permutation test for adonis under reduced model
#> Permutation: free
#> Number of permutations: 999
#> 
#> (function (formula, data, permutations = 999, method = "bray", sqrt.dist = FALSE, add = FALSE, by = NULL, parallel = getOption("mc.cores"), na.action = na.fail, strata = NULL, ...) 
#>          Df SumOfSqs      R2      F Pr(>F)  
#> Model     2   103.13 0.10511 1.5856  0.053 .
#> Residual 27   878.10 0.89489                
#> Total    29   981.23 1.00000                
#> ---
#> Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1

# Chi-Square test
tree_test(setA, setB, setC, method = "chisq")
#> Warning: Chi-squared approximation may be incorrect
#> 
#>  Pearson's Chi-squared test
#> 
#> data:  count data
#> X-squared = 72.91, df = 54, p-value = 0.04412
#> 
```
