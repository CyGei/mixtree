# Generate a Transmission Tree

Creates a transmission tree with a specified number of cases and
branches per case. The tree can be generated with fixed or
Poisson-distributed branching factors.

## Usage

``` r
make_tree(n_cases, R = 2, stochastic = FALSE, plot = FALSE)
```

## Arguments

- n_cases:

  Integer. The total number of cases (nodes) in the tree.

- R:

  Integer. The fixed number of branches per case when `stochastic` is
  `FALSE`, or the mean of the Poisson distribution when `stochastic` is
  `TRUE`.

- stochastic:

  Logical. If `TRUE`, the number of branches per case is sampled from a
  Poisson distribution with mean `R`. Default is `FALSE`.

- plot:

  Logical. If `TRUE`, the function will plot the generated tree. Default
  is `FALSE`.

## Value

An igraph object representing the transmission tree.

## Examples

``` r
# Generate a deterministic transmission tree
deterministic_tree <- make_tree(n_cases = 15, R = 2, stochastic = FALSE, plot = TRUE)


# Generate a stochastic transmission tree
random_tree <- make_tree(n_cases = 15, R = 2, stochastic = TRUE, plot = TRUE)
```
