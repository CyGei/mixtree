# Validate a Transmission Tree

Checks if a transmission tree meets specific topology criteria for our
test. The tree must be a directed acyclic graph (DAG), weakly connected,
and have at most one infector per node.

## Usage

``` r
validate_tree(tree)
```

## Arguments

- tree:

  A data frame with columns `from` and `to` representing the
  transmission tree.

## Value

Invisible `TRUE` if the tree is valid. Throws an error if invalid.

## Examples

``` r
good_tree <- data.frame(from = c(1, 2, 3), to = c(2, 3, 4))
validate_tree(good_tree)
bad_tree <- data.frame(from = c(1, 2, 3), to = c(2, 3, 2))
try(validate_tree(bad_tree))
#> Error in validate_tree(bad_tree) : must be a directed acyclic graph.
```
