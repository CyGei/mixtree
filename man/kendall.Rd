% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/within_dist.R
\name{kendall}
\alias{kendall}
\title{Compute the Kendall distance matrix}
\usage{
kendall(tree)
}
\arguments{
\item{tree}{A data frame representing a transmission tree, with the first column containing the infector IDs and the second the infectee IDs.}
}
\value{
A square, symmetric matrix of Kendall's distances between nodes.
}
\description{
Kendall's distance measures the depth of the most recent common infector (MRCI) for each pair of nodes with respect to the source (patient 0).
}
\examples{
tree <- data.frame(from = c(1, 1, 2, 2, 3, 3), to = c(2, 3, 4, 5, 6, 7))
kendall(tree)
}
\references{
A Metric to Compare Transmission Trees - M Kendall · 2018
}
\seealso{
\code{\link[treespace]{findMRCIs}}
}
