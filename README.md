
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
