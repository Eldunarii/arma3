#!/bin/bash

# Define the HTML file path
html_file="modsHTML/Test_Serveur_Braquage.html"

# Define the output file path
output_file=$(basename -s .html "$html_file")_Preset.txt

# Use grep to extract the mod IDs from the URLs, remove duplicates and sort
grep -o "id=[0-9]*" "$html_file" | cut -d= -f2 | sort -u > "$output_file"

echo "Mod IDs saved to $output_file"

input_file=output_file

# Define the output file path for the names
output_file="mod_names.txt"

# Loop through each ID and get the name using SteamCMD
while read id; do
    name=$(../steamcmd.sh +login pouletopipo cAssjZ23~~aa +workshop_download_item 107410 "$id" validate +quit | grep "Name:" | cut -d: -f2 | tr -d '[:space:]')
    echo "$name" >> "$output_file"
done < "$input_file"

echo "Mod names saved to $output_file"