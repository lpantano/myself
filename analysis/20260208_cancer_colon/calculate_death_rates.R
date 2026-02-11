# Calculate Death Rates per 100,000 Population
# This script merges cancer deaths with population data and calculates rates

library(tidyverse)
library(ggprism)
library(scales)

cat("Starting death rate calculation...\n\n")

# 1. Load cancer death data
cat("Loading cancer death data...\n")
cancer_data <- read_delim("cancer 02082026.xls",
                          delim = "\t",
                          quote = "\"",
                          show_col_types = FALSE)

cancer_clean <- cancer_data %>%
  filter(!is.na(State), State != "State", !is.na(Deaths)) %>%
  mutate(
    Deaths = as.numeric(Deaths),
    Age_Group = factor(`Age Group Code`,
                      levels = c("45-49", "50-54", "55-59", "60-64",
                                "65-69", "70-74", "75-79", "80-84", "85+"),
                      ordered = TRUE),
    Sex = factor(Sex, levels = c("Female", "Male")),
    Year = as.numeric(Year)
  )

cat("Cancer data loaded:", nrow(cancer_clean), "rows\n\n")

# 2. Load population data
cat("Loading population data...\n")

if (!file.exists("population_clean.csv")) {
  cat("ERROR: population_clean.csv not found!\n\n")
  cat("Please run: Rscript process_population_data.R first\n\n")
  stop("Population data not processed")
}

pop_data <- read_csv("population_clean.csv", show_col_types = FALSE)

cat("Population data loaded:", nrow(pop_data), "rows\n\n")

# 3. Merge cancer and population data
cat("Merging cancer deaths with population...\n")

# Ensure age groups match
cancer_clean <- cancer_clean %>%
  mutate(Age_Group_Code = as.character(Age_Group))

pop_data <- pop_data %>%
  mutate(Age_Group_Code = as.character(Age_Group))

# Merge
data_merged <- cancer_clean %>%
  left_join(pop_data,
            by = c("State", "Year", "Sex", "Age_Group_Code" = "Age_Group_Code"))

# Check merge success
missing_pop <- data_merged %>%
  filter(is.na(Population))

if (nrow(missing_pop) > 0) {
  cat("WARNING:", nrow(missing_pop), "rows missing population data\n")
  cat("First few missing:\n")
  print(head(missing_pop %>% select(State, Year, Sex, Age_Group_Code)))
  cat("\n")
}

# 4. Calculate death rates per 100,000
cat("Calculating death rates per 100,000 population...\n\n")

data_rates <- data_merged %>%
  filter(!is.na(Population), Population > 0) %>%
  mutate(
    Death_Rate_Per_100k = (Deaths / Population) * 100000
  )

# 5. Calculate average rates across years
data_summary <- data_rates %>%
  group_by(State, Age_Group, Sex) %>%
  summarise(
    Mean_Deaths = mean(Deaths, na.rm = TRUE),
    Mean_Population = mean(Population, na.rm = TRUE),
    Mean_Rate = mean(Death_Rate_Per_100k, na.rm = TRUE),
    Total_Deaths = sum(Deaths, na.rm = TRUE),
    .groups = "drop"
  )

# Save for future use
write_csv(data_rates, "cancer_deaths_with_rates.csv")
write_csv(data_summary, "cancer_death_rates_summary.csv")

cat("Data saved:\n")
cat("  - cancer_deaths_with_rates.csv (all years)\n")
cat("  - cancer_death_rates_summary.csv (averages)\n\n")

# 6. Create visualizations with normalized rates
cat("Creating visualizations...\n")

# Select top states by total deaths for clearer visualization
top_states <- data_summary %>%
  group_by(State) %>%
  summarise(Total = sum(Total_Deaths)) %>%
  arrange(desc(Total)) %>%
  slice_head(n = 12) %>%
  pull(State)

data_plot <- data_summary %>%
  filter(State %in% top_states)

