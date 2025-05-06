#!/bin/bash

get_focused_window_id() {
    gdbus call --session --dest org.gnome.Shell --object-path /org/gnome/Shell/Extensions/Windows --method org.gnome.Shell.Extensions.Windows.List | head -c -4 | tail -c +3 | jq -r '[.[] | select(.focus==true) | .id][0]'
}

get_focused_window_wm_class() {
    gdbus call --session --dest org.gnome.Shell --object-path /org/gnome/Shell/Extensions/Windows --method org.gnome.Shell.Extensions.Windows.List | head -c -4 | tail -c +3 | jq -r '[.[] | select(.focus==true) | .wm_class][0]'
}

get_window_title() {
    gdbus call --session --dest org.gnome.Shell --object-path /org/gnome/Shell/Extensions/Windows --method org.gnome.Shell.Extensions.Windows.GetTitle "$1" | head -c -4 | tail -c +3
}

focus_rider() {
    gdbus call --session --dest org.gnome.Shell --object-path /de/lucaswerkmeister/ActivateWindowByTitle --method de.lucaswerkmeister.ActivateWindowByTitle.activateByWmClass "jetbrains-rider"
}

last_focused_wm_class=""

while true
do
    focused_window_title=$(get_window_title "$(get_focused_window_id)")

    if [ "$last_focused_wm_class" == "jetbrains-rider" ] && [ "$focused_window_title" == "Unity" ]; then
        focus_rider
        sleep 5
    fi
    
    last_focused_wm_class=$(get_focused_window_wm_class)

    sleep 0.1
done
