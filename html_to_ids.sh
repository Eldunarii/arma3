#!/bin/bash

# Define the HTML file path
html_file="modsHTML/Test_Serveur_Braquage.html"

# Define the output file path
output_file=$(basename -s .html "$html_file")_Preset.txt

# Use grep to extract the mod IDs from the URLs, remove duplicates and sort
grep -o "id=[0-9]*" "$html_file" | cut -d= -f2 | sort -u > "$output_file"

echo "Mod IDs saved to $output_file"


name_file=$(basename -s .html "$html_file")_Names.txt

# Use grep to extract the mod IDs and names from the URLs, remove duplicates and sort
grep -o "id=[0-9]*" "$html_file" | cut -d= -f2 | sort -u > "$id_file"
grep -o "title=\"[^\"]*" "$html_file" | cut -d= -f2- | sed 's/\"//g' > "$name_file"

# Combine the IDs and names into a single file
paste "$id_file" "$name_file" > "$(basename -s .txt "$id_file")_with_names.txt"

echo "Mod IDs and names saved to $(basename -s .txt "$id_file")_with_names.txt"