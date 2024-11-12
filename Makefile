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
