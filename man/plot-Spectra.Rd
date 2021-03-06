% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/plot-methods.R
\name{plot-Spectra}
\alias{plot-Spectra}
\alias{plot}
\alias{plot.Spectra}
\alias{plot,Spectra,ANY-method}
\alias{plot.Spectra}
\title{Plots an object inheriting from the Spectra class}
\usage{
\method{plot}{Spectra}(x,gg,gaps,attr,\dots)

\method{plot}{Spectra}(x, gg = FALSE, gaps = TRUE, attr = NULL, ...)
}
\arguments{
\item{x}{an object of class \code{"Spectra"} or inheriting from this class}

\item{gg}{if TRUE, uses the \code{ggplot2} package to plot the data, if
FALSE uses \code{matplot} from base graphics (much faster)}

\item{gaps}{if TRUE, gaps in the spectra are not plotted}

\item{attr}{attribute against which lines are coloured (only for \code{gg =
TRUE}}

\item{...}{additional parameters passed to \code{matplot}}
}
\description{
The philosophy of this plotting routine is to provide a "quick'n'dirty" way
to plot your spectra collection. For advanced visualisations, the use of
\code{\link{melt_spectra}} alongside with ggplot2 or lattice is encouraged.
}
\examples{

# Loading example data
data(australia)
spectra(australia) <- sr_no ~ ... ~ 350:2500

# Default plotting method
plot(australia[1:5,])

# Default plot using ggplot2
plot(australia[1:5,], gg = TRUE)

\dontrun{

# Managing gaps in the spectra
s <- cut(australia, wl =c(-1*450:500, -1*1800:2050))
plot(s, gaps = TRUE)
plot(s, gaps = FALSE)

# passing various options to matplot
plot(
  australia, 
  lty = 1:5, 
  col = 'blue', 
  xlab = 'foo', ylab = 'bar', 
  ylim = c(0.4,0.6), 
  main = 'my plot'
)

# Using colour ramps
plot(
  australia, 
  lty = 1, 
  col = rainbow(10), 
  main = "It is possible to create really ugly visualisations"
)

# Example using colours given by ColorBrewer (http://colorbrewer2.org/)
library(RColorBrewer)
plot(australia, lty = 1, col = brewer.pal(n = 8, name = "Set2"))

# Using an attribute to group spectra

# Generate some kind of factor
australia$fact <- sample(LETTERS[1:3], size = nrow(australia), replace = TRUE) 

s <- aggregate_spectra(australia, fun = mean, id = 'fact')
plot(s, gg = TRUE, attr = 'fact')
}
}
\author{
Pierre Roudier \url{pierre.roudier@gmail.com}
}
