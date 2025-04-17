#!/bin/bash

# Set your CSV file name
CSV_FILE="battery_log.csv"
OUTPUT_IMAGE="battery_plot.png"

# Check if gnuplot is installed
if ! command -v gnuplot &> /dev/null; then
    echo "❌ gnuplot is not installed. Please install it and try again."
    exit 1
fi

# Generate gnuplot script
cat <<EOF | gnuplot
set datafile separator ","
set xdata time
set timefmt "%Y-%m-%d %H:%M:%S"
set format x "%H:%M"
set xlabel "Time"
set ylabel "Battery %"
set title "Battery Percentage Over Time"
set grid
set term png size 1280,720
set output "${OUTPUT_IMAGE}"
plot "${CSV_FILE}" using 1:2 with lines title "Battery %"
EOF

echo "✅ Plot saved as ${OUTPUT_IMAGE}"

