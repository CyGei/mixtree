# Shuffle Node IDs in a Graph

Randomly shuffles the IDs of the nodes in a given graph and optionally
plots the shuffled graph.

## Usage

``` r
shuffle_graph_ids(g, plot = FALSE)
```

## Arguments

- g:

  An igraph object representing the graph.

- plot:

  Logical. If `TRUE`, the function will plot the shuffled graph. Default
  is `FALSE`.

## Value

An igraph object with shuffled node IDs.

## Examples

``` r
# Create an example graph
g <- make_tree(n_cases = 10, R = 2)

# Shuffle the node IDs
shuffled_graph <- shuffle_graph_ids(g, plot = TRUE)
```
