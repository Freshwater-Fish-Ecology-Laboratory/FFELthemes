% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/ffel_colours.R
\name{ffel_cols}
\alias{ffel_cols}
\title{Extract FFEL Colours}
\usage{
ffel_cols(...)
}
\arguments{
\item{...}{Character name of one or more colours from \code{\link{ffel_colours}}.}
}
\description{
Extract FFEL colours as hex codes.
}
\details{
Returns a character vector of hex codes for each of the colour names specified. Allows the user to select colours for plotting, change the order of colours, and manually adjust \pkg{ggplot2} plot colours.
}
\examples{
ffel_cols()
ffel_cols(c("maize", "sepia"))

ggplot(mtcars, aes(hp, mpg)) +
  geom_point(color = ffel_cols("metalic blue"),
             size = 3) +
  theme_ffel()
}
