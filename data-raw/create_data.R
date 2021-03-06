library(tidyverse)

# create fine data
cont_ls <- NLMR::nlm_mpd(65, 65, roughness = 0.9)
cat_ls <- landscapetools::util_classify(cont_ls, weighting = c(0.25, 0.25, 0.25, 0.25))

# create coarse data
g_sf <- sf::st_bbox(cont_ls) %>% 
  sf::st_as_sfc() %>% 
  sf::st_buffer(-5) %>% 
  sf::st_make_grid(cellsize = 11, square = TRUE) %>% 
  sf::st_sf()

g_sp <- as(g_sf, "Spatial")

g_raster <- raster::crop(cont_ls, g_sf) %>% 
  raster::aggregate(11)

raster::values(g_raster) <- 1

poly_sf <- sf::st_bbox(cont_ls) %>% 
  sf::st_as_sfc() %>% 
  sf::st_buffer(-10) %>% 
  sf::st_make_grid(cellsize = 5, square = FALSE) %>% 
  sf::st_sf()

# data for testing output still the same
nm_agg_shei <- nomove_agg(g_sf, cat_ls, shei, lc_class = 1:4)

nm_agg_mean <- nomove_agg(g_raster, cont_ls, mean)

nm_agg_prop <- nomove_agg(g_sp, cat_ls, prop, lc_class = 1)

nm_agg_range <- nomove_agg(poly_sf, cont_ls, var_range, is_grid = FALSE)

nm_agg_shdi <- nomove_agg(coarse_dat = g_sf, 
           fine_dat = cat_ls, 
           agg_fun = shdi, 
           lc_class = 1:3)

fn <- function(x, na.rm = TRUE) {
  sum(2*x)
}

nm_agg_user <- nomove_agg(g_sp, 
                          cat_ls, 
                          fn)

wm_agg_shei <- winmove_agg(g_sf, 
                           cat_ls, 
                           12, 
                           "rectangle", 
                           shei, 
                           lc_class = 1:4)

wm_agg_shdi <- winmove_agg(coarse_dat = g_sf, 
                           fine_dat = cat_ls, 
                           d = 3, 
                           type = "circle", 
                           win_fun = shdi,
                           lc_class = 1:4)

wm_agg_range <- winmove_agg(coarse_dat = poly_sf, 
                            fine_dat = cont_ls, 
                            d = 3, 
                            type = "rectangle", 
                            win_fun = var_range,
                            is_grid = FALSE)

wm_agg_mean <- winmove_agg(poly_sf, 
                           cont_ls, 
                           4, 
                           "rectangle", 
                           mean, 
                           var, 
                           is_grid = FALSE)

wm_shei_dat <- winmove(cat_ls, 
                       5, 
                       "rectangle", 
                       shei, 
                       lc_class = 1:4)

wm_mean_dat <- winmove(cont_ls, 
                       2, 
                       "rectangle", 
                       mean)

user_fn <- function(x, lc_class, ...) {
  return(sum(x == lc_class))
}
wm_user_dat <- winmove(cat_ls, 4, "rectangle", user_fn, lc_class = 2)

torus_5 <- create_torus(cat_ls, 5)
torus_20 <- create_torus(cont_ls, 20)

# data for examples
usethis::use_data(cont_ls, 
                  cat_ls, 
                  g_sf, 
                  poly_sf, 
                  overwrite = TRUE, 
                  compress = "bzip2")

# internal data
usethis::use_data(g_raster, 
                  g_sp, 
                  nm_agg_shei, 
                  nm_agg_shdi, 
                  nm_agg_mean, 
                  nm_agg_prop, 
                  nm_agg_range, 
                  nm_agg_user, 
                  wm_agg_shei, 
                  wm_agg_shdi, 
                  wm_agg_range, 
                  wm_agg_mean, 
                  wm_shei_dat, 
                  wm_mean_dat, 
                  wm_user_dat, 
                  torus_5, 
                  torus_20, 
                  internal = TRUE, 
                  overwrite = TRUE, 
                  compress = "bzip2")

