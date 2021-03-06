% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/winmove.R
\docType{class}
\name{winmove-class}
\alias{winmove-class}
\title{An S4 class for use with winmove functions (extends RasterLayer)}
\description{
An S4 class for use with winmove functions (extends RasterLayer). Objects
  will need to be set to this class in order to be used with the inbuilt \code{winmove}
  functions (e.g. \code{mean}, \code{prop}, \code{var_range}, \code{shdi}, \code{shei})
}
\section{Slots}{

Slots for RasterLayer and RasterBrick objects
	\describe{
    \item{\code{title}:}{Character} 
    \item{\code{file}:}{Object of class \code{".RasterFile"} }
    \item{\code{data}:}{Object of class \code{".SingleLayerData"} or \code{".MultipleLayerData"}}
    \item{\code{history}:}{To record processing history, not yet in use }
    \item{\code{legend}:}{Object of class \code{.RasterLegend}, Default legend. Should store preferences for plotting. Not yet implemented except that it stores the color table of images, if available}
    \item{\code{extent}:}{Object of \code{\link[raster]{Extent-class}} }
    \item{\code{ncols}:}{Integer} 
    \item{\code{nrows}:}{Integer} 
    \item{\code{crs}:}{Object of class \code{"CRS"}, i.e. the coordinate reference system. In Spatial* objects this slot is called 'proj4string' }
  }

}

\examples{
# load required data
data(cat_ls)

# set \code{cat_ls} to object of class winmove
new("winmove", cat_ls)

}
