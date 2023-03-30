# FFELthemes
Customize plots using the FFEL colour scheme

## To Do:
- Develop colour palettes and test them on different types of plots (e.g., maps, heatplots, etc.)
- ??

## Development flow:
- adjust functions and vignette
- devtools::document() to update documentation and NAMESPACE
- devtools::build_vignette() to knit vignette and create html output in the docs folder
- devtools::load_all() to load your package and test functions (run examples, test documentation [?function], etc.)
- devtools::check() to see whether your adjustments cause structural issues (e.g., the DESCRIPTION file needs to be edited)

## Installing the Package from GitHub
- you can install a package on your computer (https://kbroman.org/pkg_primer/pages/build.html) but it is better for a collaborative package to develop the package, update GitHub, then install the package from GitHub
- devtools::install_github("Freshwater-Fish-Ecology-Laboratory/FFELthemes") 
- now you can use the package in any scripts using library(FFELthemes)
- don't forget to re-install the package frequently if it's under active development, and let people know when you've made improvements worthy of a new installation
