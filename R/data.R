#' Example continuous raster (fine_dat)
#'
#' An example map to show functionality on continuous surfaces.
#'
#' @details Generated with \code{nlm_mpd()} from \code{NLMR}.
#'
#' @format A raster layer object.
#' @source Sciaini M, Fritsch M, Scherer C, Simpkins CE. NLMR and landscapetools: An integrated environment
#'     for simulating and modifying neutral landscape models in R. Methods in Ecology and Evolution. 2018;
#'     00:1-9. https://doi.org/10.1111/2041-210X.13076
"cont_ls"

#' Example categorical raster (fine_dat)
#'
#' An example map to show functionality on categorical surfaces.
#'
#' @details Generated with \code{nlm_mpd()} from \code{NLMR} and classified with \code{util_classify()} from \code{landscapetools}.
#'
#' @format A raster layer object.
#' @source Sciaini M, Fritsch M, Scherer C, Simpkins CE. NLMR and landscapetools: An integrated environment
#'     for simulating and modifying neutral landscape models in R. Methods in Ecology and Evolution. 2018;
#'     00:1-9. https://doi.org/10.1111/2041-210X.13076
#' @source Marco Sciaini and Matthias Fritsch (2018). landscapetools: Landscape Utility Toolbox. R package version 0.4.0.
#'     https://CRAN.R-project.org/package=landscapetools
"cat_ls"

#' Example grid (coarse_dat)
#'
#' An example grid to show functionality when aggregating using an sf object.
#'
#' @details Generated with \code{nlm_mpd()} and converted to sf.
#'
#' @format An sf object.
#' @source Sciaini M, Fritsch M, Scherer C, Simpkins CE. NLMR and landscapetools: An integrated environment
#'     for simulating and modifying neutral landscape models in R. Methods in Ecology and Evolution. 2018;
#'     00:1-9. https://doi.org/10.1111/2041-210X.13076
"g_sf"

#' Example polygon (coarse_dat)
#'
#' An example non-gridded coarse data to show functionality when aggregating using an sf object.
#'
#' @details Generated with \code{sf::st_make_grid(sf::st_as_sfc(sf::st_bbox(cont_ls)), cellsize = 13, square = FALSE)}
#'
#' @format An sf object.
"poly_sf"
