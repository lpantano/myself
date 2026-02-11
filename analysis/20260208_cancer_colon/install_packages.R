# Install required R packages for colon cancer analysis

cat("Installing required packages...\n\n")

packages <- c("tidyverse", "ggprism", "scales")

for (pkg in packages) {
  if (!require(pkg, character.only = TRUE, quietly = TRUE)) {
    cat("Installing:", pkg, "\n")
    install.packages(pkg, repos = "https://cloud.r-project.org/")
  } else {
    cat("Already installed:", pkg, "\n")
  }
}

cat("\n=== Package installation complete! ===\n")
cat("You can now run: Rscript visualize_current_data.R\n")
