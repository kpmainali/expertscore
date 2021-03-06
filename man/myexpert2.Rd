% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/datadocumentation.R
\docType{data}
\name{myexpert2}
\alias{myexpert2}
\title{Expert map #2}
\format{SpatialPolygonsDataFrame}
\source{
Hypothetical data
}
\usage{
data(myexpert2)
}
\description{
Hypothetical expert map #2
}
\examples{
# load and plot probability surface raster
data(myprobsurface)
plot(myprobsurface)

# load and plot study area
data(mystudyarea); plot(mystudyarea, add = TRUE)

# load and plot all expert score datasets
data(myexpert1); plot(myexpert1, add = TRUE)
data(myexpert2); plot(myexpert2, add = TRUE)
data(myexpert3); plot(myexpert3, add = TRUE)

# load and plot occurrence data
data(myoccurrences); plot(myoccurrences, col = "red", add = TRUE)
}
\keyword{data}
