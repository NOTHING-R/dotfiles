#!/bin/bash

TARGET="/usr/share/sddm/themes/tiger/default"
WALLPAPER=""

### --- STEP 1: Try Nitrogen wallpaper first --- ###
if [[ -f "$HOME/.config/nitrogen/bg-saved.cfg" ]]; then
    NITRO_WP=$(grep '^file=' "$HOME/.config/nitrogen/bg-saved.cfg" | cut -d= -f2)

    if [[ -n "$NITRO_WP" && -f "$NITRO_WP" ]]; then
        WALLPAPER="$NITRO_WP"
        echo "✔ Found Nitrogen wallpaper: $WALLPAPER"
    else
        echo "✘ Nitrogen config found but wallpaper missing. Falling back to FEH..."
    fi
else
    echo "✘ Nitrogen not found. Checking FEH..."
fi


### --- STEP 2: FEH fallback --- ###
if [[ -z "$WALLPAPER" ]]; then
    if [[ -f "$HOME/.fehbg" ]]; then
        FEH_WP=$(grep feh "$HOME/.fehbg" | awk '{print $NF}' | tr -d "'")

        if [[ -n "$FEH_WP" && -f "$FEH_WP" ]]; then
            WALLPAPER="$FEH_WP"
            echo "✔ Found FEH wallpaper: $WALLPAPER"
        else
            echo "❌ Error: FEH wallpaper not found in ~/.fehbg"
            exit 1
        fi
    else
        echo "❌ Error: Neither Nitrogen nor FEH wallpaper detected."
        exit 1
    fi
fi


### --- STEP 3: Copy wallpaper to SDDM Tiger theme --- ###
echo "Copying: $WALLPAPER → $TARGET"
sudo cp "$WALLPAPER" "$TARGET"

if [[ $? -eq 0 ]]; then
    echo "✅ Wallpaper updated successfully for SDDM Tiger theme."
else
    echo "❌ Failed to update wallpaper. Check permissions or file path."
fi
