# Process Simple Population Data
# This uses the available population file with broad age groups
# NOTE: This file has "45-64" as one group, not broken down by 5-year intervals

library(tidyverse)

cat("Processing population data from CSV file...\n\n")

# Read the population file
pop_file <- "Population-by-Age-and-Sex/Population by Age and Sex - US, States, Counties.csv"

if (!file.exists(pop_file)) {
  cat("ERROR: Population file not found at:", pop_file, "\n")
  stop("File not found")
}

pop_data <- read_csv(pop_file, show_col_types = FALSE)

cat("Population data loaded\n")
cat("Columns:", paste(names(pop_data), collapse = ", "), "\n\n")

# Filter for state-level data (Countyfips == "000") and year 2023
pop_states_2023 <- pop_data %>%
  filter(
    Countyfips == "000",  # State level only
    Year == 2023,
    Description != "U.S."  # Exclude US total
  ) %>%
  select(
    State = Description,
    Year,
    Total_Population = `Total Population`,
    Pop_45_64 = `Population 45-64`,
    Pop_65_Plus = `Population 65+`,
    Male_Population = `Male Population`,
    Female_Population = `Female Population`
  )

cat("States found:", nrow(pop_states_2023), "\n")
cat("Year: 2023\n\n")

# Show sample
cat("Sample data:\n")
print(head(pop_states_2023, 10))
cat("\n")

# Save processed data
write_csv(pop_states_2023, "population_states_2023_broad.csv")

cat("✓ Saved: population_states_2023_broad.csv\n\n")

cat("=== IMPORTANT NOTE ===\n")
cat("This population file has broad age groups:\n")
cat("  - Population 45-64 (all ages 45-64 combined)\n")
cat("  - Population 65+ (all ages 65+ combined)\n\n")

cat("Your cancer data has detailed 5-year age groups:\n")
cat("  - 45-49, 50-54, 55-59, 60-64, 65-69, 70-74, etc.\n\n")

cat("OPTIONS:\n")
cat("1. Use this data for approximate normalization (ages 45-64 as one group)\n")
cat("2. Download detailed age data from CDC WONDER for precise matching\n")
cat("   URL: https://wonder.cdc.gov/bridged-race-population.html\n\n")

cat("For now, you can use this for a simplified analysis.\n")
cat("See: visualize_with_simple_population.R\n")
