# render.R
# Load necessary library
library(rmarkdown)
library(here)

# Render the report
rmarkdown::render(
  input = here::here("FinalProject2.Rmd"),
  output_file = here::here("FinalProject2.html")
)
