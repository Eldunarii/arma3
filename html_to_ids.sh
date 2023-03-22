#!/bin/bash

# Define the HTML file path
html_file="modsHTML/mods.html"

# Use grep to extract the mod IDs from the URLs
grep -o "id=[0-9]*" "$html_file" | cut -d= -f2 > mod_ids.txt

echo "Mod IDs saved to mod_ids.txt"