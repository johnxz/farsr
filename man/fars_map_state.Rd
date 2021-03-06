% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/fars_functions.R
\name{fars_map_state}
\alias{fars_map_state}
\title{Plot Geographical Mapping of FARS Crash Location data by State}
\usage{
fars_map_state(state.num, year)
}
\arguments{
\item{state.num}{A two-digit FIPS state numeric code}

\item{year}{A four-digit number representing a year}
}
\value{
The result or side-effect of \code{\link[maps]{map}} and
  \code{\link[graphics]{points}}. Invalid \code{state.num}, which
  has no match in STATE column of FARS data, will cause function
  to stop execution and result in "invalid STATE number: ..." error.
  Missing data for the state and year as specified in the arguments
  will result in a warning message "no accidents to plot" and
  (temporarily) an invisible NULL object to be returned.
}
\description{
`fars_map_state()` function plots geographic distribution of FARS
fatal traffic crash locations at individual state level. The function
reads in FARS data of the particular state and year specified in the
arguments, which includes the accidents’ geographical coordinates. The
function then calls \code{\link[maps]{map}} to draw the map of the state,
an outlined polygon selected from the geographical database of USA state
via the xlim and ylim arguments derived from accidents’ longitude and
latitude ranges. Lastly it calls \code{\link[graphics]{points}} function to
add the points mapping to all non NA coordinates in the data to the
state map.
}
\examples{
\dontrun{
fars_map_state(state.num=36, year=2013) # New York
}
\dontrun{
pdf(file="2015_STATE06.pdf")
fars_map_state(06, year=2015)  # California
dev.off()
}

}
\seealso{
\code{\link{fars_read}} and \code{\link{make_filename}},
  which this function wraps
}
