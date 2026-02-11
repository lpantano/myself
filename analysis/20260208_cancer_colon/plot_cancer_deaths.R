library(tidyverse)
library(ggprism)
library(grafify)

# Read the data
data <- read_csv("cancer-deaths-2025.csv")

# Reshape data for plotting - exclude "All sites" and convert to long format
plot_data <- data %>%
  filter(cancer_type != "All sites") %>%
  pivot_longer(
    cols = starts_with("age_"),
    names_to = "age_range",
    values_to = "deaths"
  ) %>%
  # Clean up age range labels
  mutate(
    age_range = case_when(
      age_range == "age_15_to_39" ~ "15-39",
      age_range == "age_0_to_49" ~ "0-49",
      age_range == "age_50_to_64" ~ "50-64",
      age_range == "age_65_and_older" ~ "65+",
      age_range == "all_ages" ~ "All ages"
    ),
    # Convert age_range to factor with proper order
    age_range = factor(age_range, levels = c("15-39", "0-49", "50-64", "65+", "All ages")),
    # Handle NA values (convert to 0 for plotting)
    deaths = ifelse(is.na(deaths), 0, deaths)
  )

# Focus on ages 0-49 only
plot_data <- plot_data %>%
  filter(age_range == "0-49")

# Create the plot with cancer types on x-axis
p <- ggplot(plot_data, aes(x = cancer_type, y = deaths, fill = sex)) +
  geom_bar(stat = "identity", position = "stack", width = 0.7) +
  scale_fill_grafify(palette = "kelly") +
  theme_prism(base_size = 21) +
  labs(
    title = "Estimated Cancer Deaths in People Under 50 (2025)",
    x = "",
    y = "Estimated Number of Deaths",
    fill = "Sex",
    caption = "Source: American Cancer Society, 2025"
  ) +
  theme(
    legend.position = "bottom",
    plot.title = element_text(hjust = 0.5, face = "bold"),
    axis.text.x = element_text(angle = 0, hjust = 0.5)
  )

# Save the plot
ggsave("cancer_deaths_plot.png", p, width = 12, height = 12, dpi = 300)
ggsave("cancer_deaths_plot.pdf", p, width = 12, height = 12)

# Display the plot
print(p)

# Print summary statistics
cat("\nSummary by cancer type and sex:\n")
plot_data %>%
  group_by(cancer_type, sex) %>%
  summarise(total_deaths = sum(deaths, na.rm = TRUE), .groups = "drop") %>%
  arrange(cancer_type, sex) %>%
  print()
