#!/bin/sh

draw_menu() {
    local current_row=$1
    local i=("$@")
    local items=(${i[@]:1})

    clear
    echo "Use up/down arrow keys to move and Enter to select a file:"
    echo

    for i in "${!items[@]}"; do
        if [[ $i -eq $current_row ]]; then
            tput setaf 0  # Set text color to black
            tput setab 7  # Set background color to white
            echo "> ${items[$i]}"
            tput sgr0     # Reset colors
        else
            echo "  ${items[$i]}"
        fi
    done
}

interactive_menu() {
    local items=("$@")
    local current_row=0
    local key=""
    
    tput civis # Hide cursor
    
    while true; do
        draw_menu "$current_row" "${items[@]}"

        # Read a single character
        read -s -n1 key

        # Handle arrow keys and enter
        case "$key" in
            A) ((current_row--)) ;; # Up arrow
            B) ((current_row++)) ;; # Down arrow
            '') # Enter key
                tput cnorm  # Show cursor
                return "$current_row"
                ;;
            q|Q) # Quit option
                tput cnorm  # Show cursor
                return 255
                ;;
            $'\e') # Escape sequence
                read -s -n2 key
                case "$key" in
                    '[A') ((current_row--)) ;; # Up arrow
                    '[B') ((current_row++)) ;; # Down arrow
                esac
                ;;
        esac

        if (( current_row < 0 )); then
            current_row=$((${#items[@]}-1))
        elif (( current_row >= ${#items[@]} )); then
            current_row=0
        fi
    done
}





db_name=e2e-kit-sqldb-1
directory_path="/Users/isaacparsons/Desktop/db_stuff/db_dumps"
tables=("assets" "asset_types")

if [ ! -d "$directory_path" ]; then
    echo "Error: Directory $directory_path does not exist."
    exit 1
fi

cd "$directory_path" || exit

# Read files into an array
files=()
for file in *; do
    if [ -f "$file" ]; then
        files+=("$file")
    fi
done
files+=("Quit")

interactive_menu "${files[@]}"

selected=$?

if [ $selected -eq 255 ] || [ "${files[selected]}" = "Quit" ]; then
    echo "You chose to quit."
    exit 0
else
   # do stuff
fi




