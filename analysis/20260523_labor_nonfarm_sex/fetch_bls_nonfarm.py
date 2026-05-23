import requests
import pandas as pd

URL = "https://api.bls.gov/publicAPI/v2/timeseries/data/"

SERIES = {
    "CES0000000006": "Men",
    "CES0000000007": "Women",
}

payload = {
    "seriesid": list(SERIES.keys()),
    "startyear": "2024",
    "endyear": "2026",
    # "registrationkey": "YOUR_KEY_HERE",  # optional but recommended
}

response = requests.post(URL, json=payload)
response.raise_for_status()
data = response.json()

rows = []
for series in data["Results"]["series"]:
    label = SERIES[series["seriesID"]]
    for item in series["data"]:
        if item["period"].startswith("M"):  # skip annual
            rows.append({
                "series": label,
                "year": int(item["year"]),
                "month": int(item["period"][1:]),
                "value_thousands": int(item["value"].replace(",", "")),
            })

df = pd.DataFrame(rows).sort_values(["series", "year", "month"]).reset_index(drop=True)

# Baseline: Dec 2024
baselines = (
    df[(df["year"] == 2024) & (df["month"] == 12)]
    .set_index("series")["value_thousands"]
)

df["baseline"] = df["series"].map(baselines)
df["cumulative_change_thousands"] = df["value_thousands"] - df["baseline"]

# Filter to Jan 2025 onward
result = df[(df["year"] > 2024) | ((df["year"] == 2024) & (df["month"] == 12))].copy()
result["date"] = pd.to_datetime(result[["year", "month"]].assign(day=1))

print(result[["date", "series", "value_thousands", "cumulative_change_thousands"]].to_string(index=False))

# Save to CSV
result.to_csv("bls_nonfarm_cumulative.csv", index=False)
print("\nSaved to bls_nonfarm_cumulative.csv")
