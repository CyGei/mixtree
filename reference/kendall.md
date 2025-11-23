# Compute the Kendall distance matrix

Kendall's distance measures the depth of the most recent common infector
(MRCI) for each pair of nodes with respect to the source (patient 0).

## Usage

``` r
kendall(tree)
```

## Arguments

- tree:

  A data frame representing a transmission tree, with the first column
  containing the infector IDs and the second the infectee IDs.

## Value

A square, symmetric matrix of Kendall's distances between nodes.

## References

A Metric to Compare Transmission Trees - M Kendall · 2018

## See also

[`findMRCIs`](https://rdrr.io/pkg/treespace/man/findMRCIs.html)

## Examples

``` r
if (FALSE) { # \dontrun{
  # Only run this example if treespace is installed
  if (requireNamespace("treespace", quietly = TRUE)) {
    tree <- data.frame(from = c(1, 1, 2, 2, 3, 3), to = c(2, 3, 4, 5, 6, 7))
    kendall(tree)
  }
} # }
```
