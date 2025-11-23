# Compute the Patristic distance matrix

The patristic distance is the number of generations separating any two
nodes in a transmission tree.

## Usage

``` r
patristic(tree)
```

## Arguments

- tree:

  A data frame representing a transmission tree, with the first column
  containing the infector IDs and the second the infectee IDs.

## Value

A square, symmetric matrix of patristic distances between nodes.

## Examples

``` r
tree <- data.frame(from = c(1, 1, 2, 2, 3, 3), to = c(2, 3, 4, 5, 6, 7))
patristic(tree)
#>   1 2 3 4 5 6 7
#> 1 0 1 1 2 2 2 2
#> 2 1 0 2 1 1 3 3
#> 3 1 2 0 3 3 1 1
#> 4 2 1 3 0 2 4 4
#> 5 2 1 3 2 0 4 4
#> 6 2 3 1 4 4 0 2
#> 7 2 3 1 4 4 2 0
```
