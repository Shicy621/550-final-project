
# A Study of the Relationship Between College Students' Sleeping Habits and Mental Health

## Project Description

The purpose of this project is to study the relationship between sleep habits and mental health (including stress, anxiety, and depression) among college students. The dataset `sleepstudy.txt` contains multiple variables on sleep patterns, academic performance, and mental health indicators of college students. The purpose of this analysis is to reveal the potential impact of sleep habits on mental health.

## File Structure

1. **report.Rmd**: The main analysis code file containing data loading, descriptive analysis, table generation, and visualization.
2. **report.html**: The final generated report file, containing the complete analysis and visualization results.
3. **sleepstudy.txt**: Data file containing information about sleep and mental health of college students.
4. **code/output.R**: R script file that generates descriptive statistics and saves the summary table as an RDS file, and saves the scatter plot as a PNG file.
5. **code/render.R**: R script file that renders `report.Rmd` to produce the final HTML report.
6. **output/summary_table.rds**: RDS file containing summary statistics for key variables.
7. **output/stress_sleep_plot.png**: PNG file of the scatter plot showing the relationship between average sleep and stress scores.
8. **Makefile**: File containing instructions for building the final report and managing dependencies.
9. **README.md**: This file, which describes the contents of the repository and how to generate the final report.

## Generate the Final Report

To generate the final report `report.html`, make sure you have installed the required R packages. Run the following command in the terminal to generate the report:

```bash
make
```

The `Makefile` will first run `output.R` to produce intermediate files (`summary_table.rds` and `stress_sleep_plot.png`) in the `output` folder, and then use `render.R` to generate the final HTML report.

If you need to clean up the generated files, run the following command:

```bash
make clean
```

## Project Dependencies

This project depends on the following R packages:

1. **dplyr**: for data cleaning and transformation
2. **knitr**: for table display
3. **ggplot2**: for data visualization
4. **rmarkdown**: for rendering the R Markdown file
5. **here**: for managing file paths

The required packages can be installed using the following command:

```r
install.packages(c("dplyr", "knitr", "ggplot2", "rmarkdown", "here"))
```

## Report Contents

The final report `report.html` contains the following:

1. **Data Loading**: Loads the `sleepstudy.txt` dataset.
2. **Descriptive Analysis**: Statistically describes the variables GPA, Sleep Quality Score, Depression Score, Anxiety Score, Stress Score, and Mean Hours of Sleep.
3. **Table Generation**: Generates descriptive statistical tables to present summary information on key variables.
4. **Visualization and Analysis**: Uses scatter plots to show the relationship between mean sleep duration and stress score, and shows the trend by linear fitting.

## Table and Chart Generation Code Location

1. **Table Generation Code**: The table generation code is located in `code/output.R`. This section uses `dplyr` and `knitr::kable()` to generate descriptive statistics tables and saves the result as `summary_table.rds` in the `output` folder.
2. **Chart Generation Code**: The chart generation code is also located in `code/output.R`. This section uses `ggplot2` to plot a scatterplot showing the relationship between average hours of sleep and stress scores, and saves it as `stress_sleep_plot.png` in the `output` folder.

## How To Use Makefile

The`Makefile`automates the process of generating the final report and managing dependencies. Below are the available targets and instructions for their usage.

## Default Target

The default target is `all`, which generates the final report by running the entire pipeline (generating intermediate files and rendering the final HTML report). Run the following command to execute the default target:

```bash
make
```

This command will:

1.Generate the summary table (`summary_table.rds`) and scatter plot (`stress_sleep_plot.png`) by executing `output.R`.
2. Use `render.R` to render `FinalProject2.Rmd` and produce the final report (`FinalProject2.html`).

## Clean the Output Directory
To remove all generated files in the `output` directory, run:
```bash
make clean
```
This will delete the intermediate and final outputs, including `.rds`, `.png`, and `.html` files.

## Using Docker
If you prefer to run the pipeline inside a Docker container for reproducibility, use the following `Makefile` targets.

1. **Build the Docker Image**
To build the Docker image, run:
```bash
make docker-build
```

2. **Run the Docker Container**
To execute the pipeline inside the Docker container and generate the report, run:
```bash
make docker-run
```

3. **Combined Build and Run**
To combine the Docker build and run processes into one step, use:
```bash
make docker
````

4. **Clean the Docker Environment**
To clean both the `output` directory and the Docker image, run:


## Compatibility Considerations

**For Windows Users**
If you are using Git Bash on Windows, Docker requires an extra `/` at the start of mounted file paths. The `Makefile` is designed to handle this for cross-platform compatibility. However, if you encounter issues, manually run the following command to mount the `output` directory correctly:
```bash
docker run --rm -v "/$(PWD)/output:/project/output" final
```
**For Mac/Linux Users**
The `Makefile` is fully compatible with Mac and Linux systems. Run the make commands directly as described in the sections above.

























