# Colon Cancer Visualization with Simple Population Normalization
# Uses broad age group (45-64) for normalization

library(tidyverse)
library(ggprism)
library(scales)

cat("Loading data for 2023...\n\n")

# 1. Load cancer data for 2023, ages 45-64
cancer_data <- read_delim("cancer 02082026.xls",
                          delim = "\t",
                          quote = "\"",
                          show_col_types = FALSE)

cancer_clean <- cancer_data %>%
  filter(!is.na(State), State != "State", !is.na(Deaths)) %>%
  mutate(
    Deaths = as.numeric(Deaths),
    Age_Group = `Age Group Code`,
    Sex = factor(Sex, levels = c("Female", "Male")),
    Year = as.numeric(Year)
  ) %>%
  filter(
    Year == 2023,
    Age_Group %in% c("45-49", "50-54", "55-59", "60-64")
  )

# Sum deaths across all ages 45-64 by state and sex
cancer_summary <- cancer_clean %>%
  group_by(State, Sex) %>%
  summarise(
    Total_Deaths = sum(Deaths, na.rm = TRUE),
    .groups = "drop"
  )

cat("Cancer data loaded:", nrow(cancer_summary), "state-sex combinations\n")

# 2. Load population data
if (!file.exists("population_states_2023_broad.csv")) {
  cat("\nProcessing population data first...\n")
  source("process_population_simple.R")
}

pop_data <- read_csv("population_states_2023_broad.csv", show_col_types = FALSE)

cat("Population data loaded:", nrow(pop_data), "states\n\n")

# 3. Prepare population data by sex
# Approximate 50/50 split of 45-64 population by sex
pop_by_sex <- pop_data %>%
  mutate(
    Female_45_64 = Pop_45_64 * (Female_Population / Total_Population),
    Male_45_64 = Pop_45_64 * (Male_Population / Total_Population)
  ) %>%
  select(State, Female_45_64, Male_45_64) %>%
  pivot_longer(
    cols = c(Female_45_64, Male_45_64),
    names_to = "Sex_Pop",
    values_to = "Population"
  ) %>%
  mutate(
    Sex = factor(
      str_replace(Sex_Pop, "_45_64", ""),
      levels = c("Female", "Male")
    )
  ) %>%
  select(State, Sex, Population)

# 4. Merge cancer and population data
data_merged <- cancer_summary %>%
  left_join(pop_by_sex, by = c("State", "Sex"))

# Check for missing population
missing <- data_merged %>% filter(is.na(Population))
if (nrow(missing) > 0) {
  cat("WARNING:", nrow(missing), "rows missing population data\n")
  cat("Missing states:\n")
  print(unique(missing$State))
  cat("\n")
}

# 5. Calculate death rates per 100,000
data_rates <- data_merged %>%
  filter(!is.na(Population), Population > 0) %>%
  mutate(
    Death_Rate_Per_100k = (Total_Deaths / Population) * 100000
  )

cat("Calculated death rates for", nrow(data_rates), "state-sex combinations\n\n")

# 6. Create visualization - Ages 45-64 combined
# States on X-axis, bars for Female/Male

p1 <- ggplot(data_rates, aes(x = reorder(State, Death_Rate_Per_100k, FUN = mean),
                              y = Death_Rate_Per_100k, fill = Sex)) +
  geom_bar(stat = "identity", position = position_dodge(width = 0.8), width = 0.7) +
  scale_fill_manual(
    values = c("Female" = "#E64B35", "Male" = "#4DBBD5")
  ) +
  scale_y_continuous(expand = expansion(mult = c(0, 0.05))) +
  labs(
    title = "Colon Cancer Death Rates: Ages 45-64 by State (2023)",
    subtitle = "Death rates per 100,000 population | States ordered by average rate",
    x = "State",
    y = "Death Rate per 100,000",
    fill = "Sex"
  ) +
  theme_prism(base_size = 10) +
  theme(
    axis.text.x = element_text(angle = 90, hjust = 1, vjust = 0.5, size = 7),
    legend.position = "top",
    plot.title = element_text(face = "bold", size = 14),
    plot.subtitle = element_text(color = "grey30", size = 10)
  )

ggsave("figures/rates_45_64_combined_2023.png",
       plot = p1,
       width = 18,
       height = 8,
       dpi = 300,
       bg = "white")

cat("✓ Saved: figures/rates_45_64_combined_2023.png\n")

# 7. Alternative: Absolute deaths (not normalized)
p2 <- ggplot(data_rates, aes(x = reorder(State, Total_Deaths, FUN = mean),
                              y = Total_Deaths, fill = Sex)) +
  geom_bar(stat = "identity", position = position_dodge(width = 0.8), width = 0.7) +
  scale_fill_manual(
    values = c("Female" = "#E64B35", "Male" = "#4DBBD5")
  ) +
  scale_y_continuous(expand = expansion(mult = c(0, 0.05))) +
  labs(
    title = "Colon Cancer Deaths: Ages 45-64 by State (2023)",
    subtitle = "Absolute death counts | States ordered by total deaths",
    x = "State",
    y = "Total Deaths",
    fill = "Sex"
  ) +
  theme_prism(base_size = 10) +
  theme(
    axis.text.x = element_text(angle = 90, hjust = 1, vjust = 0.5, size = 7),
    legend.position = "top",
    plot.title = element_text(face = "bold", size = 14)
  )

ggsave("figures/deaths_45_64_combined_2023.png",
       plot = p2,
       width = 18,
       height = 8,
       dpi = 300,
       bg = "white")

cat("✓ Saved: figures/deaths_45_64_combined_2023.png\n\n")

# 8. Summary statistics
cat("=== SUMMARY: AGES 45-64 (2023) ===\n\n")

# Overall by sex
sex_summary <- data_rates %>%
  group_by(Sex) %>%
  summarise(
    Mean_Rate = mean(Death_Rate_Per_100k, na.rm = TRUE),
    Median_Rate = median(Death_Rate_Per_100k, na.rm = TRUE),
    Total_Deaths = sum(Total_Deaths, na.rm = TRUE),
    Total_Population = sum(Population, na.rm = TRUE)
  )

cat("Overall by sex:\n")
print(sex_summary)
cat("\n")

# Top 10 states by death rate
top_states <- data_rates %>%
  group_by(State) %>%
  summarise(Avg_Rate = mean(Death_Rate_Per_100k)) %>%
  arrange(desc(Avg_Rate))

cat("Top 10 states by death rate (ages 45-64):\n")
print(head(top_states, 10))
cat("\n")

cat("Bottom 10 states by death rate (ages 45-64):\n")
print(tail(top_states, 10))
cat("\n")

# Save summary data
write_csv(data_rates, "cancer_rates_45_64_2023.csv")
cat("✓ Data saved: cancer_rates_45_64_2023.csv\n\n")

cat("=== COMPLETE ===\n")
cat("\nNote: This analysis uses combined ages 45-64.\n")
cat("For detailed 5-year age groups, download data from CDC WONDER.\n")
