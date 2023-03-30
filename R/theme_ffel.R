#' @title Custom FFEL \pkg{ggplot2} theme
#'
#' @description Applies a custom FFEL theme to a \pkg{ggplot2} object.
#' @param base_size Base font size of plot text.
#' @details This custom theme adjusts a \pkg{ggplot2} object to create report-ready plots. Font sizing is appropriate for a plot approximately 6" square, or similar. For larger or smaller plots, use \emph{base_size} to adjust the font size as necessary to create plots with readable text. All theme adjustments can be over-ridden with subsequent \code{\link{theme}} statements.
#' @examples
#' ggplot(mtcars, aes(mpg, disp)) +
#'   geom_point() +
#'   theme_ffel()
#' @import ggplot2
#' @export


theme_ffel <- function(base_size = 16) {

  theme_bw(base_size = base_size,
                    base_family = "sans") +
    theme(
      panel.background = element_blank(),
      legend.background = element_rect(fill = "transparent",
                                                colour = NA),
      legend.key = element_rect(fill = "transparent",
                                         colour = NA),
      legend.position = "right",
      legend.justification = c(1, 1),
      legend.title = element_blank(),
      legend.text = element_text(size = rel(0.8)),
      axis.text = element_text(size = rel(0.8)),
      axis.title = element_text(size = rel(1)),
      strip.background = element_rect(fill = NA),
      strip.text = element_text(size = rel(1)),
      panel.grid.major = element_blank(),
      panel.grid.minor = element_blank()
    )

}
