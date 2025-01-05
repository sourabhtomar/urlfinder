#!/bin/bash

# Function to fetch URLs for a single domain
fetch_urls() {
    local domain=$1
    local output_file="${domain}_wayback_urls.txt"
    
    echo "Fetching URLs for domain: $domain"
    local url="https://web.archive.org/cdx/search/cdx?url=*.$domain&fl=original&collapse=urlkey"
    
    # Fetch the URLs using curl
    curl -s "$url" -o "$output_file"
    
    # Check if curl was successful
    if [[ $? -eq 0 ]]; then
        echo "URLs for '$domain' saved to '$output_file'."
        echo "Number of URLs saved: $(wc -l < "$output_file")"
    else
        echo "Failed to fetch URLs for '$domain'."
    fi
}

# Display usage instructions
usage() {
    echo "Usage: $0 -d <domain> | -l <list_of_domains_file>"
    echo "  -d <domain>          Fetch URLs for a single domain"
    echo "  -l <list_file>       Fetch URLs for domains listed in a file"
    exit 1
}

# Parse command-line arguments
while getopts "d:l:" opt; do
    case $opt in
        d)  # Single domain
            domain=$OPTARG
            fetch_urls "$domain"
            ;;
        l)  # List of domains
            list_file=$OPTARG
            if [[ -f $list_file ]]; then
                echo "Reading domains from file: $list_file"
                while IFS= read -r domain; do
                    if [[ ! -z $domain ]]; then
                        fetch_urls "$domain"
                    fi
                done < "$list_file"
            else
                echo "File '$list_file' not found."
                exit 1
            fi
            ;;
        *)  # Invalid option
            usage
            ;;
    esac
done

# Check if no arguments were provided
if [[ $# -eq 0 ]]; then
    usage
fi

