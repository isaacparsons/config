#!/bin/bash

# Array of menu items
menu_items=("Option 1" "Option 2" "Option 3" "Exit")

# Function to draw menu
draw_menu() {
    local current_row=$1

    clear
    echo "Use up/down arrow keys to move and Enter to select:"
    echo

    for i in "${!menu_items[@]}"; do
        if [[ $i -eq $current_row ]]; then
	    tput setaf 0
	    tput setab 7
            echo -e "> ${menu_items[$i]}"
	    tput sgr0
        else
            echo "  ${menu_items[$i]}"
        fi
    done
}

# Function to handle the selected option
handle_option() {
    case $1 in
        0) echo "You selected Option 1" ;;
        1) echo "You selected Option 2" ;;
        2) echo "You selected Option 3" ;;
        3) echo "Exiting..."; exit 0 ;;
    esac
    read -n 1 -s -r -p "Press any key to continue"
}

# Main function
main() {
    local current_row=0
    local key=""

    # Hide cursor
    tput civis
    
    # Capture key presses
    while true; do
        draw_menu $current_row

        # Read a single character
        read -s -n1 key

        # Handle arrow keys and enter
        case "$key" in
            A) ((current_row--)) ;; # Up arrow
            B) ((current_row++)) ;; # Down arrow
            '') # Enter key
                handle_option $current_row
                ;;
            $'\e') # Escape sequence
                read -s -n2 key
                case "$key" in
                    '[A') ((current_row--)) ;; # Up arrow
                    '[B') ((current_row++)) ;; # Down arrow
                esac
                ;;
        esac

        # Ensure current_row stays within bounds
        if (( current_row < 0 )); then
            current_row=$((${#menu_items[@]}-1))
        elif (( current_row >= ${#menu_items[@]} )); then
            current_row=0
        fi
    done

    # Show cursor
    tput cnorm
}

# Run the main function
main
