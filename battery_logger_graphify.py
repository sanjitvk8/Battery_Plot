import pandas as pd
import matplotlib.pyplot as plt

# Load data
df = pd.read_csv("battery_log.csv", parse_dates=["timestamp"])

# Plot
plt.figure(figsize=(10, 5))
plt.plot(df["timestamp"], df["battery_percent"], label="Battery %")
plt.xlabel("Time")
plt.ylabel("Battery Percentage")
plt.title("Battery % over Time")
plt.grid(True)
plt.legend()
plt.xticks(rotation=45)
plt.tight_layout()
plt.show()
