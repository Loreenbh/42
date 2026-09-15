#!/bin/bash

BASE_URL="http://192.168.56.4/.hidden/"

explore_folder() {
    local url="$1"
    echo "Exploration de : $url"

    items=$(curl -s "$url" | grep -oP '(?<=href=")[^"]+')

    for item in $items; do
        if [[ "$item" == "../" ]]; then
            continue
        fi

        full_url="${url}${item}"

        if [[ "$item" == */ ]]; then
            explore_folder "$full_url"
        else

            if [[ "$item" == "README" ]]; then
                echo -e "\n Contenu de $full_url"
                content=$(curl -s "$full_url")
                echo "$content"
                echo -e "\n--------------------------\n"

                if echo "$content" | grep -qi "flag"; then
                    echo "FLAG FOUND"
                    exit 0
                fi
            fi
        fi
    done
}

explore_folder "$BASE_URL"
