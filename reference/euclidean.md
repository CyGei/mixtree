# Calculate the Euclidean distance between two distance matrices.

This function computes the Euclidean distance between the lower
triangular parts of two given matrices.

## Usage

``` r
euclidean(mat1, mat2)
```

## Arguments

- mat1:

  A numeric matrix.

- mat2:

  A numeric matrix.

## Value

A numeric value representing the Euclidean distance between the lower
triangular parts of `mat1` and `mat2`.

## Examples

``` r
mat1 <- matrix(c(1, 2, 3, 4), 2, 2)
mat2 <- matrix(c(4, 3, 2, 1), 2, 2)
euclidean(mat1, mat2)
#> [1] 1
```
