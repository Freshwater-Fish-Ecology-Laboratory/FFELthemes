# FFELthemes
Customize plots using the FFEL colour scheme

To Do:
- Develop colour palettes and test them on different types of plots (e.g., maps, heatplots, etc.)
- ??

Development flow:
- adjust functions and vignette
- devtools::document() to update documentation and NAMESPACE
- devtools::build_vignette() to knit vignette and create html output in the docs folder
- devtools::load_all() to load your package and test functions (run examples, test documentation [?function], etc.)
- devtools::check() to see whether your adjustments cause structural issues (e.g., the DESCRIPTION file needs to be edited)
