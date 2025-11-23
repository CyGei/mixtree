# Validate sets of transmission trees

Checks that the provided input is a list of at least two valid sets of
transmission trees. Each set is expected to be a list containing at
least one data frame, as verified by
[`validate_set`](https://cygei.github.io/epitree/reference/validate_set.md).

## Usage

``` r
validate_sets(sets)
```

## Arguments

- sets:

  A list where each element represents a set of transmission trees. Each
  set must be a list containing one or more data frames.

## Value

Invisible `TRUE` if the sets are valid. Throws an error if invalid.

## Details

At least two sets are provided. Each set is a list (and not a data frame
itself). Each set contains at least one element. Every element in each
set is a data frame.

## See also

[`validate_set`](https://cygei.github.io/epitree/reference/validate_set.md)
for validating an individual set.