# Plot 1: Death rates per 100,000 (normalized)
p1 <- ggplot(data_plot, aes(x = Age_Group, y = Mean_Rate, fill = Sex)) +
  geom_bar(stat = "identity", position = position_dodge(width = 0.8), width = 0.7) +
  facet_wrap(~ State, ncol = 4, scales = "free_y") +
  scale_fill_manual(
    values = c("Female" = "#E64B35", "Male" = "#4DBBD5"),
    labels = c("Female", "Male")
  ) +
  scale_y_continuous(expand = expansion(mult = c(0, 0.05))) +
  labs(
    title = "Colon Cancer Death Rates by Age and Sex",
    subtitle = "Deaths per 100,000 population (average 2018-2023)",
    x = "Age Group (years)",
    y = "Death Rate per 100,000",
    fill = "Sex"
  ) +
  theme_prism(base_size = 11) +
  theme(
    axis.text.x = element_text(angle = 45, hjust = 1, size = 9),
    strip.text = element_text(face = "bold", size = 10),
    strip.background = element_rect(fill = "grey90"),
    legend.position = "top",
    plot.title = element_text(face = "bold", size = 14),
    plot.subtitle = element_text(color = "grey30", size = 11),
    panel.spacing = unit(1, "lines")
  )

ggsave("figures/death_rates_normalized_by_population.png",
       plot = p1,
       width = 16,
       height = 12,
       dpi = 300,
       bg = "white")

cat("  ✓ figures/death_rates_normalized_by_population.png\n")

# Plot 2: Comparison - absolute deaths vs rates
data_plot_long <- data_plot %>%
  select(State, Age_Group, Sex, Mean_Deaths, Mean_Rate) %>%
  pivot_longer(cols = c(Mean_Deaths, Mean_Rate),
               names_to = "Metric",
               values_to = "Value") %>%
  mutate(
    Metric = factor(Metric,
                   levels = c("Mean_Deaths", "Mean_Rate"),
                   labels = c("Absolute Deaths", "Rate per 100k"))
  )

p2 <- ggplot(data_plot_long %>% filter(State %in% top_states[1:6]),
             aes(x = Age_Group, y = Value, fill = Sex)) +
  geom_bar(stat = "identity", position = position_dodge(width = 0.8), width = 0.7) +
  facet_grid(Metric ~ State, scales = "free_y") +
  scale_fill_manual(values = c("Female" = "#E64B35", "Male" = "#4DBBD5")) +
  scale_y_continuous(expand = expansion(mult = c(0, 0.05))) +
  labs(
    title = "Absolute Deaths vs Population-Normalized Rates",
    subtitle = "Comparison across 6 states",
    x = "Age Group",
    y = "Value",
    fill = "Sex"
  ) +
  theme_prism(base_size = 10) +
  theme(
    axis.text.x = element_text(angle = 45, hjust = 1, size = 8),
    strip.text = element_text(face = "bold", size = 9),
    legend.position = "top"
  )

ggsave("figures/comparison_absolute_vs_normalized.png",
       plot = p2,
       width = 16,
       height = 8,
       dpi = 300,
       bg = "white")

cat("  ✓ figures/comparison_absolute_vs_normalized.png\n\n")

# 7. Summary statistics
cat("=== SUMMARY STATISTICS ===\n\n")

# Overall average rate by sex
overall_rates <- data_rates %>%
  group_by(Sex) %>%
  summarise(
    Avg_Rate = weighted.mean(Death_Rate_Per_100k, Population, na.rm = TRUE),
    Total_Deaths = sum(Deaths, na.rm = TRUE),
    Total_Population = sum(Population, na.rm = TRUE)
  )

cat("Overall death rates by sex (weighted average):\n")
print(overall_rates)
cat("\n")

# Highest risk age groups
high_risk <- data_summary %>%
  group_by(Age_Group) %>%
  summarise(Mean_Rate = mean(Mean_Rate, na.rm = TRUE)) %>%
  arrange(desc(Mean_Rate))

cat("Death rates by age group (average across all states):\n")
print(high_risk)
cat("\n")

# States with highest and lowest rates
state_rates <- data_summary %>%
  group_by(State) %>%
  summarise(Mean_Rate = mean(Mean_Rate, na.rm = TRUE)) %>%
  arrange(desc(Mean_Rate))

cat("Top 10 states by death rate:\n")
print(head(state_rates, 10))
cat("\n")

cat("Bottom 10 states by death rate:\n")
print(tail(state_rates, 10))
cat("\n")

cat("=== ANALYSIS COMPLETE ===\n")
cat("All figures saved to figures/ directory\n")
