#' @title Define FFEL Colours
#' @description Any colour adjustments or additions must be done in this vector.
#' @examples
#' scales::show_col(ffel_colours)
#' @export

ffel_colours <- c(
  'metalic blue' = "#275F73",
  'maize' = "#FFC745",
  'pale cyan' = "#8AE0FF",
  'sepia' = "#73491C")


#' @title Extract FFEL Colours
#'
#' @description Extract FFEL colours as hex codes.
#' @param ... Character name of one or more colours from \code{\link{ffel_colours}}.
#' @details Returns a character vector of hex codes for each of the colour names specified. Allows the user to select colours for plotting, change the order of colours, and manually adjust \pkg{ggplot2} plot colours.
#' @examples
#' ffel_cols()
#' ffel_cols(c("maize", "sepia"))
#'
#' ggplot(mtcars, aes(hp, mpg)) +
#'   geom_point(color = ffel_cols("metalic blue"),
#'              size = 3) +
#'   theme_ffel()
#' @export

ffel_cols <- function(...) {
  cols <- c(...)

  if (is.null(cols))
    return(ffel_colours)

  ffel_colours[cols]
}


#' @title Define FFEL Palettes
#' @description Palettes must be created using the colours in \code{\link{ffel_colours}}.
#' @export
ffel_palettes <- list(
  'main' = ffel_cols(),
  'two' = ffel_cols("pale cyan", "maize"),
  'blues' = ffel_cols("metalic blue", "pale cyan")
)

#' @title Generate FFEL Palettes
#'
#' @description Generate palettes of any number of colours using the base palettes in \code{\link{ffel_palettes}}.
#' @param palette Name of palette.
#' @param ... Additional arguments
#' @details Returns a \code{\link{colorRampPalette}} function that creates a vector of colours based on the specified palette. Additional colours are interpolated if the number of colours in the palette is smaller than the number of colours required.

ffel_pal <- function(palette = "main", ...) {

  pal <- ffel_palettes[[palette]]

  grDevices::colorRampPalette(pal, ...)
}


#' @title Fill Scale Constructor for FFEL Colours
#'
#' @description Apply a custom FFEL colour palette to a \pkg{ggplot2} fill object.
#' @param palette Character name of palette from \code{\link{ffel_palettes}}
#' @param discrete If TRUE, palette is discrete, if FALSE, palette is continuous
#' @param ... Additional arguments passed to \code{\link{discrete_scale}} when \emph{discrete = TRUE} or \code{\link{scale_color_gradientn}} when \emph{discrete = FALSE}.
#' @details A colour palette based on the FFEL colours. When discrete is FALSE and there are more categories than in the palette, a gradient will be generated.
#' @examples
#' ggplot(mpg, aes(manufacturer, fill = manufacturer)) +
#'   geom_bar() +
#'   scale_fill_ffel(palette = "main") +
#'   theme_ffel() +
#'   theme(axis.text.x = element_text(angle = 45, hjust = 1))
#'
#' ggplot(mtcars, aes(as.factor(carb), fill = as.factor(carb))) +
#'   geom_bar() +
#'   scale_fill_ffel() +
#'   theme_ffel()
#' @export

scale_fill_ffel <- function(palette = "main", discrete = TRUE, ...) {

  pal <- ffel_pal(palette = palette)

  if (discrete) {
    ggplot2::discrete_scale("fill", paste0("ffel_", palette), palette = pal, ...)
  } else {
    ggplot2::scale_fill_gradientn(colours = pal(256), ...)
  }
}


#' @title Colour Scale Constructor for FFEL Colours
#'
#' @description Apply a custom FFEL colour palette to a \pkg{ggplot2} colour object.
#' @param palette Character name of palette from \code{\link{ffel_palettes}}
#' @param discrete If TRUE, palette is discrete, if FALSE, palette is continuous
#' @param ... Additional arguments passed to \code{\link{discrete_scale}} when \emph{discrete = TRUE} or \code{\link{scale_color_gradientn}} when \emph{discrete = FALSE}.
#' @details A colour palette based on the FFEL colours. When discrete is FALSE and there are more categories than in the palette, a gradient will be generated.
#' @examples
#' ggplot(mtcars, aes(x = wt, y = mpg, colour = as.factor(carb))) +
#'     geom_point(size = 4) +
#'     scale_colour_ffel() +
#'     theme_ffel()
#'
#' ggplot(iris, aes(Sepal.Width, Sepal.Length, color = Sepal.Length)) +
#'   geom_point(size = 4) +
#'   scale_colour_ffel(discrete = FALSE, palette = "two") +
#'   theme_ffel()
#' @export

scale_colour_ffel <- function(palette = "main", discrete = TRUE, ...) {

  pal <- ffel_pal(palette = palette)

  if (discrete) {
    ggplot2::discrete_scale("colour",
                            paste0("ffel_", palette),
                            palette = pal, ...)
  } else {
    ggplot2::scale_color_gradientn(colours = pal(256), ...)
  }
}
