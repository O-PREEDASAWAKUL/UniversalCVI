\name{Gen_AccClust}
\alias{Gen_AccClust}
\title{General Clustering Accuracy}
\description{
Computes clustering accuracy by comparing cluster assignments from any
clustering algorithm with known class labels, using the Hungarian method
for optimal one-to-one label matching.
}
\usage{
Gen_AccClust(cluster, label)
}
\arguments{
  \item{cluster}{
    A numeric vector of cluster assignments, with one assignment
    for each observation.
  }
  \item{label}{
    A numeric vector of known class labels. It must have the same length
    and observation order as \code{cluster}.
  }
}
\details{
The function constructs a contingency table of true class labels and cluster
assignments, then uses \code{\link[clue]{solve_LSAP}} with
\code{maximum = TRUE} to find the one-to-one matching that maximizes
the number of correctly matched observations.

}
\value{
A single numeric value between 0 and 1. A value of 1 indicates perfect
agreement after optimal one-to-one label matching.
}

\references{
Papadimitriou, Christos H., and Kenneth Steiglitz. Combinatorial optimization: algorithms and complexity. Courier Corporation, 1998.
}

\seealso{
\code{\link{AccClust}},
\code{\link[clue]{solve_LSAP}}
}
\examples{
# Different number of group code
cluster <- c(20, 20, 10, 10)
label <- c(1, 1, 2, 2)
Gen_AccClust(cluster, label)


# Different numbers of clusters and true classes
Gen_AccClust(
  cluster = c(1, 2, 3, 3),
  label = c(1, 1, 2, 2)
)

}


