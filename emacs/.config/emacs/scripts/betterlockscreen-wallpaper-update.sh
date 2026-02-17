#!/bin/bash

# Function: Read wallpaper from Nitrogen if installed
get_wallpaper_from_nitrogen() {
    local nitrogen_cfg="$HOME/.config/nitrogen/bg-saved.cfg"

    if [[ -f "$nitrogen_cfg" ]]; then
        grep '^file=' "$nitrogen_cfg" | cut -d= -f2
        return 0
    else
        return 1
    fi
}

# Function: Read wallpaper from FEH if installed
get_wallpaper_from_feh() {
    local fehbg="$HOME/.fehbg"

    if [[ -f "$fehbg" ]]; then
        grep feh "$fehbg" | awk '{print $NF}' | tr -d "'"
        return 0
    else
        return 1
    fi
}

echo "Detecting wallpaper source..."

# Priority 1: Nitrogen
WALLPAPER=$(get_wallpaper_from_nitrogen)
if [[ $? -eq 0 ]]; then
    echo "Found Nitrogen wallpaper:"
    echo "$WALLPAPER"
else
    echo "Nitrogen not found. Trying FEH..."
    WALLPAPER=$(get_wallpaper_from_feh)

    if [[ $? -ne 0 || -z "$WALLPAPER" ]]; then
        echo "❌ No wallpaper source found (Nitrogen or FEH)."
        exit 1
    fi

    echo "Found FEH wallpaper:"
    echo "$WALLPAPER"
fi

# Step 3: Update betterlockscreen
echo "Updating betterlockscreen..."
betterlockscreen -u "$WALLPAPER"

if [[ $? -eq 0 ]]; then
    echo "✅ betterlockscreen wallpaper updated."
else
    echo "❌ Failed to update betterlockscreen."
fi
