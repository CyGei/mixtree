# Compute the Abouheif distance matrix

The Abouheif distance is the product of the number of direct descendants
of each node in the path between two nodes. It is a measure of the
number of transmission events between two nodes.

## Usage

``` r
abouheif(tree)
```

## Arguments

- tree:

  A data frame representing a transmission tree, with the first column
  containing the infector IDs and the second the infectee IDs.

## Value

A square, symmetric matrix of Abouheif distances between nodes.

## Examples

``` r
tree <- data.frame(from = c(1, 1, 2, 2, 3, 3), to = c(2, 3, 4, 5, 6, 7))
abouheif(tree)
#>   1 2 3  4  5  6  7
#> 1 0 0 0  3  3  3  3
#> 2 0 0 2  0  0  6  6
#> 3 0 2 0  6  6  0  0
#> 4 3 0 6  0  3 18 18
#> 5 3 0 6  3  0 18 18
#> 6 3 6 0 18 18  0  3
#> 7 3 6 0 18 18  3  0
```
