# output.R
# Load necessary libraries
library(dplyr)
library(knitr)
library(ggplot2)
library(here)

# Load the sleepstudy dataset
file_path <- here::here("sleepstudy.txt")  
sleep_data <- read.table(file_path, header = TRUE, sep = "")

# Tabular Analysis: Summarize key variables related to sleep and mental health
summary_table <- sleep_data %>%
  select(GPA, PoorSleepQuality, DepressionScore, AnxietyScore, StressScore, AverageSleep) %>%
  summary()

# Save summary table to an RDS file
saveRDS(summary_table, file = here::here("output", "summary_table.rds"))

# Graphical Analysis: Create scatter plot of AverageSleep vs StressScore
plot <- ggplot(sleep_data, aes(x = AverageSleep, y = StressScore)) +
  geom_point() +
  geom_smooth(method = "lm", se = FALSE, color = "blue") +
  theme_minimal() +
  labs(title = "Relationship between Average Sleep and Stress Score",
       x = "Average Sleep (hours)",
       y = "Stress Score")

ggsave(filename = here::here("output", "stress_sleep_plot.png"), plot = plot, width = 8, height = 6)