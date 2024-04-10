#!/bin/bash

if [ "$#" -ne 1 ]; then
    echo "Usage: $0 <folder_path>"
    exit 1
fi

folder_path=$1
images=($(ls "$folder_path"))
total=${#images[@]}
current=0

show_image() {
    kitty +kitten icat "${folder_path}/${images[$current]}"
    if [ $current -eq 0 ]; then
        echo -e "\e[2;33m*This is the first image in the directory.\e[0m"
    elif [ $current -eq $((total - 1)) ]; then
        echo -e "\e[2;33m*This is the last image in the directory.\e[0m"
    fi
}

rotate_image() {
    convert "${folder_path}/${images[$current]}" -rotate $1 "${folder_path}/${images[$current]}"
}

while true; do
    show_image

    # Display the controls
    echo -e "\e[1;37m ─────────────────────────────────────────────────────────────────────────────────\e[0m"
    echo -e "\e[1;37m\e[0m\e[1;33m⬅️  \e[0mPrevious | \e[1;33m➡️  \e[0mNext | \e[1;33m⬆️  \e[0mRotate Clockwise | \e[1;33m⬇️  \e[0mRotate Anticlockwise | \e[1;33mq  \e[0mQuit\e[1;37m\e[0m"
    echo -e "\e[1;37m ─────────────────────────────────────────────────────────────────────────────────\e[0m"



    # Read the input (first character)
    read -rsn1 input

    if [[ $input == $'\x1b' ]]; then
        # Read the next two characters
        read -rsn2 -t 0.1 input
        if [[ $input == '[A' ]]; then
            # Up arrow (rotate clockwise)
            rotate_image 90
        elif [[ $input == '[B' ]]; then
            # Down arrow (rotate anticlockwise)
            rotate_image -90
        elif [[ $input == '[C' ]]; then
            # Right arrow (next image)
            if (( current < total - 1 )); then
                ((current++))
            fi
        elif [[ $input == '[D' ]]; then
            # Left arrow (previous image)
            if (( current > 0 )); then
                ((current--))
            fi
        fi
    elif [[ $input == 'q' ]]; then
        # Quit if 'q' is pressed
        break
    fi
done
