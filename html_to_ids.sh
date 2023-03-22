#!/bin/bash

# Define the HTML file path
html_file="modsHTML/Test_Serveur_Braquage.html"

# Define the output file path for the IDs
id_output_file=$(basename -s .html "$html_file")_IDs.txt

# Define the output file path for the names
name_output_file=$(basename -s .html "$html_file")_Names.txt

# Use grep to extract the mod IDs from the URLs, remove duplicates and sort
grep -o "id=[0-9]*" "$html_file" | cut -d= -f2 | sort -u > "$id_output_file"

# Loop through each ID and get the name using SteamCMD
while read id; do
    name=$(../steamcmd.sh +login username password +workshop_download_item 107410 "$id" validate +quit | grep "Name:" | cut -d: -f2 | tr -d '[:space:]')
    echo "$name" >> "$name_output_file"
done < "$id_output_file"

echo "Mod names saved to $name_output_file"
