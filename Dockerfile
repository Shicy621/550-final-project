# Step 1: Use the Rocker base image for R
FROM rocker/r-ver:4.4.1

# Step 2: Install necessary system dependencies
RUN apt-get update && apt-get install -y \
    pandoc \
    libfontconfig1-dev \
    libharfbuzz-dev \
    libfribidi-dev \
    libprotobuf-dev \
    libgeos-dev \
    libudunits2-dev \
    libgdal-dev \
    libproj-dev \
    && apt-get clean

# Step 3: Set the working directory inside the container
WORKDIR /project

# Step 4: Copy project files into the container
COPY code/ code/
COPY output/ output/
COPY renv/ renv/
COPY FinalProject2.Rmd .
COPY sleepstudy.txt .
COPY renv.lock .
COPY .Rprofile .

# Step 5: Restore the R environment using renv
RUN Rscript -e "renv::restore(prompt = FALSE)"

# Step 6: Default command to render the R Markdown file
CMD ["Rscript", "-e", "rmarkdown::render('FinalProject2.Rmd')"]