# Makefile for building the final report

# Define variables
RMD = FinalProject2.Rmd
OUTPUT = FinalProject2.html
CODE_DIR = code
OUTPUT_DIR = output

# Default target to build the report
all: $(OUTPUT)

# Rule to render the R Markdown file and build the report
$(OUTPUT): $(RMD) $(CODE_DIR)/render.R $(OUTPUT_DIR)/summary_table.rds $(OUTPUT_DIR)/stress_sleep_plot.png
		Rscript $(CODE_DIR)/render.R

# Rule to generate output files (summary table and plot)
$(OUTPUT_DIR)/summary_table.rds $(OUTPUT_DIR)/stress_sleep_plot.png: $(CODE_DIR)/output.R
		Rscript $(CODE_DIR)/output.R

# Clean up generated files
clean:
		rm -f $(OUTPUT_DIR)/*.rds $(OUTPUT_DIR)/*.png $(OUTPUT)

# Phony targets
.PHONY: all clean

# install
.PHONY: install
install:
  Rscript -e "renv::restore(prompt = FALSE)"
  
 # Rule to build the Docker image
docker-build:
		docker build -t final .

# Rule to run the Docker container and generate the report
docker-run:
		docker run --rm -v $(PWD)/output:/project/output final

# Rule to create the output directory if it doesn't exist
create-output-dir:
		mkdir -p $(OUTPUT_DIR)

# Combined rule to build and run in Docker
docker: create-output-dir docker-build docker-run

# Clean up the output directory and remove Docker container artifacts
docker-clean:
		rm -rf $(OUTPUT_DIR)/*
		docker image rm final --force

# Phony targets to prevent conflicts with file names
.PHONY: docker-build docker-run create-output-dir docker docker-clean


