
<!-- README.md is generated from README.Rmd. Please edit that file -->

# mixtree <a href="https://cygei.github.io/epitree/"><img src="man/figures/logo.png" alt="mixtree website" align="right" height="242"/></a>

<!-- badges: start -->

[![R-CMD-check](https://github.com/CyGei/mixtree/actions/workflows/R-CMD-check.yaml/badge.svg)](https://github.com/CyGei/mixtree/actions/workflows/R-CMD-check.yaml)
[![CodeFactor](https://www.codefactor.io/repository/github/cygei/mixtree/badge)](https://www.codefactor.io/repository/github/cygei/mixtree)
[![Lifecycle:experimental](https://lifecycle.r-lib.org/articles/figures/lifecycle-stable.svg)](https://lifecycle.r-lib.org/articles/stages.html#stable)
[![CRAN
status](https://www.r-pkg.org/badges/version/mixtree)](https://CRAN.R-project.org/package=mixtree)
[![CRAN
downloads](https://cranlogs.r-pkg.org/badges/grand-total/mixtree)](https://CRAN.R-project.org/package=mixtree)

<!-- badges: end -->

Bayesian inference methods are increasingly used to reconstruct trees
(*e.g.* phylogenetic or transmission trees) producing collections of
trees, or “forests”.

`mixtree` provides a statistical framework to compare sets of trees and
test whether they originate from the same or different generative
processes.

## Installation

You can install the development version of mixtree from
[GitHub](https://github.com/) with:

``` r
# install.packages("pak")
pak::pak("CyGei/mixtree")
```

# Quick start

``` r
library(mixtree)

# Simulate two chains of transmission trees
chainA <- lapply(1:100, function(i) {
  make_tree(20, R = 2, stochastic = TRUE) |>
    igraph::as_long_data_frame()
})
chainB <- lapply(1:100, function(i) {
  make_tree(20, R = 4, stochastic = TRUE) |>
    igraph::as_long_data_frame()
})

# Compare the two chains
result <- tree_test(chainA, chainB)
print(result)
#> Permutation test for adonis under reduced model
#> Permutation: free
#> Number of permutations: 999
#> 
#> (function (formula, data, permutations = 999, method = "bray", sqrt.dist = FALSE, add = FALSE, by = NULL, parallel = getOption("mc.cores"), na.action = na.fail, strata = NULL, ...) 
#>           Df SumOfSqs      R2      F Pr(>F)    
#> Model      1     5490 0.10518 23.274  0.001 ***
#> Residual 198    46710 0.89482                  
#> Total    199    52201 1.00000                  
#> ---
#> Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
```
